import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/order.dart';

part 'orders_state.freezed.dart';

@freezed
class OrdersState with _$OrdersState {
  const factory OrdersState({
    @Default(false) bool loading,
    String? error,
    @Default(<OrderModel>[]) List<OrderModel> orders,
    String? statusFilter,
  }) = _OrdersState;
}
