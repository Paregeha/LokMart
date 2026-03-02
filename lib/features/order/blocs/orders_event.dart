import 'package:freezed_annotation/freezed_annotation.dart';

part 'orders_event.freezed.dart';

@freezed
class OrdersEvent with _$OrdersEvent {
  const factory OrdersEvent.fetch({String? status}) = _Fetch;
  const factory OrdersEvent.changeFilter({String? status}) = _ChangeFilter;
}
