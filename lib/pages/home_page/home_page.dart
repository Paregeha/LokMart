import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_architecture/gen/assets.gen.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_base_architecture/routes/app_routes.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_filter_widget.dart';
import 'package:flutter_base_architecture/widgets/cart/custom_deals_cart_widget.dart';
import 'package:flutter_base_architecture/widgets/cart/custom_item_cart_widget.dart';
import 'package:flutter_base_architecture/widgets/text_fields/custom_text_field_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/env.dart';
import '../../features/category/blocs/category_bloc.dart';
import '../../features/category/blocs/category_event.dart';
import '../../features/category/blocs/category_state.dart';
import '../../features/category/models/category.dart';
import '../../features/products/blocs/products_bloc.dart';
import '../../features/products/blocs/products_event.dart';
import '../../features/products/blocs/products_state.dart';
import '../../features/products/models/products.dart';
import '../../resources/app_fonts.dart';

// імпорти залишай як є

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PageController _bannerCtrl;

  int indexBottomBar = 0;
  int indexAdvertising = 0;

  final List<Widget> _banners = [
    Assets.images.bannerFish.image(),
    Assets.images.mainBanner.image(),
    Assets.images.bannerMeat.image(),
  ];

  @override
  void initState() {
    super.initState();
    final start = _banners.length * 1000 + 1;
    _bannerCtrl = PageController(viewportFraction: 0.7, initialPage: start);
  }

  @override
  void dispose() {
    _bannerCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          child: Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppBar(
              backgroundColor: AppColors.white,
              scrolledUnderElevation: 0,
              centerTitle: false,
              toolbarHeight: 50.0,
              titleSpacing: 30.0,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'Hello, Brayden',
                    style: TextStyle(
                      fontFamily: AppFonts.fontFamily,
                      fontWeight: AppFonts.w700bold,
                      fontSize: 22.0,
                      height: 1.0,
                      letterSpacing: -0.3,
                      color: AppColors.dark,
                    ),
                  ),
                  Text(
                    'Good morning.',
                    style: TextStyle(
                      fontFamily: AppFonts.fontFamily,
                      fontWeight: AppFonts.w400regular,
                      fontSize: 14.0,
                      height: 1.0,
                      letterSpacing: -0.3,
                      color: AppColors.softGray,
                    ),
                  ),
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(9999.0),
                    onTap: () {},
                    child: Stack(
                      children: [
                        SizedBox(
                          width: 30.0,
                          height: 30.0,
                          child: Center(
                            child: SvgPicture.asset(
                              Assets.icons.icNotification,
                              width: 24.0,
                              height: 24.0,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 3.0,
                          child: Container(
                            width: 13.0,
                            height: 13.0,
                            decoration: const BoxDecoration(
                              color: AppColors.orange,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '5',
                                style: TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: AppFonts.w500medium,
                                  fontFamily: AppFonts.fontFamily,
                                  height: 1.0,
                                  letterSpacing: 0.0,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Container(
                    width: 43.0,
                    height: 43.0,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    clipBehavior: Clip.antiAlias,
                    child: Assets.images.man.image(fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 19.0),
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
                                  Assets.icons.icSearch,
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
                    const SizedBox(height: 3.0),
                    AspectRatio(
                      aspectRatio: 18 / 7,
                      child: PageView.builder(
                        controller: _bannerCtrl,
                        onPageChanged:
                            (i) => setState(
                              () => indexAdvertising = i % _banners.length,
                            ),
                        itemBuilder: (context, i) {
                          return AnimatedBuilder(
                            animation: _bannerCtrl,
                            builder: (context, child) {
                              final currentPage =
                                  _bannerCtrl.hasClients
                                      ? (_bannerCtrl.page ??
                                          _bannerCtrl.initialPage.toDouble())
                                      : _bannerCtrl.initialPage.toDouble();
                              final distance = (i - currentPage).abs();
                              final proximity = (1 - distance).clamp(0.0, 1.0);
                              const minScale = 0.80;
                              const maxScale = 1.00;
                              final scale =
                                  minScale + (maxScale - minScale) * proximity;

                              return Transform.scale(
                                scale: scale,
                                alignment: Alignment.center,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(28),
                                  child: _banners[i % _banners.length],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    AnimatedSmoothIndicator(
                      activeIndex: indexAdvertising,
                      count: _banners.length,
                      effect: ExpandingDotsEffect(
                        dotWidth: 14,
                        dotHeight: 4,
                        expansionFactor: 2,
                        spacing: 5,
                        dotColor: AppColors.gray,
                        activeDotColor:
                            Color.lerp(
                              AppColors.gradientOne,
                              AppColors.gradientTwo,
                              0.5,
                            )!,
                      ),
                    ),

                    const SizedBox(height: 39.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Categories',
                            style: TextStyle(
                              color: AppColors.dark,
                              fontFamily: AppFonts.fontFamily,
                              fontWeight: AppFonts.w700bold,
                              fontSize: 22.0,
                              letterSpacing: -0.08,
                            ),
                          ),
                          TextButton(
                            onPressed: () => context.push(AppRoutes.categories),
                            child: Row(
                              children: [
                                Text(
                                  'Show all',
                                  style: TextStyle(
                                    color: AppColors.orange,
                                    fontFamily: AppFonts.fontFamily,
                                    fontWeight: AppFonts.w600semiBold,
                                    fontSize: 16.0,
                                    letterSpacing: -0.15,
                                  ),
                                ),
                                const SizedBox(width: 6.0),
                                SvgPicture.asset(Assets.icons.icRightArrow),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    SizedBox(
                      height: 140,
                      child: BlocBuilder<CategoryBloc, CategoryState>(
                        builder: (context, state) {
                          return state.when(
                            initial: () => const _CategoriesSkeleton(),
                            loading: (silent) => const _CategoriesSkeleton(),
                            failure:
                                (message) => _CategoriesError(
                                  message: message,
                                  onRetry:
                                      () => context.read<CategoryBloc>().add(
                                        const CategoryEvent.fetch(
                                          forceRefresh: true,
                                        ),
                                      ),
                                ),
                            success: (items) {
                              if (items.isEmpty) {
                                return const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 32.0,
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'No categories yet',
                                      style: TextStyle(
                                        color: AppColors.softGray,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              return ListView.separated(
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32.0,
                                ),
                                separatorBuilder:
                                    (_, __) => const SizedBox(width: 15.0),
                                itemCount: items.length,
                                itemBuilder:
                                    (_, i) => _CategoryChip(item: items[i]),
                              );
                            },
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 39.0),
                    // --- решта твоєї сторінки без змін ---
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Popular Deals',
                            style: TextStyle(
                              color: AppColors.dark,
                              fontFamily: AppFonts.fontFamily,
                              fontWeight: AppFonts.w700bold,
                              fontSize: 22.0,
                              letterSpacing: -0.08,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Text(
                                  'Show all',
                                  style: TextStyle(
                                    color: AppColors.orange,
                                    fontFamily: AppFonts.fontFamily,
                                    fontWeight: AppFonts.w600semiBold,
                                    fontSize: 16.0,
                                    letterSpacing: -0.15,
                                  ),
                                ),
                                const SizedBox(width: 6.0),
                                SvgPicture.asset(Assets.icons.icRightArrow),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 267.0,
                      child: BlocBuilder<ProductsBloc, ProductsState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            success: (products) {
                              // Беремо тільки товари з рейтингом і сортуємо за спаданням
                              final rated =
                                  products
                                      .where((p) => p.raiting != null)
                                      .toList()
                                    ..sort(
                                      (a, b) => (b.raiting ?? 0).compareTo(
                                        a.raiting ?? 0,
                                      ),
                                    );

                              final count = math.min(5, rated.length);
                              if (count == 0) {
                                return const Center(
                                  child: Text(
                                    'No rated products yet',
                                    style: TextStyle(color: AppColors.softGray),
                                  ),
                                );
                              }

                              return ListView.separated(
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32.0,
                                ),
                                separatorBuilder:
                                    (_, __) => const SizedBox(width: 15.0),
                                itemCount: count,
                                itemBuilder:
                                    (_, i) => CustomDealsCartWidget(
                                      product: rated[i],
                                      onPressed: () {},
                                    ),
                              );
                            },
                            orElse:
                                () => ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 32.0,
                                  ),
                                  separatorBuilder:
                                      (_, __) => const SizedBox(width: 15.0),
                                  itemCount: 5,
                                  itemBuilder:
                                      (_, __) => const SizedBox(
                                        width: 208,
                                        child: Opacity(
                                          opacity: 0.3,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 6,
                                            ),
                                            child:
                                                _DealsSkeleton(), // маленький локальний скелетон
                                          ),
                                        ),
                                      ),
                                ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 39.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'All Grocery',
                            style: TextStyle(
                              color: AppColors.dark,
                              fontFamily: AppFonts.fontFamily,
                              fontWeight: AppFonts.w700bold,
                              fontSize: 22.0,
                              letterSpacing: -0.08,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    BlocBuilder<ProductsBloc, ProductsState>(
                      builder: (context, state) {
                        return state.when(
                          initial: () => const _ProductsSkeleton(),
                          loading: (_) => const _ProductsSkeleton(),
                          failure:
                              (message) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32.0,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Failed to load products.\n$message',
                                        style: const TextStyle(
                                          color: AppColors.softGray,
                                        ),
                                        maxLines: 2,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed:
                                          () => context.read<ProductsBloc>().add(
                                            const ProductsEvent.fetchFirst(),
                                          ),
                                      child: const Text('Retry'),
                                    ),
                                  ],
                                ),
                              ),
                          success: (products) => _ProductsList(products),
                          loadingMore: (products, _) => _ProductsList(products),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ProductsSkeleton extends StatelessWidget {
  const _ProductsSkeleton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: ListView.separated(
        separatorBuilder: (_, __) => const SizedBox(height: 25.0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder:
            (_, __) => Opacity(
              opacity: 0.3,
              child: Assets.images.apple.image(
                width: double.infinity,
                height: 138,
                fit: BoxFit.cover,
              ),
            ),
      ),
    );
  }
}

Widget _ProductsList(List<Products> products) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 32.0),
    child: ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(height: 25.0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (_, i) => CustomItemCartWidget(products: products[i]),
    ),
  );
}

class _CategoriesSkeleton extends StatelessWidget {
  const _CategoriesSkeleton();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      separatorBuilder: (_, __) => const SizedBox(width: 15.0),
      itemCount: 5,
      itemBuilder: (_, __) => const _CategoryChip.skeleton(),
    );
  }
}

class _CategoriesError extends StatelessWidget {
  const _CategoriesError({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Failed to load categories.\n$message',
              style: const TextStyle(color: AppColors.softGray),
              maxLines: 2,
            ),
          ),
          TextButton(onPressed: onRetry, child: const Text('Retry')),
        ],
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({required this.item});

  final Category item;

  const _CategoryChip.skeleton()
    : item = const Category(
        id: 0,
        title: ' ',
        photoUrl: null,
        itemCount: null,
        slug: null,
        description: null,
      );

  @override
  Widget build(BuildContext context) {
    final isSkeleton = item.id == 0;

    return SizedBox(
      width: 90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(14.0),
            onTap:
                isSkeleton
                    ? null
                    : () => context.push(AppRoutes.categoryItems, extra: item),
            child: Container(
              width: 88,
              height: 88,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.gray1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: _buildIcon(item, isSkeleton),
              ),
            ),
          ),
          const SizedBox(height: 6),
          _buildTitle(item, isSkeleton),
          _buildCount(item, isSkeleton),
        ],
      ),
    );
  }

  Widget _buildIcon(Category c, bool isSkeleton) {
    if (isSkeleton) {
      return ColoredBox(color: AppColors.gray1.withOpacity(0.2));
    }
    if (c.photoUrl != null && c.photoUrl!.isNotEmpty) {
      return Image.network(
        c.photoUrl!.startsWith('http')
            ? c.photoUrl!
            : '${Env.baseUrl}${c.photoUrl}',
        fit: BoxFit.contain,
      );
    }
    return Assets.images.icLemon.image();
  }

  Widget _buildTitle(Category c, bool isSkeleton) {
    if (isSkeleton) {
      return Container(
        width: 64,
        height: 16,
        decoration: BoxDecoration(
          color: AppColors.gray1.withOpacity(0.2),
          borderRadius: BorderRadius.circular(4),
        ),
      );
    }
    return Text(
      c.title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: AppFonts.w600semiBold,
        fontFamily: AppFonts.fontFamily,
        letterSpacing: -0.41,
        color: AppColors.dark,
      ),
    );
  }

  Widget _buildCount(Category c, bool isSkeleton) {
    if (isSkeleton) {
      return Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Container(
          width: 54,
          height: 12,
          decoration: BoxDecoration(
            color: AppColors.gray1.withOpacity(0.2),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      );
    }
    final count = c.itemCount ?? 0;
    return Text(
      '$count Items',
      style: const TextStyle(
        fontSize: 12,
        fontWeight: AppFonts.w400regular,
        fontFamily: AppFonts.fontFamily,
        letterSpacing: -0.08,
        color: AppColors.softGray,
      ),
    );
  }
}

class _DealsSkeleton extends StatelessWidget {
  const _DealsSkeleton();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Assets.images.banana.image(width: 208, height: 156, fit: BoxFit.cover),
        const SizedBox(height: 8),
        Container(
          width: 120,
          height: 16,
          color: AppColors.gray1.withOpacity(0.2),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 22,
                  color: AppColors.gray1.withOpacity(0.2),
                ),
                const SizedBox(width: 7),
                Container(
                  width: 70,
                  height: 14,
                  color: AppColors.gray1.withOpacity(0.2),
                ),
              ],
            ),
            const SizedBox(width: 100),
            Container(
              width: 60,
              height: 16,
              color: AppColors.gray1.withOpacity(0.2),
            ),
          ],
        ),
      ],
    );
  }
}
