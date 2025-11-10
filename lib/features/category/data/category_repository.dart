import 'package:dio/dio.dart';
import '../models/category.dart';

class CategoryRepository {
  CategoryRepository(this._dio);
  final Dio _dio;

  Future<List<Category>> fetchCategoriesWithCounts() async {
    final res = await _dio.get(
      '/categories',
      queryParameters: {
        'fields[0]': 'title',
        'fields[1]': 'slug',
        'fields[2]': 'documentId',
        'populate[photo][fields][0]': 'url',
      },
    );
    _ensureOk(res);

    final rows =
        ((res.data as Map<String, dynamic>)['data'] as List?) ?? const [];
    var cats =
        rows.cast<Map<String, dynamic>>().map(Category.fromStrapi).toList();
    if (cats.isEmpty) return cats;

    final totals = await _mapConcurrent<Category, int>(
      cats,
      maxConcurrent: 4,
      task: (c) => _sumProductUnitsForCategory(c.id),
    );

    return [
      for (var i = 0; i < cats.length; i++)
        cats[i].copyWith(itemCount: totals[i]),
    ];
  }

  Future<int> _sumProductUnitsForCategory(int categoryId) async {
    const pageSize = 100;
    var page = 1;
    var totalPages = 1;
    var sum = 0;

    do {
      try {
        final res = await _dio.get(
          '/products',
          queryParameters: {
            'filters[category][id][\$eq]': categoryId,
            'pagination[page]': page,
            'pagination[pageSize]': pageSize,
            'fields[0]': 'count',
          },
        );
        _ensureOk(res);

        final map = res.data as Map<String, dynamic>;
        final rows = (map['data'] as List?) ?? const [];

        for (final row in rows) {
          final r = row as Map<String, dynamic>;
          final attrs = (r['attributes'] as Map?)?.cast<String, dynamic>();
          final count = (attrs?['count'] ?? r['count']) as num?;
          sum += (count ?? 0).toInt();
        }

        final meta = (map['meta'] as Map?)?['pagination'] as Map? ?? const {};
        totalPages = (meta['pageCount'] as num?)?.toInt() ?? page;

        page++;
      } on DioException {
        break;
      }
    } while (page <= totalPages);

    return sum;
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

  Future<List<T>> _mapConcurrent<E, T>(
    List<E> items, {
    required int maxConcurrent,
    required Future<T> Function(E item) task,
  }) async {
    final results = List<T?>.filled(items.length, null);
    var index = 0;

    Future<void> worker() async {
      while (true) {
        final i = index;
        if (i >= items.length) break;
        index++;
        results[i] = await task(items[i]);
      }
    }

    final workers = List.generate(
      maxConcurrent.clamp(1, items.length),
      (_) => worker(),
    );
    await Future.wait(workers);
    return results.cast<T>();
  }
}
