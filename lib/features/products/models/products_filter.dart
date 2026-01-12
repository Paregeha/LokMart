import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_filter.freezed.dart';
part 'products_filter.g.dart';

@freezed
class ProductsFilter with _$ProductsFilter {
  const factory ProductsFilter({
    // PRICE
    @Default(0.0) double minPrice,
    @Default(300.0) double maxPrice,

    // CATEGORY
    // ✅ для фільтрації по ID (коли ти реально знаєш id категорії, напр. з CategoryItemsPage)
    int? categoryId,

    // ✅ для фільтрації по TITLE (коли в UI в тебе просто "Fresh Fruits/Chicken/..." без id)
    String? categoryTitle,

    // RATING (у тебе поле в Strapi "raiting")
    double? minRating,
    double? maxRating,

    // DISCOUNT PERCENT (працюватиме тільки якщо в Strapi є поле discountPercent)
    double? minDiscountPercent,
    double? maxDiscountPercent,

    // OTHERS (працюватиме тільки якщо в Strapi є відповідні поля)
    @Default(false) bool onlyDiscount,
    @Default(false) bool onlyFreeShipping,
    @Default(false) bool onlyVoucher,
    @Default(false) bool onlySameDayDelivery,
  }) = _ProductsFilter;

  factory ProductsFilter.fromJson(Map<String, dynamic> json) =>
      _$ProductsFilterFromJson(json);
}
