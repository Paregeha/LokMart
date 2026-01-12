import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/saved_card.dart';

part 'payment_methods_state.freezed.dart';

@freezed
class PaymentMethodsState with _$PaymentMethodsState {
  const factory PaymentMethodsState({
    @Default(false) bool loading,
    @Default([]) List<SavedCard> cards,
    int? selectedId,
    String? error,
  }) = _PaymentMethodsState;
}
