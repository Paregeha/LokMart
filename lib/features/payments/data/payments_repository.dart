import 'package:dio/dio.dart';

import '../models/saved_card.dart';

class PaymentsRepository {
  PaymentsRepository({required this.dio});

  final Dio dio;

  // ✅ 1) create setup intent
  Future<String> createSetupIntent() async {
    final res = await dio.post('/payment-methods/setup-intent');
    final data = res.data as Map<String, dynamic>;
    final clientSecret = (data['clientSecret'] ?? '') as String;
    if (clientSecret.isEmpty) {
      throw Exception('SetupIntent clientSecret is empty');
    }
    return clientSecret;
  }

  // ✅ 2) attach payment method after confirm
  Future<SavedCard> attachPaymentMethod({
    required String paymentMethodId,
    bool setDefault = true,
  }) async {
    final res = await dio.post(
      '/payment-methods/attach',
      data: {'paymentMethodId': paymentMethodId, 'setDefault': setDefault},
    );

    final body = res.data as Map<String, dynamic>;
    final item = (body['data'] as Map<String, dynamic>);
    return SavedCard.fromStrapiItem(item);
  }

  // ✅ 3) list cards for current user
  Future<List<SavedCard>> fetchMyCards() async {
    final res = await dio.get('/payment-methods');
    final body = res.data as Map<String, dynamic>;
    final list = (body['data'] as List).cast<Map<String, dynamic>>();
    return list.map(SavedCard.fromStrapiItem).toList();
  }

  Future<void> setDefaultCard({required int id}) async {
    await dio.put('/payment-methods/$id/default');
  }

  Future<void> deleteCard({required int id}) async {
    await dio.delete('/payment-methods/$id');
  }
}
