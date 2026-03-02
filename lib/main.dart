import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/routes/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:go_router/go_router.dart';

import 'core/ui/app_snackbar.dart';
import 'features/address/data/address_repository.dart';
import 'features/auth/data/auth_repository.dart';
import 'features/cart/blocs/cart_bloc.dart';
import 'features/cart/blocs/cart_event.dart';
import 'features/cart/data/cart_repository.dart';
import 'features/category/blocs/category_bloc.dart';
import 'features/category/blocs/category_event.dart';
import 'features/category/data/category_repository.dart';
import 'features/notifications/app_notifications.dart';
import 'features/order/data/orders_repository.dart';
import 'features/payments/blocs/checkout_payment_bloc.dart';
import 'features/payments/blocs/payment_methods_bloc.dart';
import 'features/payments/blocs/payment_methods_event.dart';
import 'features/payments/data/payments_repository.dart';
import 'features/products/blocs/products_bloc.dart';
import 'features/products/blocs/products_event.dart';
import 'features/products/data/products_repository.dart';
import 'features/profile/bloc/profile_bloc.dart';
import 'features/profile/bloc/profile_event.dart';
import 'routes/app_router.dart';
import 'services/dio_service.dart';

import 'features/wishlist/blocs/wishlist_bloc.dart';
import 'features/wishlist/blocs/wishlist_event.dart';
import 'features/wishlist/data/wishlist_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppNotifications.instance.init(
    onTap: (payload) {
      if (payload == null || payload.isEmpty) return;

      final map = jsonDecode(payload) as Map<String, dynamic>;
      if (map['type'] == 'order_arrived') {
        final docId = (map['documentId'] ?? '').toString().trim();
        if (docId.isEmpty) return;

        final ctx = AppRouter.rootNavKey.currentContext;
        if (ctx == null) return;

        ctx.go(AppRoutes.trackOrder, extra: docId);
      }
    },
  );
  Stripe.publishableKey =
      'pk_test_51SmEQQJpswxfMmVNAqRpC2JVjRrWhvilTFv8hpmXZTaJsYmVewT6VeLEw8ultM1EJpis9qmcX94zwaCodUl3SAMS00XuY3TBJZ'
          .trim();
  Stripe.merchantIdentifier = 'merchant.com.lokmart';
  await Stripe.instance.applySettings();

  final key = Stripe.publishableKey;
  debugPrint('Stripe PK starts: ${key.substring(0, 10)} len=${key.length}');
  if (!key.startsWith('pk_') || key.length < 30) {
    throw Exception('Stripe publishable key looks invalid');
  }

  final dio = DioService.instance;
  final authRepository = AuthRepository(dio: dio);

  runApp(MyApp(dio: dio, authRepository: authRepository));
  await Future.delayed(const Duration(seconds: 10));
  await AppNotifications.instance.showCourierArrived(documentId: 'test123');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.dio, required this.authRepository});

  final Dio dio;
  final AuthRepository authRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>.value(value: authRepository),

        RepositoryProvider<CategoryRepository>(
          create: (_) => CategoryRepository(dio),
        ),
        RepositoryProvider<ProductRepository>(
          create: (_) => ProductRepository(dio),
        ),

        RepositoryProvider<CartRepository>(
          create:
              (ctx) => CartRepository(
                dio: dio,
                authRepository: ctx.read<AuthRepository>(),
              ),
        ),

        RepositoryProvider<AddressRepository>(
          create:
              (ctx) => AddressRepository(
                dio: dio,
                authRepository: ctx.read<AuthRepository>(),
              ),
        ),

        RepositoryProvider<PaymentsRepository>(
          create: (_) => PaymentsRepository(dio: dio),
        ),

        RepositoryProvider<OrdersRepository>(
          create: (_) => OrdersRepository(dio: dio),
        ),

        RepositoryProvider<WishlistRepository>(
          create: (_) => WishlistRepository(dio),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<CartBloc>(
            create:
                (ctx) =>
                    CartBloc(ctx.read<CartRepository>())
                      ..add(const CartEvent.load()),
          ),

          BlocProvider<CheckoutPaymentBloc>(
            create:
                (ctx) => CheckoutPaymentBloc(
                  paymentsRepo: ctx.read<PaymentsRepository>(),
                  ordersRepo: ctx.read<OrdersRepository>(),
                  cartBloc: ctx.read<CartBloc>(),
                ),
          ),

          BlocProvider<ProfileBloc>(
            create:
                (ctx) =>
                    ProfileBloc(ctx.read<AuthRepository>())
                      ..add(const ProfileBoot()),
          ),

          BlocProvider<WishlistBloc>(
            create:
                (ctx) =>
                    WishlistBloc(ctx.read<WishlistRepository>())
                      ..add(const WishlistEvent.load()),
          ),

          BlocProvider<CategoryBloc>(
            create:
                (ctx) =>
                    CategoryBloc(ctx.read<CategoryRepository>())
                      ..add(const CategoryEvent.fetch()),
          ),

          BlocProvider<ProductsBloc>(
            create:
                (ctx) =>
                    ProductsBloc(ctx.read<ProductRepository>())
                      ..add(ProductsEvent.fetchFirst()),
          ),

          BlocProvider<PaymentMethodsBloc>(
            create:
                (ctx) =>
                    PaymentMethodsBloc(ctx.read<PaymentsRepository>())
                      ..add(const PaymentMethodsEvent.fetch()),
          ),
        ],
        child: MaterialApp.router(
          scaffoldMessengerKey: AppSnackBar.messengerKey,
          debugShowCheckedModeBanner: false,
          title: 'LokMart',
          routerConfig: AppRouter.instance,
        ),
      ),
    );
  }
}
