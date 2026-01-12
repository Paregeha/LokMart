import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_card_state.freezed.dart';

@freezed
class AddCardState with _$AddCardState {
  const factory AddCardState({
    @Default(false) bool loading,
    @Default(false) bool success,
    String? error,
  }) = _AddCardState;
}
