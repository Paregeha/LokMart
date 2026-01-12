// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductsFilterImpl _$$ProductsFilterImplFromJson(Map<String, dynamic> json) =>
    _$ProductsFilterImpl(
      minPrice: (json['minPrice'] as num?)?.toDouble() ?? 0.0,
      maxPrice: (json['maxPrice'] as num?)?.toDouble() ?? 300.0,
      categoryId: (json['categoryId'] as num?)?.toInt(),
      categoryTitle: json['categoryTitle'] as String?,
      minRating: (json['minRating'] as num?)?.toDouble(),
      maxRating: (json['maxRating'] as num?)?.toDouble(),
      minDiscountPercent: (json['minDiscountPercent'] as num?)?.toDouble(),
      maxDiscountPercent: (json['maxDiscountPercent'] as num?)?.toDouble(),
      onlyDiscount: json['onlyDiscount'] as bool? ?? false,
      onlyFreeShipping: json['onlyFreeShipping'] as bool? ?? false,
      onlyVoucher: json['onlyVoucher'] as bool? ?? false,
      onlySameDayDelivery: json['onlySameDayDelivery'] as bool? ?? false,
    );

Map<String, dynamic> _$$ProductsFilterImplToJson(
  _$ProductsFilterImpl instance,
) => <String, dynamic>{
  'minPrice': instance.minPrice,
  'maxPrice': instance.maxPrice,
  'categoryId': instance.categoryId,
  'categoryTitle': instance.categoryTitle,
  'minRating': instance.minRating,
  'maxRating': instance.maxRating,
  'minDiscountPercent': instance.minDiscountPercent,
  'maxDiscountPercent': instance.maxDiscountPercent,
  'onlyDiscount': instance.onlyDiscount,
  'onlyFreeShipping': instance.onlyFreeShipping,
  'onlyVoucher': instance.onlyVoucher,
  'onlySameDayDelivery': instance.onlySameDayDelivery,
};
