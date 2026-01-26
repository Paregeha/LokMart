import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/saved_card.dart';

class PaymentIntentResult {
  PaymentIntentResult({required this.clientSecret, required this.status});

  final String clientSecret;
  final String status;

  @override
  String toString() =>
      'PaymentIntentResult(status=$status, clientSecret=$clientSecret)';
}

class PaymentsRepository {
  PaymentsRepository({required this.dio});

  final Dio dio;

  Map<String, dynamic> _asMap(dynamic data, {required String where}) {
    if (data is Map<String, dynamic>) return data;
    if (data is Map) return data.cast<String, dynamic>();
    throw Exception(
      '$where: expected JSON object, got ${data.runtimeType}: $data',
    );
  }

  Future<String> createSetupIntent() async {
    final res = await dio.post('/payment-methods/setup-intent');
    final data = _asMap(res.data, where: 'setup-intent');
    final clientSecret = (data['clientSecret'] ?? '').toString();
    if (clientSecret.isEmpty) {
      throw Exception('SetupIntent clientSecret is empty');
    }
    return clientSecret;
  }

  Future<SavedCard> attachPaymentMethod({
    required String paymentMethodId,
    bool setDefault = true,
  }) async {
    final res = await dio.post(
      '/payment-methods/attach',
      data: {'paymentMethodId': paymentMethodId, 'setDefault': setDefault},
    );

    final body = res.data;
    if (body is! Map) {
      throw Exception(
        'Attach response is not a JSON object: ${res.statusCode} $body',
      );
    }

    final map = body.cast<String, dynamic>();
    final data = map['data'];
    if (data is! Map) throw Exception('Attach failed: $map');

    return SavedCard.fromStrapiItem(data.cast<String, dynamic>());
  }

  Future<List<SavedCard>> fetchMyCards() async {
    final res = await dio.get('/payment-methods');

    final body = _asMap(res.data, where: 'fetchMyCards');
    final rawList = body['data'];

    if (rawList is! List) {
      throw Exception(
        'fetchMyCards: expected data[] list, got ${rawList.runtimeType}: $rawList',
      );
    }

    final list =
        rawList.cast<Map>().map((e) => e.cast<String, dynamic>()).toList();
    return list.map(SavedCard.fromStrapiItem).toList();
  }

  Future<void> setDefaultCard({required String documentId}) async {
    await dio.put('/payment-methods/$documentId/default');
  }

  Future<void> deleteCard({required String documentId}) async {
    await dio.delete('/payment-methods/$documentId/mine');
  }

  Future<PaymentIntentResult> createPaymentIntent({
    required String paymentMethodDocumentId,
    required int amount, // cents
    required String currency,
    String? orderId,
  }) async {
    try {
      final res = await dio.post(
        '/payment-methods/payment-intent',
        data: {
          'paymentMethodDocumentId': paymentMethodDocumentId,
          'amount': amount,
          'currency': currency,
          if (orderId != null) 'orderId': orderId,
        },
      );

      debugPrint('PI statusCode=${res.statusCode} data=${res.data}');

      final data = _asMap(res.data, where: 'payment-intent');
      final clientSecret = (data['clientSecret'] ?? '').toString();
      final status = (data['status'] ?? '').toString();

      if (clientSecret.isEmpty) {
        throw Exception('PaymentIntent clientSecret is empty');
      }

      final normalizedStatus =
          status.isEmpty ? 'requires_confirmation' : status;

      return PaymentIntentResult(
        clientSecret: clientSecret,
        status: normalizedStatus,
      );
    } on DioException catch (e) {
      debugPrint('PI error status=${e.response?.statusCode}');
      debugPrint('PI error data=${e.response?.data}');
      rethrow;
    }
  }
}
