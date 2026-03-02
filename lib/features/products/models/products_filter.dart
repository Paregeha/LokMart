import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_filter.freezed.dart';
part 'products_filter.g.dart';

@freezed
class ProductsFilter with _$ProductsFilter {
  const factory ProductsFilter({
    @Default(0.0) double minPrice,
    @Default(300.0) double maxPrice,

    int? categoryId,

    String? categoryTitle,

    double? minRating,
    double? maxRating,

    double? minDiscountPercent,
    double? maxDiscountPercent,

    @Default(false) bool onlyDiscount,
    @Default(false) bool onlyFreeShipping,
    @Default(false) bool onlyVoucher,
    @Default(false) bool onlySameDayDelivery,
  }) = _ProductsFilter;

  factory ProductsFilter.fromJson(Map<String, dynamic> json) =>
      _$ProductsFilterFromJson(json);
}
