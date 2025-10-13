import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/pages/auth_page/sign_in_page/sign_in_page.dart';
import 'package:flutter_base_architecture/pages/auth_page/sign_up_page/sign_up_page.dart';
import 'package:flutter_base_architecture/pages/categories_page/categories_page.dart';
import 'package:flutter_base_architecture/pages/categories_page/categoriy_items_page.dart';
import 'package:flutter_base_architecture/pages/home_page/home_page.dart';
import 'package:flutter_base_architecture/pages/on_boarding_page/OnBoardingPage.dart';
import 'package:flutter_base_architecture/pages/order_page/OrderPage.dart';
import 'package:flutter_base_architecture/pages/profile_page/profile_page.dart';
import 'package:flutter_base_architecture/pages/shooping_cart_page/shopping_cart_page.dart';
import 'package:flutter_base_architecture/pages/test_adapt.dart';
import 'package:flutter_base_architecture/pages/uncategorized_pages/splash_screen_page/splash_screen_page.dart';
import 'package:flutter_base_architecture/pages/wishlist_page/wishlist_page.dart';
import 'package:flutter_base_architecture/widgets/navigations/custom_bottom_bar_widget.dart';
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
      GoRoute(
        path: AppRoutes.test,
        name: 'Test',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            child: TestAdapt(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return FadeTransition(opacity: animation, child: child);
            },
          );
        },
      ),
      GoRoute(
        path: AppRoutes.categories,
        name: 'Categories',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            child: CategoriesPage(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return FadeTransition(opacity: animation, child: child);
            },
          );
        },
      ),

      GoRoute(
        path: AppRoutes.categoryItems,
        name: 'CategoryItems',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            child: CategoryItemsPage(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return FadeTransition(opacity: animation, child: child);
            },
          );
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          final idx = navigationShell.currentIndex;
          return Scaffold(
            body: navigationShell,
            bottomNavigationBar: CustomBottomBarWidget(
              activeIndex: idx,
              onTap:
                  (i) => navigationShell.goBranch(
                    i,
                    initialLocation:
                        i != idx, // якщо та сама вкладка — не ресетимо
                  ),
            ),
          );
        },
        branches: [
          // 0: Home
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'home'),
            routes: [
              GoRoute(
                path: AppRoutes.home,
                name: 'home',
                pageBuilder:
                    (ctx, st) => const NoTransitionPage(child: HomePage()),
              ),
            ],
          ),

          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'order'),
            routes: [
              GoRoute(
                path: AppRoutes.order,
                name: 'orders',
                pageBuilder:
                    (ctx, st) => const NoTransitionPage(child: OrderPage()),
              ),
            ],
          ),

          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(
              debugLabel: 'shopping cart',
            ),
            routes: [
              GoRoute(
                path: AppRoutes.shoppingCart,
                name: 'shopping cart',
                pageBuilder:
                    (ctx, st) =>
                        const NoTransitionPage(child: ShoppingCartPage()),
              ),
            ],
          ),

          // 3: Wishlist
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'wishlist'),
            routes: [
              GoRoute(
                path: AppRoutes.wishlist,
                name: 'wishlist',
                pageBuilder:
                    (ctx, st) => const NoTransitionPage(child: WishlistPage()),
              ),
            ],
          ),

          // 4: Profile
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'profile'),
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                name: 'profile',
                pageBuilder:
                    (ctx, st) => const NoTransitionPage(child: ProfilePage()),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
