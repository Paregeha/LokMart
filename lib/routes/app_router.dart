import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/pages/auth_page/sign_in_page/sign_in_page.dart';
import 'package:flutter_base_architecture/pages/auth_page/sign_up_page/sign_up_page.dart';
import 'package:flutter_base_architecture/pages/categories_page/categories_page.dart';
import 'package:flutter_base_architecture/pages/categories_page/categoriy_items_page.dart';
import 'package:flutter_base_architecture/pages/checkout_page/add_new_card_page.dart';
import 'package:flutter_base_architecture/pages/checkout_page/checkout_address_page.dart';
import 'package:flutter_base_architecture/pages/checkout_page/checkout_payment_page.dart';
import 'package:flutter_base_architecture/pages/detail_information/detail_information_page.dart';
import 'package:flutter_base_architecture/pages/home_page/home_page.dart';
import 'package:flutter_base_architecture/pages/on_boarding_page/OnBoardingPage.dart';
import 'package:flutter_base_architecture/pages/order_page/OrderPage.dart';
import 'package:flutter_base_architecture/pages/profile_page/profile_page.dart';
import 'package:flutter_base_architecture/pages/shooping_cart_page/shopping_cart_page.dart';
import 'package:flutter_base_architecture/pages/test_adapt.dart';
import 'package:flutter_base_architecture/pages/track_order_page/track_order_page.dart';
import 'package:flutter_base_architecture/pages/uncategorized_pages/splash_screen_page/splash_screen_page.dart';
import 'package:flutter_base_architecture/pages/wishlist_page/wishlist_page.dart';
import 'package:flutter_base_architecture/widgets/navigations/custom_bottom_bar_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../features/products/blocs/products_bloc.dart';
import '../features/products/blocs/products_event.dart';
import '../features/products/data/products_repository.dart';
import '../features/products/models/products_filter.dart';
import '../pages/filter_page/filter_options_page.dart';
import '../pages/search_page/search_page.dart';
import 'app_routes.dart';

class AppRouter {
  AppRouter._();

  static const int kCartTabIndex = 2;

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

      GoRoute(
        path: AppRoutes.searchPage,
        name: 'SearchPage',
        pageBuilder: (context, state) {
          final filter =
              state.extra as ProductsFilter? ?? const ProductsFilter();

          return CustomTransitionPage(
            child: BlocProvider<ProductsBloc>(
              create:
                  (ctx) =>
                      ProductsBloc(ctx.read<ProductRepository>())
                        ..add(ProductsEvent.fetchFirst(filter: filter)),
              child: SearchPage(initialFilter: filter),
            ),
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
        path: AppRoutes.filterOptionsPage,
        name: 'FilterOptionsPage',
        pageBuilder: (context, state) {
          final initial = state.extra as ProductsFilter?;
          return CustomTransitionPage(
            child: FilterOptionsPage(
              initialFilter: initial ?? const ProductsFilter(),
            ),
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
        path: AppRoutes.detailInformation,
        name: 'DetailInformation',
        pageBuilder: (BuildContext context, GoRouterState state) {
          final extra = state.extra;

          if (extra is! String) {
            // Якщо хтось відкрив сторінку без documentId — не падаємо
            return const NoTransitionPage(
              child: Scaffold(
                body: Center(
                  child: Text(
                    'Product ID is missing',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            );
          }

          final documentId = extra;

          return CustomTransitionPage(
            child: DetailInformationPage(documentId: documentId),
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
        path: AppRoutes.checkoutAddress,
        name: 'CheckoutAddress',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            child: CheckoutAddressPage(),
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
        path: AppRoutes.checkoutPayment,
        name: 'CheckoutPayment',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            child: CheckoutPaymentPage(),
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
        path: AppRoutes.addNewCard,
        name: 'AddNewCard',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            child: AddNewCardPage(),
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
        path: AppRoutes.trackOrder,
        name: 'TrackOrder',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            child: TrackOrderPage(),
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
        path: AppRoutes.shoppingCart,
        name: 'shopping cart',
        pageBuilder:
            (ctx, st) => const NoTransitionPage(child: ShoppingCartPage()),
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          final location = state.uri.toString();

          int activeIndex;
          if (location.startsWith(AppRoutes.shoppingCart)) {
            activeIndex = kCartTabIndex;
          } else {
            final shellIdx = navigationShell.currentIndex;
            activeIndex = shellIdx >= kCartTabIndex ? shellIdx + 1 : shellIdx;
          }

          return Scaffold(
            body: navigationShell,
            bottomNavigationBar: CustomBottomBarWidget(
              activeIndex: activeIndex,
              onTap: (i) {
                if (i == kCartTabIndex) {
                  context.push(AppRoutes.shoppingCart);
                  return;
                }
                final targetShellIndex = i > kCartTabIndex ? i - 1 : i;
                final shouldReset = i != activeIndex;
                navigationShell.goBranch(
                  targetShellIndex,
                  initialLocation: shouldReset,
                );
              },
            ),
          );
        },
        branches: [
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
