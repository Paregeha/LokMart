import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/cart_item.dart';

part 'cart_event.freezed.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.load() = _Load;

  const factory CartEvent.add({required int productId, @Default(1) int count}) =
      _Add;

  const factory CartEvent.inc({required CartItem item}) = _Inc;

  const factory CartEvent.dec({required CartItem item}) = _Dec;

  const factory CartEvent.remove({required String cartItemDocumentId}) =
      _Remove;

  const factory CartEvent.clear() = _Clear;
}
