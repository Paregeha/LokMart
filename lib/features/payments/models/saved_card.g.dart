// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SavedCardImpl _$$SavedCardImplFromJson(Map<String, dynamic> json) =>
    _$SavedCardImpl(
      id: (json['id'] as num).toInt(),
      documentId: json['documentId'] as String,
      paymentMethodId: json['paymentMethodId'] as String,
      brand: json['brand'] as String,
      last4: json['last4'] as String,
      expMonth: (json['expMonth'] as num).toInt(),
      expYear: (json['expYear'] as num).toInt(),
      isDefault: json['isDefault'] as bool,
    );

Map<String, dynamic> _$$SavedCardImplToJson(_$SavedCardImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'documentId': instance.documentId,
      'paymentMethodId': instance.paymentMethodId,
      'brand': instance.brand,
      'last4': instance.last4,
      'expMonth': instance.expMonth,
      'expYear': instance.expYear,
      'isDefault': instance.isDefault,
    };
