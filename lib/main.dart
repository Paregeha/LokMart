import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/features/products/blocs/products_bloc.dart';
import 'package:flutter_base_architecture/features/products/blocs/products_event.dart';
import 'package:flutter_base_architecture/features/products/data/products_repository.dart';
import 'package:flutter_base_architecture/services/dio_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/category/blocs/category_bloc.dart';
import 'features/category/blocs/category_event.dart';
import 'features/category/data/category_repository.dart';
import 'routes/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dio = DioService.instance;

  runApp(MyApp(dio: dio));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.dio});

  final Dio dio;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CategoryRepository>(
          create: (_) => CategoryRepository(dio),
        ),
        RepositoryProvider<ProductRepository>(
          create: (_) => ProductRepository(dio),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
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
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'LokMart',
          routerConfig: AppRouter.instance,
        ),
      ),
    );
  }
}
