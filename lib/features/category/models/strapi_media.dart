import 'package:freezed_annotation/freezed_annotation.dart';

part 'strapi_media.freezed.dart';
part 'strapi_media.g.dart';

@freezed
class StrapiMedia with _$StrapiMedia {
  const factory StrapiMedia({
    required int id,
    required String url,
    String? mime,
    int? width,
    int? height,
    int? size,
  }) = _StrapiMedia;

  factory StrapiMedia.fromJson(Map<String, dynamic> json) =>
      _$StrapiMediaFromJson(json);

  factory StrapiMedia.fromStrapi(Map<String, dynamic> json) {
    final attrs = (json['attributes'] ?? {}) as Map<String, dynamic>;
    return StrapiMedia(
      id: json['id'] as int,
      url: attrs['url'] as String,
      mime: attrs['mime'] as String?,
      width: (attrs['width'] as num?)?.toInt(),
      height: (attrs['height'] as num?)?.toInt(),
      size: (attrs['size'] as num?)?.toInt(),
    );
  }
}
