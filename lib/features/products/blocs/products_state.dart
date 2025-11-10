import 'package:flutter_base_architecture/features/products/models/products.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_state.freezed.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState.initial() = _Initial;

  const factory ProductsState.loading({@Default(false) bool silent}) = _Loading;

  const factory ProductsState.success({required List<Products> products}) =
      _Success;

  const factory ProductsState.failure({required String message}) = _Failure;

  const factory ProductsState.loadingMore({
    required List<Products> products,
    @Default(false) bool silent,
  }) = _LoadingMore;
}
