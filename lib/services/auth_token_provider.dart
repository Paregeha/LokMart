import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthTokenProvider {
  AuthTokenProvider._();
  static final instance = AuthTokenProvider._();

  final _storage = const FlutterSecureStorage();
  static const _kJwtKey = 'jwt';
  String? _cached;

  Future<String?> getToken() async {
    _cached ??= await _storage.read(key: _kJwtKey);
    return _cached;
  }

  Future<void> setToken(String? jwt) async {
    _cached = jwt;
    if (jwt == null || jwt.isEmpty) {
      await _storage.delete(key: _kJwtKey);
    } else {
      await _storage.write(key: _kJwtKey, value: jwt);
    }
  }

  Future<void> clear() => setToken(null);
}
