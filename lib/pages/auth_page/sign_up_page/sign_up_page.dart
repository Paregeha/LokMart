import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light, // ANDROID
        statusBarBrightness: Brightness.dark, // iOS
      ),
      child: Scaffold(backgroundColor: AppColors.white, body: Column()),
    );
  }
}
