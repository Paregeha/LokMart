import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';

import '../../../services/dio_service.dart';
import '../models/strapi_auth_response.dart';

class AuthException implements Exception {
  const AuthException(this.message, {this.status});
  final String message;
  final int? status;
  @override
  String toString() => 'AuthException($status): $message';
}

class AuthRepository {
  AuthRepository({Dio? dio, FlutterSecureStorage? storage})
    : _storage = storage ?? const FlutterSecureStorage(),
      _dio = dio ?? DioService.instance {
    _dio.interceptors.remove(_authInterceptor);
    _dio.interceptors.add(_authInterceptor);
  }

  final Dio _dio;
  final FlutterSecureStorage _storage;

  static const _kJwtKey = 'jwt';
  static const _kUserEmailKey = 'user_email';
  static const _kUserNameKey = 'user_name';
  static const _kRememberKey = 'remember_me';

  static String? _jwtCache;

  /// Інтерсептор: автоматично додає Bearer якщо є токен
  static final _authInterceptor = InterceptorsWrapper(
    onRequest: (options, handler) async {
      final noAuth = options.extra['noAuth'] == true;

      String path = options.path;
      try {
        final uri = Uri.parse(options.path);
        path = uri.hasEmptyPath ? options.path : uri.path;
      } catch (_) {}
      if (path.startsWith('/api/')) path = path.substring(4);

      const skipAuthPaths = <String>{
        '/auth/local',
        '/auth/local/register',
        '/auth/forgot-password',
        '/auth/reset-password',
        '/auth/send-email-confirmation',
      };

      final shouldSkip = noAuth || skipAuthPaths.any((p) => path.startsWith(p));

      if (!shouldSkip) {
        final token = _jwtCache ?? await _safeGetJwt();
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
      }

      handler.next(options);
    },
  );

  /// Реєстрація
  Future<StrapiAuthResponse> register({
    required String username,
    required String email,
    required String password,
    bool rememberMe = false,
  }) async {
    final res = await _dio.post(
      '/auth/local/register',
      data: {'username': username, 'email': email, 'password': password},
    );
    _throwIfError(res);
    final data = StrapiAuthResponse.fromMap(res.data as Map<String, dynamic>);
    await _persistAuth(data, remember: rememberMe);
    return data;
  }

  /// Логін із прапорцем rememberMe
  Future<StrapiAuthResponse> login({
    required String identifier,
    required String password,
    bool rememberMe = false,
  }) async {
    final res = await _dio.post(
      '/auth/local',
      data: {'identifier': identifier, 'password': password},
    );
    _throwIfError(res);
    final data = StrapiAuthResponse.fromMap(res.data as Map<String, dynamic>);
    await _persistAuth(data, remember: rememberMe);
    return data;
  }

  Future<StrapiUser> me() async {
    final res = await _dio.get('/users/me');
    _throwIfError(res);
    return StrapiUser.fromMap(res.data as Map<String, dynamic>);
  }

  /// Відновлення сесії зі сховища (викликати на Splash)
  Future<bool> tryRestoreSession() async {
    final saved = await _safeGetJwt();
    if (saved == null || saved.isEmpty) return false;

    if (_isExpired(saved)) {
      await logout();
      return false;
    }
    _jwtCache = saved;
    return true;
  }

  Future<void> logout() async {
    _jwtCache = null;
    try {
      await _storage.delete(key: _kJwtKey);
      await _storage.delete(key: _kUserEmailKey);
      await _storage.delete(key: _kUserNameKey);
      await _storage.delete(key: _kRememberKey);
    } catch (_) {}
  }

  /// Персистимо тільки якщо remember=true
  Future<void> _persistAuth(
    StrapiAuthResponse data, {
    required bool remember,
  }) async {
    _jwtCache = data.jwt;
    try {
      if (remember) {
        if (data.jwt != null && data.jwt!.isNotEmpty) {
          await _storage.write(key: _kJwtKey, value: data.jwt);
        }
        await _storage.write(key: _kUserEmailKey, value: data.user.email);
        await _storage.write(key: _kUserNameKey, value: data.user.username);
        await _storage.write(key: _kRememberKey, value: '1');
      } else {
        await _storage.delete(key: _kJwtKey);
        await _storage.delete(key: _kUserEmailKey);
        await _storage.delete(key: _kUserNameKey);
        await _storage.delete(key: _kRememberKey);
      }
    } catch (_) {}
  }

  static Future<String?> _safeGetJwt() async {
    try {
      final storage = const FlutterSecureStorage();
      final v = await storage.read(key: _kJwtKey);
      _jwtCache ??= v;
      return v;
    } catch (_) {
      return _jwtCache;
    }
  }

  static bool _isExpired(String jwt) {
    try {
      return Jwt.isExpired(jwt);
    } catch (_) {
      return true;
    }
  }

  void _throwIfError(Response res) {
    final code = res.statusCode ?? 0;
    if (code >= 200 && code < 300) return;
    throw AuthException(
      _extractErrorMessage(res.data) ?? 'Request failed',
      status: code,
    );
  }

  String? _extractErrorMessage(dynamic body) {
    if (body is String) return body;
    if (body is Map &&
        body['error'] is Map &&
        (body['error'] as Map)['message'] is String) {
      return (body['error'] as Map)['message'] as String;
    }
    if (body is Map && body['message'] is String) {
      return body['message'] as String;
    }
    return null;
  }
}
