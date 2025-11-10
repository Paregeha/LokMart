// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'strapi_media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StrapiMediaImpl _$$StrapiMediaImplFromJson(Map<String, dynamic> json) =>
    _$StrapiMediaImpl(
      id: (json['id'] as num).toInt(),
      url: json['url'] as String,
      mime: json['mime'] as String?,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      size: (json['size'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$StrapiMediaImplToJson(_$StrapiMediaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'mime': instance.mime,
      'width': instance.width,
      'height': instance.height,
      'size': instance.size,
    };
