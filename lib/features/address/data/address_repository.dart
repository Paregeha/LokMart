import 'package:dio/dio.dart';

import '../../../services/dio_service.dart';
import '../../auth/data/auth_repository.dart';
import '../models/address.dart';

class AddressRepository {
  AddressRepository({Dio? dio, required AuthRepository authRepository})
    : _dio = dio ?? DioService.instance,
      _auth = authRepository;

  final Dio _dio;
  final AuthRepository _auth;

  int? _cachedUserId;

  Future<int> _meId() async {
    if (_cachedUserId != null) return _cachedUserId!;
    final me = await _auth.me();
    _cachedUserId = me.id;
    return me.id;
  }

  Future<Address?> fetchDefault() async {
    final userId = await _meId();

    final res = await _dio.get(
      '/addresses',
      queryParameters: <String, dynamic>{
        'filters[user][id][\$eq]': userId,
        'filters[isDefault][\$eq]': true,
        'pagination[pageSize]': 1,
        'sort': 'updatedAt:desc',
      },
    );

    final body = res.data as Map<String, dynamic>;
    final rows = (body['data'] as List?) ?? const [];
    if (rows.isEmpty) return null;

    return Address.fromStrapi(rows.first as Map<String, dynamic>);
  }

  /// Якщо address.documentId не пустий -> PUT /addresses/{documentId}
  /// Якщо пустий -> POST /addresses
  Future<void> saveAsDefault(Address address) async {
    final userId = await _meId();

    final payload = {
      'data': {
        'fullName': address.fullName,
        'email': address.email,
        'phone': address.phone,
        'addressLine': address.addressLine,
        'zipCode': address.zipCode,
        'city': address.city,
        'country': address.country,
        'isDefault': true,
        'user': userId,
      },
    };

    if (address.documentId.isNotEmpty) {
      await _dio.put('/addresses/${address.documentId}', data: payload);
    } else {
      await _dio.post('/addresses', data: payload);
    }
  }

  Future<void> deleteByDocumentId(String documentId) async {
    await _dio.delete('/addresses/$documentId');
  }
}
