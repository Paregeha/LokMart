import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../services/dio_service.dart';
import '../models/products.dart';
import '../models/products_filter.dart';

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
    String? search,
    ProductsFilter? filter,
  }) async {
    final qp = <String, dynamic>{
      'pagination[page]': page,
      'pagination[pageSize]': pageSize,
      'pagination[withCount]': withTotal,

      'fields[0]': 'name',
      'fields[1]': 'slug',
      'fields[2]': 'price',
      'fields[3]': 'count',
      'fields[4]': 'priceWithDiscount',
      'fields[5]': 'isDiscount',
      'fields[6]': 'documentId',
      'fields[7]': 'raiting',
      'fields[8]': 'description',

      'populate[photo][fields][0]': 'url',
      'populate[category][fields][0]': 'title',
    };

    if (sort != null && sort.isNotEmpty) {
      qp['sort'] = sort;
    }

    if (search != null && search.isNotEmpty) {
      qp['filters[name][\$containsi]'] = search;
    }

    if (filter != null) {
      const def = ProductsFilter();

      // ✅ CATEGORY
      // 1) якщо є categoryId — фільтруємо по id
      if (filter.categoryId != null) {
        qp['filters[category][id][\$eq]'] = filter.categoryId;
      }
      // 2) якщо id немає, але є categoryTitle — фільтруємо по title (case-insensitive)
      else if (filter.categoryTitle != null &&
          filter.categoryTitle!.trim().isNotEmpty) {
        qp['filters[category][title][\$eqi]'] = filter.categoryTitle!.trim();
      }

      // PRICE
      if (filter.minPrice != def.minPrice) {
        qp['filters[price][\$gte]'] = filter.minPrice;
      }
      if (filter.maxPrice != def.maxPrice) {
        qp['filters[price][\$lte]'] = filter.maxPrice;
      }

      // RATING (в Strapi поле "raiting")
      if (filter.minRating != null) {
        qp['filters[raiting][\$gte]'] = filter.minRating;
      }
      if (filter.maxRating != null) {
        qp['filters[raiting][\$lte]'] = filter.maxRating;
      }

      // ONLY DISCOUNT (поле isDiscount у тебе є)
      if (filter.onlyDiscount) {
        qp['filters[isDiscount][\$eq]'] = true;
      }

      // DISCOUNT % (працює лише якщо реально є поле discountPercent)
      if (filter.minDiscountPercent != null) {
        qp['filters[discountPercent][\$gte]'] = filter.minDiscountPercent;
      }
      if (filter.maxDiscountPercent != null) {
        qp['filters[discountPercent][\$lte]'] = filter.maxDiscountPercent;
      }

      // OTHERS (тільки якщо реально є ці поля в Strapi)
      if (filter.onlyFreeShipping) {
        qp['filters[freeShipping][\$eq]'] = true;
      }
      if (filter.onlyVoucher) {
        qp['filters[voucher][\$eq]'] = true;
      }
      if (filter.onlySameDayDelivery) {
        qp['filters[sameDayDelivery][\$eq]'] = true;
      }
    }

    final res = await _dio.get('/products', queryParameters: qp);

    final body = (res.data as Map<String, dynamic>);
    final rows = (body['data'] as List?) ?? const [];
    return rows.cast<Map<String, dynamic>>().map(Products.fromStrapi).toList();
  }

  /// ✅ щоб DetailInformationPage не падав
  Future<Products> fetchByDocumentId(String documentId) async {
    final qp = <String, dynamic>{
      'filters[documentId][\$eq]': documentId,

      'fields[0]': 'name',
      'fields[1]': 'slug',
      'fields[2]': 'price',
      'fields[3]': 'count',
      'fields[4]': 'priceWithDiscount',
      'fields[5]': 'isDiscount',
      'fields[6]': 'documentId',
      'fields[7]': 'raiting',
      'fields[8]': 'description',

      'populate[photo][fields][0]': 'url',
      'populate[category][fields][0]': 'title',
    };

    final res = await _dio.get('/products', queryParameters: qp);

    final body = res.data as Map<String, dynamic>;
    final rows = (body['data'] as List?) ?? const [];

    if (rows.isEmpty) {
      throw Exception('Product with documentId=$documentId not found');
    }

    return Products.fromStrapi(rows.first as Map<String, dynamic>);
  }
}
