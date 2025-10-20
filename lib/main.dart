import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'core/env.dart';
import 'features/category/blocs/category_bloc.dart';
import 'features/category/blocs/category_event.dart';
import 'features/category/data/category_repository.dart';
import 'routes/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dio = Dio(
      BaseOptions(
        baseUrl: '${Env.baseUrl}/api',
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 12),
      ),
    )
    ..interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: true,
        maxWidth: 120,
        filter: (options, args) => !args.isResponse || !args.hasUint8ListData,
      ),
    );

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
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<CategoryBloc>(
            create:
                (ctx) =>
                    CategoryBloc(ctx.read<CategoryRepository>())
                      ..add(CategoryFetchRequested()),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'LokMart',
          routerConfig: AppRouter.instance,
          // theme: AppThemes.light(),
        ),
      ),
    );
  }
}
