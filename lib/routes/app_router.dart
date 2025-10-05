import 'package:flutter/cupertino.dart';
import 'package:flutter_base_architecture/pages/auth_page/sign_in_page/sign_in_page.dart';
import 'package:flutter_base_architecture/pages/auth_page/sign_up_page/sign_up_page.dart';
import 'package:flutter_base_architecture/pages/on_boarding_page/OnBoardingPage.dart';
import 'package:flutter_base_architecture/pages/uncategorized_pages/splash_screen_page/splash_screen_page.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter instance = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        name: 'splash',
        pageBuilder:
            (BuildContext context, GoRouterState state) =>
                const NoTransitionPage(child: SplashScreenPage()),
      ),
      GoRoute(
        path: AppRoutes.onBoarding,
        name: 'OnBoarding',
        pageBuilder:
            (BuildContext context, GoRouterState state) => CustomTransitionPage(
              child: const OnBoardingPage(),
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
                return FadeTransition(opacity: animation, child: child);
              },
            ),
      ),
      GoRoute(
        path: AppRoutes.signIn,
        name: 'SignIn',
        pageBuilder:
            (BuildContext context, GoRouterState state) => CustomTransitionPage(
              child: SignInPage(),
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
                return FadeTransition(opacity: animation, child: child);
              },
            ),
      ),
      GoRoute(
        path: AppRoutes.signUp,
        name: 'SignUp',
        pageBuilder:
            (BuildContext context, GoRouterState state) => CustomTransitionPage(
              child: SignUpPage(),
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
                return FadeTransition(opacity: animation, child: child);
              },
            ),
      ),
    ],
  );
}
