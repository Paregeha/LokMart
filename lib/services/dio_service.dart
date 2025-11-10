import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../core/env.dart';
import 'auth_interceptor.dart';

class DioService {
  DioService._();
  static final Dio instance = _build();

  static Dio _build() {
    final dio = Dio(
      BaseOptions(
        baseUrl: '${Env.baseUrl}/api',
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 12),
        sendTimeout: const Duration(seconds: 8),
        validateStatus: (code) => code != null && code >= 200 && code < 600,
      ),
    );

    dio.interceptors.addAll([
      AuthInterceptor(
        skipAuthPaths: const {
          '/auth/local',
          '/auth/local/register',
          '/auth/forgot-password',
          '/auth/reset-password',
          '/auth/send-email-confirmation',
        },
      ),
      if (kDebugMode)
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: false,
          responseBody: true,
          compact: true,
          maxWidth: 120,
        ),
    ]);

    return dio;
  }
}
