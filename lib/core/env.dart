import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class Env {
  static const String _override = String.fromEnvironment(
    'BASE_URL',
    defaultValue: '',
  );

  static String get baseUrl {
    if (_override.isNotEmpty) return _override;

    if (kIsWeb) return 'http://localhost:1337';
    if (Platform.isIOS || Platform.isMacOS) return 'http://localhost:1337';
    if (Platform.isAndroid) return 'http://10.0.2.2:1337';

    return 'http://localhost:1337';
  }
}

// flutter run --dart-define=BASE_URL=http://localhost:1337
// flutter run --dart-define=BASE_URL=http://<IP_твого_Мака>:1337
