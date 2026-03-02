import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/orders_repository.dart';
import 'orders_event.dart';
import 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersBloc(this._repo) : super(const OrdersState()) {
    on<OrdersEvent>(
      (event, emit) => event.map(
        fetch: (e) => _fetch(e.status, emit),
        changeFilter: (e) => add(OrdersEvent.fetch(status: e.status)),
      ),
    );
  }

  final OrdersRepository _repo;

  Future<void> _fetch(String? status, Emitter<OrdersState> emit) async {
    emit(state.copyWith(loading: true, error: null));
    try {
      final items = await _repo.fetchMyOrders(status: status);
      emit(state.copyWith(loading: false, orders: items, statusFilter: status));
    } catch (err) {
      emit(state.copyWith(loading: false, error: err.toString()));
    }
  }
}
