// track_order_bloc.dart
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';

import '../../order/data/orders_repository.dart';
import '../../order/models/order.dart';
import '../track_order_cache.dart';
import 'track_order_event.dart';
import 'track_order_state.dart';

class TrackOrderBloc extends Bloc<TrackOrderEvent, TrackOrderState> {
  TrackOrderBloc({
    required this.documentId,
    required OrdersRepository ordersRepo,
  }) : _ordersRepo = ordersRepo,
       super(const TrackOrderState()) {
    on<TrackOrderBoot>(_onBoot);
    on<TrackOrderPollTick>(_onPollTick);
    on<TrackOrderDragUpdate>(_onDragUpdate);
    on<TrackOrderDragEnd>(_onDragEnd);
    on<TrackOrderDialogOpened>(_onDialogOpened);
    on<TrackOrderNotificationShown>(_onNotificationShown);
    on<TrackOrderFinishAndLock>(_onFinishAndLock);
  }

  final String documentId;
  final OrdersRepository _ordersRepo;

  Timer? _poll;

  @override
  Future<void> close() {
    _poll?.cancel();
    return super.close();
  }

  void _saveCache(TrackOrderState s) {
    TrackOrderCache.instance.put(
      documentId,
      TrackOrderSnapshot(
        route: s.route,
        passedIndex: s.passedIndex,
        courier: s.courier,
        pendingDecision: s.pendingDecision,
        dialogAlreadyShown: s.dialogShown,
      ),
    );
  }

  bool _isLockedByOrder(OrderModel? o) {
    if (o == null) return false;
    final status = o.orderStatus.trim().toLowerCase();
    if (o.clientConfirmed == true) return true;
    if (status == 'completed') return true;
    if (status == 'cancelled' || status == 'canceled') return true;
    return false;
  }

  Future<void> _onBoot(
    TrackOrderBoot event,
    Emitter<TrackOrderState> emit,
  ) async {
    emit(state.copyWith(loading: true, clearError: true));

    final snap = TrackOrderCache.instance.get(documentId);
    if (snap != null) {
      emit(
        state.copyWith(
          loading: false,
          route: snap.route,
          passedIndex: snap.passedIndex,
          courier: snap.courier,
          pendingDecision: snap.pendingDecision,
          dialogShown: snap.dialogAlreadyShown,
          showArrivedSnack: false,
          notifyArrived: false,
          clearError: true,
        ),
      );
    }

    await _loadOnce(emit, silent: false);

    _poll?.cancel();
    _poll = Timer.periodic(const Duration(seconds: 4), (_) {
      add(const TrackOrderPollTick());
    });

    _saveCache(state);
  }

  Future<void> _onPollTick(
    TrackOrderPollTick event,
    Emitter<TrackOrderState> emit,
  ) async {
    await _loadOnce(emit, silent: true);
  }

  Future<void> _loadOnce(
    Emitter<TrackOrderState> emit, {
    required bool silent,
  }) async {
    try {
      final o = await _ordersRepo.fetchMyOrder(documentId: documentId);
      final locked = _isLockedByOrder(o);

      var route = state.route;
      if (route.isEmpty && o.routePoints.isNotEmpty) {
        route = o.routePoints.map((p) => LatLng(p['lat']!, p['lng']!)).toList();
      }

      final clientPoint = route.isNotEmpty ? route.last : state.client;

      var courier = state.courier;
      var passedIndex = state.passedIndex;

      if (route.isNotEmpty && courier == null) {
        courier = route.first;
        passedIndex = 0;
      }

      if (route.isNotEmpty) {
        passedIndex = passedIndex.clamp(0, route.length - 1);
      } else {
        passedIndex = 0;
      }

      final pendingDecision = locked ? false : state.pendingDecision;
      final arrivedNotified = locked ? false : state.arrivedNotified;

      if (emit.isDone) return;

      emit(
        state.copyWith(
          loading: silent ? state.loading : false,
          clearError: true,
          order: o,
          route: route,
          client: clientPoint,
          courier: courier,
          passedIndex: passedIndex,
          locked: locked,
          pendingDecision: pendingDecision,
          showArrivedSnack: false,
          // polling must never trigger notification
          notifyArrived: false,
          arrivedNotified: arrivedNotified,
        ),
      );

      _saveCache(state);
    } catch (e) {
      if (emit.isDone) return;
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }

  int _closestRouteIndex(LatLng p) {
    final route = state.route;
    if (route.isEmpty) return 0;

    final dist = const Distance();
    var bestI = 0;
    var bestD = double.infinity;

    for (var i = 0; i < route.length; i++) {
      final d = dist(p, route[i]);
      if (d < bestD) {
        bestD = d;
        bestI = i;
      }
    }
    return bestI;
  }

  void _onDragUpdate(
    TrackOrderDragUpdate event,
    Emitter<TrackOrderState> emit,
  ) {
    if (state.locked) return;
    if (!state.hasRoute) return;

    final i = _closestRouteIndex(event.rawPoint);
    final snapped = state.route[i];

    final atEnd = i >= state.route.length - 1;
    final needsDecision = atEnd && (state.order?.clientConfirmed != true);

    final shouldNotify =
        needsDecision && !state.dialogShown && !state.arrivedNotified;

    final movedAwayFromEnd = !needsDecision;
    final nextArrivedNotified =
        movedAwayFromEnd ? false : (state.arrivedNotified || shouldNotify);

    emit(
      state.copyWith(
        courier: snapped,
        passedIndex: i,
        pendingDecision: needsDecision,
        showArrivedSnack: false,
        notifyArrived: shouldNotify,
        arrivedNotified: nextArrivedNotified,
        clearError: true,
      ),
    );

    _saveCache(state);
  }

  void _onDragEnd(TrackOrderDragEnd event, Emitter<TrackOrderState> emit) {
    _saveCache(state);
  }

  void _onDialogOpened(
    TrackOrderDialogOpened event,
    Emitter<TrackOrderState> emit,
  ) {
    emit(
      state.copyWith(
        showArrivedSnack: false,
        dialogShown: true,
        notifyArrived: false,
        arrivedNotified: true,
      ),
    );
    _saveCache(state);
  }

  void _onNotificationShown(
    TrackOrderNotificationShown event,
    Emitter<TrackOrderState> emit,
  ) {
    if (!state.notifyArrived) return;
    emit(state.copyWith(notifyArrived: false, arrivedNotified: true));
    _saveCache(state);
  }

  void _onFinishAndLock(
    TrackOrderFinishAndLock event,
    Emitter<TrackOrderState> emit,
  ) {
    emit(
      state.copyWith(
        locked: true,
        pendingDecision: false,
        showArrivedSnack: false,
        notifyArrived: false,
        arrivedNotified: false,
      ),
    );
    TrackOrderCache.instance.clear(documentId);
  }
}
