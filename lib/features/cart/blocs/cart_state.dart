import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/cart_item.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  const factory CartState.loading() = _Loading;
  const factory CartState.failure(String message) = _Failure;

  const factory CartState.success({
    required List<CartItem> items,
    required double total,
  }) = _Success;
}
