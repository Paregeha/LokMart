import 'package:dio/dio.dart';

import '../../../services/dio_service.dart';
import '../../auth/data/auth_repository.dart';
import '../models/cart_item.dart';

class CartRepository {
  CartRepository({Dio? dio, required AuthRepository authRepository})
    : _dio = dio ?? DioService.instance,
      _auth = authRepository;

  final Dio _dio;
  final AuthRepository _auth;

  int? _cachedUserId;

  static const String _userField = 'user';

  static int _asInt(dynamic v, {int defaultValue = 0}) {
    if (v == null) return defaultValue;
    if (v is int) return v;
    if (v is num) return v.toInt();
    return int.tryParse(v.toString()) ?? defaultValue;
  }

  static String _asString(dynamic v, {String defaultValue = ''}) {
    if (v == null) return defaultValue;
    return v.toString();
  }

  static String _docIdFromRow(Map<String, dynamic> row) {
    final direct = _asString(row['documentId']);
    if (direct.isNotEmpty) return direct;

    final attrRaw = row['attributes'];
    final attrs =
        (attrRaw is Map ? attrRaw.cast<String, dynamic>() : null) ??
        row.cast<String, dynamic>();

    return _asString(attrs['documentId']);
  }

  Future<int> _meId() async {
    if (_cachedUserId != null) return _cachedUserId!;
    final me = await _auth.me();
    _cachedUserId = me.id;
    return me.id;
  }

  Future<List<CartItem>> fetchMyCart() async {
    final userId = await _meId();

    final qp = <String, dynamic>{
      'filters[$_userField][id][\$eq]': userId,
      'sort': 'createdAt:desc',

      'fields[0]': 'count',
      'fields[1]': 'documentId',

      'populate[product][fields][0]': 'name',
      'populate[product][fields][1]': 'slug',
      'populate[product][fields][2]': 'price',
      'populate[product][fields][3]': 'count',
      'populate[product][fields][4]': 'priceWithDiscount',
      'populate[product][fields][5]': 'isDiscount',
      'populate[product][fields][6]': 'documentId',
      'populate[product][fields][7]': 'raiting',
      'populate[product][fields][8]': 'description',
      'populate[product][populate][photo][fields][0]': 'url',
      'populate[product][populate][category][fields][0]': 'title',
    };

    final res = await _dio.get('/cart-items', queryParameters: qp);
    final body = res.data as Map<String, dynamic>;
    final rows = (body['data'] as List?) ?? const [];

    return rows.cast<Map<String, dynamic>>().map(CartItem.fromStrapi).toList();
  }

  Future<void> addToCart({required int productId, int addCount = 1}) async {
    final userId = await _meId();

    final findRes = await _dio.get(
      '/cart-items',
      queryParameters: <String, dynamic>{
        'filters[$_userField][id][\$eq]': userId,
        'filters[product][id][\$eq]': productId,

        'fields[0]': 'count',
        'fields[1]': 'documentId',

        'pagination[pageSize]': 1,
      },
    );

    final body = findRes.data as Map<String, dynamic>;
    final rows = (body['data'] as List?) ?? const [];

    if (rows.isNotEmpty) {
      final first = rows.first as Map<String, dynamic>;
      final docId = _docIdFromRow(first);
      if (docId.isEmpty) {
        throw Exception(
          'CartItem documentId is empty. Add fields[]=documentId.',
        );
      }

      final attrsRaw = first['attributes'];
      final attrs =
          (attrsRaw is Map ? attrsRaw.cast<String, dynamic>() : null) ??
          first.cast<String, dynamic>();

      final current = _asInt(attrs['count'], defaultValue: 1);

      await _dio.put(
        '/cart-items/$docId',
        data: {
          'data': {'count': current + addCount},
        },
      );
      return;
    }

    await _dio.post(
      '/cart-items',
      data: {
        'data': {'count': addCount, 'product': productId, 'user': userId},
      },
    );
  }

  Future<void> updateCount({
    required String cartItemDocumentId,
    required int count,
  }) async {
    final safe = count < 1 ? 1 : count;

    await _dio.put(
      '/cart-items/$cartItemDocumentId',
      data: {
        'data': {'count': safe},
      },
    );
  }

  Future<void> removeItem(String cartItemDocumentId) async {
    await _dio.delete('/cart-items/$cartItemDocumentId');
  }

  Future<void> clearMyCart() async {
    final userId = await _meId();

    final res = await _dio.get(
      '/cart-items',
      queryParameters: <String, dynamic>{
        'filters[$_userField][id][\$eq]': userId,
        'fields[0]': 'documentId',
        'pagination[pageSize]': 500,
      },
    );

    final body = res.data as Map<String, dynamic>;
    final rows = (body['data'] as List?) ?? const [];

    for (final r in rows) {
      if (r is! Map) continue;
      final row = r.cast<String, dynamic>();
      final docId = _docIdFromRow(row);
      if (docId.isEmpty) continue;

      try {
        await removeItem(docId);
      } catch (_) {}
    }
  }
}
