// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      slug: json['slug'] as String?,
      description:
          (json['description'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList(),
      photoUrl: json['photoUrl'] as String?,
      itemCount: (json['itemCount'] as num?)?.toInt(),
      documentId: json['documentId'] as String?,
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'description': instance.description,
      'photoUrl': instance.photoUrl,
      'itemCount': instance.itemCount,
      'documentId': instance.documentId,
    };
