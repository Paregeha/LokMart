import 'package:flutter/material.dart';

class AppSnackBar {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static void show(String message) {
    final messenger = messengerKey.currentState;
    if (messenger == null) return;

    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.fixed, // ✅ головне
        ),
      );
  }

  static void error(String message) => show(message);
}
