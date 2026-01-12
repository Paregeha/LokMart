import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static const _jwtKey = 'auth_jwt';
  static const _rememberKey = 'remember_me';

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> saveSession({
    required String jwt,
    required bool remember,
  }) async {
    await _storage.write(key: _jwtKey, value: jwt);
    await _storage.write(key: _rememberKey, value: remember ? '1' : '0');
  }

  Future<String?> readJwt() => _storage.read(key: _jwtKey);

  Future<bool> readRememberFlag() async {
    final v = await _storage.read(key: _rememberKey);
    return v == '1';
  }

  Future<void> clear() async {
    await _storage.delete(key: _jwtKey);
    await _storage.delete(key: _rememberKey);
  }
}
