// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductsImpl _$$ProductsImplFromJson(Map<String, dynamic> json) =>
    _$ProductsImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      price: (json['price'] as num?)?.toDouble(),
      count: (json['count'] as num?)?.toInt(),
      priceWithDiscount: (json['priceWithDiscount'] as num?)?.toDouble(),
      isDiscount: json['isDiscount'] as bool?,
      slug: json['slug'] as String?,
      photoUrl: json['photoUrl'] as String?,
      categoryId: (json['categoryId'] as num?)?.toInt(),
      categoryName: json['categoryName'] as String?,
      documentId: json['documentId'] as String?,
      description: json['description'] as String?,
      raiting: (json['raiting'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ProductsImplToJson(_$ProductsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'count': instance.count,
      'priceWithDiscount': instance.priceWithDiscount,
      'isDiscount': instance.isDiscount,
      'slug': instance.slug,
      'photoUrl': instance.photoUrl,
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'documentId': instance.documentId,
      'description': instance.description,
      'raiting': instance.raiting,
    };
