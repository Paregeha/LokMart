import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/gen/assets.gen.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_base_architecture/resources/app_fonts.dart';
import 'package:flutter_base_architecture/widgets/cart/custom_item_cart_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/category/models/category.dart';
import '../../features/products/blocs/products_bloc.dart';
import '../../features/products/blocs/products_event.dart';
import '../../features/products/blocs/products_state.dart';
import '../../features/products/data/products_repository.dart';
import '../../features/products/models/products.dart';
import '../../features/products/models/products_filter.dart';
import '../../widgets/buttons/custom_filter_widget.dart';
import '../../widgets/text_fields/custom_text_field_widget.dart';

class CategoryItemsPage extends StatefulWidget {
  const CategoryItemsPage({super.key});

  @override
  State<CategoryItemsPage> createState() => _CategoryItemsPageState();
}

class _CategoryItemsPageState extends State<CategoryItemsPage> {
  @override
  Widget build(BuildContext context) {
    final category = GoRouterState.of(context).extra as Category?;

    return BlocProvider<ProductsBloc>(
      create:
          (ctx) => ProductsBloc(ctx.read<ProductRepository>())..add(
            ProductsEvent.fetchFirst(
              filter: ProductsFilter(categoryId: category?.id),
            ),
          ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          scrolledUnderElevation: 0,
          leading: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 28.0),
              child: IconButton(
                onPressed: () => context.pop(),
                icon: SvgPicture.asset(
                  Assets.icons.icBack.path,
                  width: 24.0,
                  height: 24.0,
                ),
              ),
            ),
          ),
          leadingWidth: 68.0,
          titleSpacing: 16.0,
          title: Text(
            category?.title ?? 'Items',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: AppFonts.w600semiBold,
              fontFamily: AppFonts.fontFamily,
              height: 1,
              letterSpacing: -0.3,
              color: AppColors.dark,
            ),
          ),
          centerTitle: false,
        ),
        body: Column(
          children: [
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextFieldWidget(
                      color: AppColors.white,
                      hintText: 'Search...',
                      prefix: Padding(
                        padding: const EdgeInsets.only(
                          left: 25.0,
                          top: 18.0,
                          bottom: 18.0,
                          right: 16.0,
                        ),
                        child: SvgPicture.asset(
                          Assets.icons.icSearch.path,
                          width: 24.0,
                          height: 24.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 18.0),
                  CustomFilterWidget(onPressed: () {}),
                ],
              ),
            ),
            const SizedBox(height: 30.0),

            Expanded(
              child: BlocBuilder<ProductsBloc, ProductsState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const _ProductsLoading(),
                    loading: (_) => const _ProductsLoading(),
                    failure:
                        (message) => _ProductsError(
                          message: message,
                          onRetry:
                              () => context.read<ProductsBloc>().add(
                                ProductsEvent.fetchFirst(
                                  filter: ProductsFilter(
                                    categoryId: category?.id,
                                  ),
                                ),
                              ),
                        ),
                    loadingMore:
                        (products, _) =>
                            _ProductsListColumn(products: products),
                    success:
                        (products) => _ProductsListColumn(products: products),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductsLoading extends StatelessWidget {
  const _ProductsLoading();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: CircularProgressIndicator(color: AppColors.orange),
      ),
    );
  }
}

class _ProductsError extends StatelessWidget {
  const _ProductsError({required this.message, required this.onRetry});
  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, color: AppColors.orange, size: 32),
            const SizedBox(height: 8),
            Text(
              'Failed to load products.\n$message',
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.softGray),
            ),
            const SizedBox(height: 12),
            TextButton(onPressed: onRetry, child: const Text('Retry')),
          ],
        ),
      ),
    );
  }
}

class _ProductsListColumn extends StatelessWidget {
  const _ProductsListColumn({required this.products});
  final List<Products> products;

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Text(
            'No products found',
            style: TextStyle(color: AppColors.softGray),
          ),
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: CustomItemCartWidget(products: products.first),
          ),
          const SizedBox(height: 25.0),
          for (int i = 1; i < products.length; i++) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: CustomItemCartWidget(products: products[i]),
            ),
            const SizedBox(height: 25.0),
          ],
        ],
      ),
    );
  }
}
