import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../features/auth/data/auth_repository.dart';
import '../../../gen/assets.gen.dart';
import '../../../routes/app_routes.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    // Коротка пауза, щоб Splash відмальувався (опційно)
    await Future<void>.delayed(const Duration(milliseconds: 300));

    try {
      final authRepo = context.read<AuthRepository>();
      final ok = await authRepo.tryRestoreSession();
      if (!mounted) return;

      if (ok) {
        // Є валідна сесія — одразу в додаток
        context.go(AppRoutes.home);
      } else {
        // Немає сесії — показуємо онбординг (або заміни на AppRoutes.signIn)
        context.go(AppRoutes.onBoarding);
      }
    } catch (_) {
      if (!mounted) return;
      context.go(AppRoutes.onBoarding);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Center(
          child: Assets.images.download.image(
            fit: BoxFit.cover,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}
