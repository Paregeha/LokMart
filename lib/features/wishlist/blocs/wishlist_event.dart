import 'package:freezed_annotation/freezed_annotation.dart';

part 'wishlist_event.freezed.dart';

@freezed
sealed class WishlistEvent with _$WishlistEvent {
  const factory WishlistEvent.load() = _Load;
  const factory WishlistEvent.toggle({required int productId}) = _Toggle;
  const factory WishlistEvent.refresh() = _Refresh;
}
