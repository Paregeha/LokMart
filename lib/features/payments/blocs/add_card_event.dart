import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_card_event.freezed.dart';

@freezed
class AddCardEvent with _$AddCardEvent {
  const factory AddCardEvent.submit({
    required String cardholderName,
    @Default(true) bool setDefault,
  }) = _Submit;
}
