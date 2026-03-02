import 'package:latlong2/latlong.dart';
import '../../order/models/order.dart';

class TrackOrderState {
  const TrackOrderState({
    this.loading = false,
    this.error,
    this.order,
    this.route = const <LatLng>[],
    this.client,
    this.courier,
    this.passedIndex = 0,
    this.locked = false,
    this.pendingDecision = false,
    this.dialogShown = false,

    this.showArrivedSnack = false,

    this.notifyArrived = false,

    this.arrivedNotified = false,
  });

  final bool loading;
  final String? error;
  final OrderModel? order;

  final List<LatLng> route;

  final LatLng? client;

  final LatLng? courier;

  final int passedIndex;

  final bool locked;
  final bool pendingDecision;
  final bool dialogShown;

  final bool showArrivedSnack;

  final bool notifyArrived;

  final bool arrivedNotified;

  bool get hasRoute => route.length >= 2;

  bool get atEnd => hasRoute && passedIndex >= route.length - 1;

  LatLng? get clientPoint => client ?? (route.isNotEmpty ? route.last : null);

  List<LatLng> get remainingRoute {
    if (!hasRoute) return const <LatLng>[];
    final start = passedIndex.clamp(0, route.length - 1);
    return route.sublist(start);
  }

  TrackOrderState copyWith({
    bool? loading,
    String? error,
    bool clearError = false,
    OrderModel? order,
    List<LatLng>? route,
    LatLng? client,
    LatLng? courier,
    int? passedIndex,
    bool? locked,
    bool? pendingDecision,
    bool? dialogShown,
    bool? showArrivedSnack,
    bool? notifyArrived,
    bool? arrivedNotified,
  }) {
    return TrackOrderState(
      loading: loading ?? this.loading,
      error: clearError ? null : (error ?? this.error),
      order: order ?? this.order,
      route: route ?? this.route,
      client: client ?? this.client,
      courier: courier ?? this.courier,
      passedIndex: passedIndex ?? this.passedIndex,
      locked: locked ?? this.locked,
      pendingDecision: pendingDecision ?? this.pendingDecision,
      dialogShown: dialogShown ?? this.dialogShown,
      showArrivedSnack: showArrivedSnack ?? this.showArrivedSnack,
      notifyArrived: notifyArrived ?? this.notifyArrived,
      arrivedNotified: arrivedNotified ?? this.arrivedNotified,
    );
  }
}
