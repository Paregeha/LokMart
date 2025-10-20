import 'package:dio/dio.dart';

import '../models/category.dart' as cat;

class CategoryRepository {
  CategoryRepository(this._dio);
  final Dio _dio;

  /// Завантажує категорії та паралельно підраховує кількість продуктів у кожній.
  Future<List<cat.Category>> fetchCategoriesWithCounts() async {
    // 1) Тягнемо категорії
    final res = await _dio.get(
      '/categories',
      queryParameters: {'populate': 'photo'},
    );
    _ensureOk(res);

    final body = res.data as Map<String, dynamic>;
    final rows = (body['data'] as List?) ?? const [];

    final cats =
        rows
            .map((e) => cat.Category.fromStrapi(e as Map<String, dynamic>))
            .toList();

    if (cats.isEmpty) return cats;

    final counts = await Future.wait<int>([
      for (final c in cats) _fetchCountForCategory(c.id),
    ]);

    return [
      for (var i = 0; i < cats.length; i++)
        cats[i].copyWith(itemCount: counts[i]),
    ];
  }

  Future<int> _fetchCountForCategory(int categoryId) async {
    try {
      final res = await _dio.get(
        '/products',
        queryParameters: {
          'filters[category][id][\$eq]': categoryId,
          'pagination[pageSize]': 1,
          'pagination[withCount]': true,
        },
      );
      _ensureOk(res);

      final meta = (res.data as Map<String, dynamic>)['meta'] as Map?;
      final pag = (meta?['pagination'] as Map?) ?? const {};
      return (pag['total'] as num?)?.toInt() ?? 0;
    } on DioException {
      return 0;
    }
  }

  void _ensureOk(Response res) {
    final code = res.statusCode ?? 0;
    if (code < 200 || code >= 300) {
      throw DioException(
        requestOptions: res.requestOptions,
        response: res,
        type: DioExceptionType.badResponse,
        error: 'Bad status: $code',
      );
    }
  }
}
