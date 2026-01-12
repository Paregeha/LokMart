import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/env.dart';

part 'products.freezed.dart';
part 'products.g.dart';

@freezed
class Products with _$Products {
  const factory Products({
    required int id,
    required String name,
    double? price,
    int? count,
    double? priceWithDiscount,
    bool? isDiscount,
    String? slug,
    String? photoUrl,
    int? categoryId,
    String? categoryName,
    String? documentId,
    String? description,
    double? raiting,
  }) = _Products;

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);

  factory Products.fromStrapi(Map<String, dynamic> row) {
    // ---------- ATTRIBUTES ----------
    final attrRaw = row['attributes'];
    final attrs =
        (attrRaw is Map ? attrRaw.cast<String, dynamic>() : null) ??
        row.cast<String, dynamic>();

    // ---------- PHOTO ----------
    String? photoUrl;
    final photo = attrs['photo'];

    if (photo is Map<String, dynamic>) {
      final data = photo['data'];

      if (data is List && data.isNotEmpty) {
        final first = data.first;
        if (first is Map) {
          final a = (first['attributes'] as Map?)?.cast<String, dynamic>();
          photoUrl = (a?['url'] as String?) ?? (first['url'] as String?);
        }
      } else {
        photoUrl = photo['url'] as String?;
      }
    } else if (photo is List) {
      if (photo.isNotEmpty) {
        final first = photo.first;
        if (first is Map) {
          final a = (first['attributes'] as Map?)?.cast<String, dynamic>();
          photoUrl = (a?['url'] as String?) ?? (first['url'] as String?);
        }
      }
    }

    if (photoUrl != null &&
        photoUrl.isNotEmpty &&
        !photoUrl.startsWith('http')) {
      photoUrl = '${Env.baseUrl}$photoUrl';
    }

    int? categoryId;
    String? categoryName;
    final category = attrs['category'];

    if (category is Map) {
      final catData = category['data'];
      if (catData is Map) {
        categoryId = (catData['id'] as num?)?.toInt();
        final catAttrs =
            (catData['attributes'] as Map?)?.cast<String, dynamic>() ??
            const {};
        categoryName = catAttrs['title'] as String?;
      } else {
        categoryId = (category['id'] as num?)?.toInt();
        categoryName = category['title'] as String?;
      }
    }

    final rawDescription = attrs['description'];
    String? description;

    String extractText(dynamic node) {
      if (node is Map<String, dynamic>) {
        if (node['type'] == 'text' && node['text'] is String) {
          return node['text'] as String;
        }
        final children = node['children'];
        if (children is List) {
          return children.map(extractText).join('');
        }
        return '';
      } else if (node is List) {
        return node.map(extractText).join('\n');
      }
      return '';
    }

    if (rawDescription is String) {
      description = rawDescription;
    } else if (rawDescription is List) {
      description = extractText(rawDescription).trim();
    } else if (rawDescription != null) {
      description = rawDescription.toString();
    }

    return Products(
      id: (row['id'] as num?)?.toInt() ?? (attrs['id'] as num).toInt(),
      name: (attrs['name'] as String?) ?? '—',
      price: (attrs['price'] as num?)?.toDouble(),
      count: (attrs['count'] as num?)?.toInt(),
      priceWithDiscount: (attrs['priceWithDiscount'] as num?)?.toDouble(),
      isDiscount: attrs['isDiscount'] as bool?,
      slug: attrs['slug'] as String?,
      photoUrl: photoUrl,
      categoryId: categoryId,
      categoryName: categoryName,
      documentId:
          attrs['documentId'] as String? ?? row['documentId'] as String?,
      description: description,
      raiting: (attrs['raiting'] as num?)?.toDouble(),
    );
  }
}
