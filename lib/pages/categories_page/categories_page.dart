import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/gen/assets.gen.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_base_architecture/routes/app_routes.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_cards_categories_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../features/category/blocs/category_bloc.dart';
import '../../features/category/blocs/category_event.dart';
import '../../features/category/blocs/category_state.dart';
import '../../features/category/models/category.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        title: const Text('Categories'),
        leadingWidth: 68.0,
        titleSpacing: 16.0,
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 28.0),
          child: IconButton(
            onPressed: () => context.pop(),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 24.0, minHeight: 24.0),
            icon: SvgPicture.asset(
              Assets.icons.icBack.path,
              width: 24.0,
              height: 24.0,
            ),
          ),
        ),
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          return state.when(
            // НІЯКИХ МОКІВ: тільки лоадер
            initial: () => const _Loading(),
            loading: (_) => const _Loading(),
            failure:
                (message) => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          color: AppColors.orange,
                          size: 32,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Failed to load categories.\n$message',
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: AppColors.softGray),
                        ),
                        const SizedBox(height: 12),
                        TextButton(
                          onPressed:
                              () => context.read<CategoryBloc>().add(
                                const CategoryEvent.fetch(forceRefresh: true),
                              ),
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                ),
            success: (items) => _CategoriesList(items: items),
          );
        },
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

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

class _CategoriesList extends StatelessWidget {
  const _CategoriesList({required this.items});
  final List<Category> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Text(
            'No categories yet',
            style: TextStyle(color: AppColors.softGray),
          ),
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 19.0),
          for (int i = 0; i < items.length; i++) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: CustomCardsCategoriesWidget(
                title: items[i].title,
                count: items[i].itemCount ?? 0,
                photoUrl: items[i].photoUrl,
                onPressed:
                    () =>
                        context.push(AppRoutes.categoryItems, extra: items[i]),
              ),
            ),
            const SizedBox(height: 14.0),
          ],
        ],
      ),
    );
  }
}
