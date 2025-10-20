import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:flutter/foundation.dart'; // kDebugMode, debugPrint
import '../../../core/env.dart';
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
      _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: '${Env.baseUrl}/api',
              connectTimeout: const Duration(seconds: 8),
              receiveTimeout: const Duration(seconds: 12),
              sendTimeout: const Duration(seconds: 8),
              validateStatus:
                  (code) => code != null && code >= 200 && code < 600,
            ),
          ) {
    final Interceptor authInterceptor = InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Можна вимкнути токен пер-запитно:
        // dio.post('/public', options: Options(extra: {'noAuth': true}))
        final noAuth = options.extra['noAuth'] == true;

        // Витягнемо тільки шлях (на випадок повного URL)
        String pathOnly;
        try {
          final uri = Uri.parse(options.path);
          pathOnly = uri.hasEmptyPath ? options.path : uri.path; // /api/...
        } catch (_) {
          pathOnly = options.path;
        }

        // Якщо baseUrl має /api, інколи шлях приходить як /api/auth/...
        final normalizedPath =
            pathOnly.startsWith('/api/')
                ? pathOnly.substring(4) // прибираємо префікс /api
                : pathOnly;

        // Роути Strapi, де токен НЕ потрібен
        const skipAuthPaths = <String>{
          '/auth/local',
          '/auth/local/register',
          '/auth/forgot-password',
          '/auth/reset-password',
          '/auth/send-email-confirmation',
        };

        final shouldSkip = skipAuthPaths.any(
          (p) => normalizedPath.startsWith(p),
        );

        if (!noAuth && !shouldSkip) {
          final token = _jwtCache ?? await _safeGetJwt();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
        }

        handler.next(options);
      },
    );
    final prettyLogger = PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: false,
      responseBody: true,
      compact: true,
      maxWidth: 120,
      logPrint: (obj) {
        var line = obj.toString();

        line = line.replaceAll(
          RegExp(
            r'(Authorization:\s*Bearer\s+)[A-Za-z0-9\-\._~\+\/]+=*',
            caseSensitive: false,
          ),
          r'$1***',
        );

        line = line.replaceAll(
          RegExp(r'("jwt"\s*:\s*")([^"]+)(")', caseSensitive: false),
          r'$1***$3',
        );

        line = line.replaceAll(
          RegExp(r'("password"\s*:\s*")([^"]+)(")', caseSensitive: false),
          r'$1***$3',
        );

        line = line.replaceAllMapped(
          RegExp(
            r'("identifier"\s*:\s*")([^"@]+)@([^"]+)(")',
            caseSensitive: false,
          ),
          (m) => '${m[1]}***@${m[3]}${m[4]}',
        );

        debugPrint(line);
      },
    );

    _dio.interceptors.addAll([authInterceptor, if (kDebugMode) prettyLogger]);
  }

  final Dio _dio;
  final FlutterSecureStorage _storage;

  static const _kJwtKey = 'jwt';
  static const _kUserEmailKey = 'user_email';
  static const _kUserNameKey = 'user_name';

  String? _jwtCache;

  Future<StrapiAuthResponse> register({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final res = await _dio.post(
        '/auth/local/register',
        data: {'username': username, 'email': email, 'password': password},
      );
      _throwIfError(res);
      final data = StrapiAuthResponse.fromMap(res.data as Map<String, dynamic>);
      await _persistAuth(data);
      return data;
    } on DioException catch (e) {
      throw _mapDioToAuthException(e);
    } catch (_) {
      throw const AuthException('Unexpected error');
    }
  }

  Future<StrapiAuthResponse> login({
    required String identifier,
    required String password,
  }) async {
    try {
      final res = await _dio.post(
        '/auth/local',
        data: {'identifier': identifier, 'password': password},
      );
      _throwIfError(res);
      final data = StrapiAuthResponse.fromMap(res.data as Map<String, dynamic>);
      await _persistAuth(data);
      return data;
    } on DioException catch (e) {
      throw _mapDioToAuthException(e);
    } catch (_) {
      throw const AuthException('Unexpected error');
    }
  }

  Future<StrapiUser> me() async {
    try {
      final res = await _dio.get('/users/me');
      _throwIfError(res);
      return StrapiUser.fromMap(res.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _mapDioToAuthException(e, fallback: 'Failed to load profile');
    } catch (_) {
      throw const AuthException('Unexpected error');
    }
  }

  Future<void> logout() async {
    _jwtCache = null;
    try {
      await _storage.delete(key: _kJwtKey);
    } catch (_) {}
    try {
      await _storage.delete(key: _kUserEmailKey);
    } catch (_) {}
    try {
      await _storage.delete(key: _kUserNameKey);
    } catch (_) {}
  }

  Future<void> _persistAuth(StrapiAuthResponse data) async {
    _jwtCache = data.jwt;
    try {
      if (data.jwt != null) {
        await _storage.write(key: _kJwtKey, value: data.jwt);
      }
      await _storage.write(key: _kUserEmailKey, value: data.user.email);
      await _storage.write(key: _kUserNameKey, value: data.user.username);
    } catch (_) {}
  }

  Future<String?> _safeGetJwt() async {
    try {
      final v = await _storage.read(key: _kJwtKey);
      _jwtCache ??= v;
      return v;
    } catch (_) {
      return _jwtCache;
    }
  }

  void _throwIfError(Response res) {
    final code = res.statusCode ?? 0;
    if (code >= 200 && code < 300) return;
    final msg = _extractErrorMessage(res.data) ?? 'Request failed';
    throw AuthException(msg, status: code);
  }

  AuthException _mapDioToAuthException(
    DioException e, {
    String fallback = 'Request failed',
  }) {
    final code = e.response?.statusCode;
    final msg = _extractErrorMessage(e.response?.data) ?? e.message ?? fallback;
    return AuthException(msg, status: code);
  }

  String? _extractErrorMessage(dynamic body) {
    if (body == null) return null;
    if (body is String) return body;
    if (body is Map) {
      final err = body['error'];
      if (err is Map && err['message'] is String) {
        return err['message'] as String;
      }
      if (body['message'] is String) return body['message'] as String;
      if (body['message'] is List && body['message'].isNotEmpty) {
        final first = body['message'][0];
        if (first is String) return first;
        if (first is Map &&
            first['messages'] is List &&
            first['messages'].isNotEmpty) {
          final m = first['messages'][0];
          if (m is Map && m['message'] is String) return m['message'] as String;
        }
      }
    }
    return null;
  }
}
