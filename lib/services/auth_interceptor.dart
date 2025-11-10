import 'package:dio/dio.dart';
import 'auth_token_provider.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({this.skipAuthPaths = const {}});

  final Set<String> skipAuthPaths;

  bool _shouldSkip(RequestOptions options) {
    if (options.extra['noAuth'] == true) return true;

    String path = options.path;
    try {
      final uri = Uri.parse(options.path);
      path = uri.hasEmptyPath ? options.path : uri.path;
    } catch (_) {}

    if (path.startsWith('/api/')) path = path.substring(4);

    return skipAuthPaths.any((p) => path.startsWith(p));
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (_shouldSkip(options)) {
      handler.next(options);
      return;
    }

    final token = await AuthTokenProvider.instance.getToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}
