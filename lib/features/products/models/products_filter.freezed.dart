// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProductsFilter _$ProductsFilterFromJson(Map<String, dynamic> json) {
  return _ProductsFilter.fromJson(json);
}

/// @nodoc
mixin _$ProductsFilter {
  // PRICE
  double get minPrice => throw _privateConstructorUsedError;
  double get maxPrice => throw _privateConstructorUsedError; // CATEGORY
  // ✅ для фільтрації по ID (коли ти реально знаєш id категорії, напр. з CategoryItemsPage)
  int? get categoryId =>
      throw _privateConstructorUsedError; // ✅ для фільтрації по TITLE (коли в UI в тебе просто "Fresh Fruits/Chicken/..." без id)
  String? get categoryTitle =>
      throw _privateConstructorUsedError; // RATING (у тебе поле в Strapi "raiting")
  double? get minRating => throw _privateConstructorUsedError;
  double? get maxRating =>
      throw _privateConstructorUsedError; // DISCOUNT PERCENT (працюватиме тільки якщо в Strapi є поле discountPercent)
  double? get minDiscountPercent => throw _privateConstructorUsedError;
  double? get maxDiscountPercent =>
      throw _privateConstructorUsedError; // OTHERS (працюватиме тільки якщо в Strapi є відповідні поля)
  bool get onlyDiscount => throw _privateConstructorUsedError;
  bool get onlyFreeShipping => throw _privateConstructorUsedError;
  bool get onlyVoucher => throw _privateConstructorUsedError;
  bool get onlySameDayDelivery => throw _privateConstructorUsedError;

  /// Serializes this ProductsFilter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductsFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductsFilterCopyWith<ProductsFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsFilterCopyWith<$Res> {
  factory $ProductsFilterCopyWith(
    ProductsFilter value,
    $Res Function(ProductsFilter) then,
  ) = _$ProductsFilterCopyWithImpl<$Res, ProductsFilter>;
  @useResult
  $Res call({
    double minPrice,
    double maxPrice,
    int? categoryId,
    String? categoryTitle,
    double? minRating,
    double? maxRating,
    double? minDiscountPercent,
    double? maxDiscountPercent,
    bool onlyDiscount,
    bool onlyFreeShipping,
    bool onlyVoucher,
    bool onlySameDayDelivery,
  });
}

/// @nodoc
class _$ProductsFilterCopyWithImpl<$Res, $Val extends ProductsFilter>
    implements $ProductsFilterCopyWith<$Res> {
  _$ProductsFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductsFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minPrice = null,
    Object? maxPrice = null,
    Object? categoryId = freezed,
    Object? categoryTitle = freezed,
    Object? minRating = freezed,
    Object? maxRating = freezed,
    Object? minDiscountPercent = freezed,
    Object? maxDiscountPercent = freezed,
    Object? onlyDiscount = null,
    Object? onlyFreeShipping = null,
    Object? onlyVoucher = null,
    Object? onlySameDayDelivery = null,
  }) {
    return _then(
      _value.copyWith(
            minPrice:
                null == minPrice
                    ? _value.minPrice
                    : minPrice // ignore: cast_nullable_to_non_nullable
                        as double,
            maxPrice:
                null == maxPrice
                    ? _value.maxPrice
                    : maxPrice // ignore: cast_nullable_to_non_nullable
                        as double,
            categoryId:
                freezed == categoryId
                    ? _value.categoryId
                    : categoryId // ignore: cast_nullable_to_non_nullable
                        as int?,
            categoryTitle:
                freezed == categoryTitle
                    ? _value.categoryTitle
                    : categoryTitle // ignore: cast_nullable_to_non_nullable
                        as String?,
            minRating:
                freezed == minRating
                    ? _value.minRating
                    : minRating // ignore: cast_nullable_to_non_nullable
                        as double?,
            maxRating:
                freezed == maxRating
                    ? _value.maxRating
                    : maxRating // ignore: cast_nullable_to_non_nullable
                        as double?,
            minDiscountPercent:
                freezed == minDiscountPercent
                    ? _value.minDiscountPercent
                    : minDiscountPercent // ignore: cast_nullable_to_non_nullable
                        as double?,
            maxDiscountPercent:
                freezed == maxDiscountPercent
                    ? _value.maxDiscountPercent
                    : maxDiscountPercent // ignore: cast_nullable_to_non_nullable
                        as double?,
            onlyDiscount:
                null == onlyDiscount
                    ? _value.onlyDiscount
                    : onlyDiscount // ignore: cast_nullable_to_non_nullable
                        as bool,
            onlyFreeShipping:
                null == onlyFreeShipping
                    ? _value.onlyFreeShipping
                    : onlyFreeShipping // ignore: cast_nullable_to_non_nullable
                        as bool,
            onlyVoucher:
                null == onlyVoucher
                    ? _value.onlyVoucher
                    : onlyVoucher // ignore: cast_nullable_to_non_nullable
                        as bool,
            onlySameDayDelivery:
                null == onlySameDayDelivery
                    ? _value.onlySameDayDelivery
                    : onlySameDayDelivery // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductsFilterImplCopyWith<$Res>
    implements $ProductsFilterCopyWith<$Res> {
  factory _$$ProductsFilterImplCopyWith(
    _$ProductsFilterImpl value,
    $Res Function(_$ProductsFilterImpl) then,
  ) = __$$ProductsFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double minPrice,
    double maxPrice,
    int? categoryId,
    String? categoryTitle,
    double? minRating,
    double? maxRating,
    double? minDiscountPercent,
    double? maxDiscountPercent,
    bool onlyDiscount,
    bool onlyFreeShipping,
    bool onlyVoucher,
    bool onlySameDayDelivery,
  });
}

/// @nodoc
class __$$ProductsFilterImplCopyWithImpl<$Res>
    extends _$ProductsFilterCopyWithImpl<$Res, _$ProductsFilterImpl>
    implements _$$ProductsFilterImplCopyWith<$Res> {
  __$$ProductsFilterImplCopyWithImpl(
    _$ProductsFilterImpl _value,
    $Res Function(_$ProductsFilterImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductsFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minPrice = null,
    Object? maxPrice = null,
    Object? categoryId = freezed,
    Object? categoryTitle = freezed,
    Object? minRating = freezed,
    Object? maxRating = freezed,
    Object? minDiscountPercent = freezed,
    Object? maxDiscountPercent = freezed,
    Object? onlyDiscount = null,
    Object? onlyFreeShipping = null,
    Object? onlyVoucher = null,
    Object? onlySameDayDelivery = null,
  }) {
    return _then(
      _$ProductsFilterImpl(
        minPrice:
            null == minPrice
                ? _value.minPrice
                : minPrice // ignore: cast_nullable_to_non_nullable
                    as double,
        maxPrice:
            null == maxPrice
                ? _value.maxPrice
                : maxPrice // ignore: cast_nullable_to_non_nullable
                    as double,
        categoryId:
            freezed == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                    as int?,
        categoryTitle:
            freezed == categoryTitle
                ? _value.categoryTitle
                : categoryTitle // ignore: cast_nullable_to_non_nullable
                    as String?,
        minRating:
            freezed == minRating
                ? _value.minRating
                : minRating // ignore: cast_nullable_to_non_nullable
                    as double?,
        maxRating:
            freezed == maxRating
                ? _value.maxRating
                : maxRating // ignore: cast_nullable_to_non_nullable
                    as double?,
        minDiscountPercent:
            freezed == minDiscountPercent
                ? _value.minDiscountPercent
                : minDiscountPercent // ignore: cast_nullable_to_non_nullable
                    as double?,
        maxDiscountPercent:
            freezed == maxDiscountPercent
                ? _value.maxDiscountPercent
                : maxDiscountPercent // ignore: cast_nullable_to_non_nullable
                    as double?,
        onlyDiscount:
            null == onlyDiscount
                ? _value.onlyDiscount
                : onlyDiscount // ignore: cast_nullable_to_non_nullable
                    as bool,
        onlyFreeShipping:
            null == onlyFreeShipping
                ? _value.onlyFreeShipping
                : onlyFreeShipping // ignore: cast_nullable_to_non_nullable
                    as bool,
        onlyVoucher:
            null == onlyVoucher
                ? _value.onlyVoucher
                : onlyVoucher // ignore: cast_nullable_to_non_nullable
                    as bool,
        onlySameDayDelivery:
            null == onlySameDayDelivery
                ? _value.onlySameDayDelivery
                : onlySameDayDelivery // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductsFilterImpl implements _ProductsFilter {
  const _$ProductsFilterImpl({
    this.minPrice = 0.0,
    this.maxPrice = 300.0,
    this.categoryId,
    this.categoryTitle,
    this.minRating,
    this.maxRating,
    this.minDiscountPercent,
    this.maxDiscountPercent,
    this.onlyDiscount = false,
    this.onlyFreeShipping = false,
    this.onlyVoucher = false,
    this.onlySameDayDelivery = false,
  });

  factory _$ProductsFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductsFilterImplFromJson(json);

  // PRICE
  @override
  @JsonKey()
  final double minPrice;
  @override
  @JsonKey()
  final double maxPrice;
  // CATEGORY
  // ✅ для фільтрації по ID (коли ти реально знаєш id категорії, напр. з CategoryItemsPage)
  @override
  final int? categoryId;
  // ✅ для фільтрації по TITLE (коли в UI в тебе просто "Fresh Fruits/Chicken/..." без id)
  @override
  final String? categoryTitle;
  // RATING (у тебе поле в Strapi "raiting")
  @override
  final double? minRating;
  @override
  final double? maxRating;
  // DISCOUNT PERCENT (працюватиме тільки якщо в Strapi є поле discountPercent)
  @override
  final double? minDiscountPercent;
  @override
  final double? maxDiscountPercent;
  // OTHERS (працюватиме тільки якщо в Strapi є відповідні поля)
  @override
  @JsonKey()
  final bool onlyDiscount;
  @override
  @JsonKey()
  final bool onlyFreeShipping;
  @override
  @JsonKey()
  final bool onlyVoucher;
  @override
  @JsonKey()
  final bool onlySameDayDelivery;

  @override
  String toString() {
    return 'ProductsFilter(minPrice: $minPrice, maxPrice: $maxPrice, categoryId: $categoryId, categoryTitle: $categoryTitle, minRating: $minRating, maxRating: $maxRating, minDiscountPercent: $minDiscountPercent, maxDiscountPercent: $maxDiscountPercent, onlyDiscount: $onlyDiscount, onlyFreeShipping: $onlyFreeShipping, onlyVoucher: $onlyVoucher, onlySameDayDelivery: $onlySameDayDelivery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsFilterImpl &&
            (identical(other.minPrice, minPrice) ||
                other.minPrice == minPrice) &&
            (identical(other.maxPrice, maxPrice) ||
                other.maxPrice == maxPrice) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryTitle, categoryTitle) ||
                other.categoryTitle == categoryTitle) &&
            (identical(other.minRating, minRating) ||
                other.minRating == minRating) &&
            (identical(other.maxRating, maxRating) ||
                other.maxRating == maxRating) &&
            (identical(other.minDiscountPercent, minDiscountPercent) ||
                other.minDiscountPercent == minDiscountPercent) &&
            (identical(other.maxDiscountPercent, maxDiscountPercent) ||
                other.maxDiscountPercent == maxDiscountPercent) &&
            (identical(other.onlyDiscount, onlyDiscount) ||
                other.onlyDiscount == onlyDiscount) &&
            (identical(other.onlyFreeShipping, onlyFreeShipping) ||
                other.onlyFreeShipping == onlyFreeShipping) &&
            (identical(other.onlyVoucher, onlyVoucher) ||
                other.onlyVoucher == onlyVoucher) &&
            (identical(other.onlySameDayDelivery, onlySameDayDelivery) ||
                other.onlySameDayDelivery == onlySameDayDelivery));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    minPrice,
    maxPrice,
    categoryId,
    categoryTitle,
    minRating,
    maxRating,
    minDiscountPercent,
    maxDiscountPercent,
    onlyDiscount,
    onlyFreeShipping,
    onlyVoucher,
    onlySameDayDelivery,
  );

  /// Create a copy of ProductsFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductsFilterImplCopyWith<_$ProductsFilterImpl> get copyWith =>
      __$$ProductsFilterImplCopyWithImpl<_$ProductsFilterImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductsFilterImplToJson(this);
  }
}

abstract class _ProductsFilter implements ProductsFilter {
  const factory _ProductsFilter({
    final double minPrice,
    final double maxPrice,
    final int? categoryId,
    final String? categoryTitle,
    final double? minRating,
    final double? maxRating,
    final double? minDiscountPercent,
    final double? maxDiscountPercent,
    final bool onlyDiscount,
    final bool onlyFreeShipping,
    final bool onlyVoucher,
    final bool onlySameDayDelivery,
  }) = _$ProductsFilterImpl;

  factory _ProductsFilter.fromJson(Map<String, dynamic> json) =
      _$ProductsFilterImpl.fromJson;

  // PRICE
  @override
  double get minPrice;
  @override
  double get maxPrice; // CATEGORY
  // ✅ для фільтрації по ID (коли ти реально знаєш id категорії, напр. з CategoryItemsPage)
  @override
  int? get categoryId; // ✅ для фільтрації по TITLE (коли в UI в тебе просто "Fresh Fruits/Chicken/..." без id)
  @override
  String? get categoryTitle; // RATING (у тебе поле в Strapi "raiting")
  @override
  double? get minRating;
  @override
  double? get maxRating; // DISCOUNT PERCENT (працюватиме тільки якщо в Strapi є поле discountPercent)
  @override
  double? get minDiscountPercent;
  @override
  double? get maxDiscountPercent; // OTHERS (працюватиме тільки якщо в Strapi є відповідні поля)
  @override
  bool get onlyDiscount;
  @override
  bool get onlyFreeShipping;
  @override
  bool get onlyVoucher;
  @override
  bool get onlySameDayDelivery;

  /// Create a copy of ProductsFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductsFilterImplCopyWith<_$ProductsFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
