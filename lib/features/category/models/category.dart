class Category {
  final int id;
  final String title;
  final String? slug;
  final List<Map<String, dynamic>>? description;
  final String? photoUrl;
  final int? itemCount;
  final String? documentId;

  const Category({
    required this.id,
    required this.title,
    this.slug,
    this.description,
    this.photoUrl,
    this.itemCount,
    this.documentId,
  });

  Category copyWith({
    int? id,
    String? title,
    String? slug,
    List<Map<String, dynamic>>? description,
    String? photoUrl,
    int? itemCount,
    String? documentId,
  }) {
    return Category(
      id: id ?? this.id,
      title: title ?? this.title,
      slug: slug ?? this.slug,
      description: description ?? this.description,
      photoUrl: photoUrl ?? this.photoUrl,
      itemCount: itemCount ?? this.itemCount,
      documentId: documentId ?? this.documentId,
    );
  }

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
