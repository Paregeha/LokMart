import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../services/dio_service.dart';
import '../models/products.dart';

class ProductRepository {
  ProductRepository([Dio? dio]) : _dio = dio ?? DioService.instance {
    final alreadyHasLogger = _dio.interceptors.any((i) => i is PrettyDioLogger);
    if (!alreadyHasLogger) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: false,
          responseBody: true,
          compact: true,
          maxWidth: 120,
        ),
      );
    }
  }

  final Dio _dio;

  Future<List<Products>> fetchAll({
    int page = 1,
    int pageSize = 25,
    bool withTotal = false,
    String? sort,
    int? categoryId,
    String? search,
  }) async {
    final qp = <String, dynamic>{
      'pagination[page]': page,
      'pagination[pageSize]': pageSize,
      'pagination[withCount]': withTotal,

      // важливо: підтягуємо поле "raiting"
      'fields[0]': 'name',
      'fields[1]': 'slug',
      'fields[2]': 'price',
      'fields[3]': 'count',
      'fields[4]': 'priceWithDiscount',
      'fields[5]': 'isDiscount',
      'fields[6]': 'documentId',
      'fields[7]': 'raiting', // <-- тут

      'populate[photo][fields][0]': 'url',
      'populate[category][fields][0]': 'title',
    };

    if (sort != null && sort.isNotEmpty) {
      qp['sort'] = sort; // приклад: 'raiting:desc'
    }
    if (categoryId != null) {
      qp['filters[category][id][\$eq]'] = categoryId;
    }
    if (search != null && search.isNotEmpty) {
      qp['filters[name][\$containsi]'] = search;
    }

    final res = await _dio.get('/products', queryParameters: qp);

    final body = (res.data as Map<String, dynamic>);
    final rows = (body['data'] as List?) ?? const [];
    return rows.cast<Map<String, dynamic>>().map(Products.fromStrapi).toList();
  }

  Future<int> getTotalCount({int? categoryId, String? search}) async {
    final qp = <String, dynamic>{
      'pagination[page]': 1,
      'pagination[pageSize]': 1,
      'pagination[withCount]': true,
      'fields[0]': 'id',
    };
    if (categoryId != null) {
      qp['filters[category][id][\$eq]'] = categoryId;
    }
    if (search != null && search.isNotEmpty) {
      qp['filters[name][\$containsi]'] = search;
    }

    final res = await _dio.get('/products', queryParameters: qp);
    final meta =
        ((res.data as Map)['meta'] as Map?)?['pagination'] as Map? ?? const {};
    return (meta['total'] as num?)?.toInt() ?? 0;
  }
}
