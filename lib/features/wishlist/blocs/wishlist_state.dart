import 'package:freezed_annotation/freezed_annotation.dart';

part 'wishlist_state.freezed.dart';

@freezed
class WishlistState with _$WishlistState {
  const factory WishlistState.initial() = _Initial;

  const factory WishlistState.loading({
    @Default(false) bool silent,
    @Default(<int>{}) Set<int> ids,
  }) = _Loading;

  const factory WishlistState.ready({required Set<int> ids}) = _Ready;

  const factory WishlistState.failure({
    required String message,
    @Default(<int>{}) Set<int> ids,
  }) = _Failure;
}
