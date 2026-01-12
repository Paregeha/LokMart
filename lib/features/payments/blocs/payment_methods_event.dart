import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_methods_event.freezed.dart';

@freezed
class PaymentMethodsEvent with _$PaymentMethodsEvent {
  const factory PaymentMethodsEvent.fetch() = _Fetch;
  const factory PaymentMethodsEvent.select(int id) = _Select;
  const factory PaymentMethodsEvent.setDefault(int id) = _SetDefault;
  const factory PaymentMethodsEvent.delete(int id) = _Delete;
}
