import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  const factory Category({
    required int id,
    required String title,
    String? slug,
    List<Map<String, dynamic>>? description,
    String? photoUrl,
    int? itemCount,
    String? documentId,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  factory Category.fromStrapi(Map<String, dynamic> json) {
    final hasAttrs = json['attributes'] is Map<String, dynamic>;
    final src = hasAttrs ? (json['attributes'] as Map<String, dynamic>) : json;

    String? url;
    final photo = src['photo'];
    if (photo is Map<String, dynamic>) {
      url = photo['url'] as String?;
      final data = photo['data'];
      if (url == null && data is Map<String, dynamic>) {
        url = (data['attributes'] as Map?)?['url'] as String?;
      }
    }

    List<Map<String, dynamic>>? blocks;
    final d = src['description'];
    if (d is List) blocks = d.cast<Map<String, dynamic>>();

    return Category(
      id: (json['id'] as num).toInt(),
      title: src['title'] as String? ?? '—',
      slug: src['slug'] as String?,
      description: blocks,
      photoUrl: url,
      itemCount:
          (src['ItemCount'] as num?)?.toInt() ??
          (src['itemCount'] as num?)?.toInt(),
      documentId: src['documentId'] as String? ?? json['documentId'] as String?,
    );
  }
}
