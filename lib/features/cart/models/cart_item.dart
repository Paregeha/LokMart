import '../../products/models/products.dart';

class CartItem {
  CartItem({
    required this.id,
    required this.documentId,
    required this.count,
    required this.product,
  });

  /// internal numeric id (може бути, але в Strapi v5 НЕ для /:id)
  final int id;

  /// ✅ Strapi v5: використовуй для PUT/DELETE /cart-items/:documentId
  final String documentId;

  final int count;
  final Products product;

  CartItem copyWith({int? count}) => CartItem(
    id: id,
    documentId: documentId,
    count: count ?? this.count,
    product: product,
  );

  static int _asInt(dynamic v, {int fallback = 0}) {
    if (v == null) return fallback;
    if (v is int) return v;
    if (v is num) return v.toInt();
    if (v is String) {
      final i = int.tryParse(v);
      if (i != null) return i;
      final d = double.tryParse(v);
      if (d != null) return d.toInt();
    }
    return fallback;
  }

  static CartItem fromStrapi(Map<String, dynamic> row) {
    final id = _asInt(row['id'], fallback: 0);

    final attrRaw = row['attributes'];
    final attrs =
        (attrRaw is Map ? attrRaw.cast<String, dynamic>() : null) ??
        row.cast<String, dynamic>();

    final documentId =
        (attrs['documentId'] ?? row['documentId'] ?? '').toString();
    if (documentId.isEmpty) {
      throw Exception(
        'CartItem: documentId is empty. In Strapi v5 you must use documentId for update/delete.',
      );
    }

    final count = _asInt(attrs['count'], fallback: 1);

    final prodRaw = attrs['product'];

    Map<String, dynamic>? productData;
    if (prodRaw is Map) {
      final data = prodRaw['data'];
      if (data is Map) {
        productData = data.cast<String, dynamic>();
      } else {
        productData = prodRaw.cast<String, dynamic>();
      }
    }

    if (productData == null) {
      throw Exception(
        'CartItem: product is null. Add populate[product] in query.',
      );
    }

    final product = Products.fromStrapi(productData);
    return CartItem(
      id: id,
      documentId: documentId,
      count: count,
      product: product,
    );
  }
}
