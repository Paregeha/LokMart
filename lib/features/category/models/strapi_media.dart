class StrapiMedia {
  final int id;
  final String url;
  final String? mime;
  final int? width;
  final int? height;
  final int? size;

  const StrapiMedia({
    required this.id,
    required this.url,
    this.mime,
    this.width,
    this.height,
    this.size,
  });

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
