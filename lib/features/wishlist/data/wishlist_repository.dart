import 'package:dio/dio.dart';

class WishlistRepository {
  WishlistRepository(this._dio);

  final Dio _dio;

  Future<Set<int>> fetchMyWishlistProductIds() async {
    final res = await _dio.get('/wishlist/me');

    if (res.statusCode == null || res.statusCode! >= 400) {
      throw Exception('Wishlist me failed: ${res.statusCode} ${res.data}');
    }

    final data = res.data as List<dynamic>;
    final ids = <int>{};

    for (final item in data) {
      final m = item as Map<String, dynamic>;
      final product = m['product'];
      if (product is Map<String, dynamic>) {
        final id = product['id'];
        if (id is int) ids.add(id);
        if (id is num) ids.add(id.toInt());
      }
    }
    return ids;
  }

  Future<bool> toggle(int productId) async {
    final res = await _dio.post(
      '/wishlist/toggle',
      data: {'productId': productId},
    );

    if (res.statusCode == null || res.statusCode! >= 400) {
      throw Exception('Wishlist toggle failed: ${res.statusCode} ${res.data}');
    }

    final json = res.data as Map<String, dynamic>;
    return json['status'] == 'added';
  }
}
