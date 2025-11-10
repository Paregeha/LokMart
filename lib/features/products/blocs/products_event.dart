import 'package:freezed_annotation/freezed_annotation.dart';
part 'products_event.freezed.dart';

@freezed
sealed class ProductsEvent with _$ProductsEvent {
  const factory ProductsEvent.fetchFirst({
    @Default(25) int pageSize,
    String? sort,
    int? categoryId,
    String? search,
  }) = _FetchFirst;

  const factory ProductsEvent.loadMore() = _LoadMore;

  const factory ProductsEvent.refresh() = _Refresh;
}
