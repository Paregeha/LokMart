import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/features/cart/blocs/cart_bloc.dart';
import 'package:flutter_base_architecture/features/cart/blocs/cart_event.dart';
import 'package:flutter_base_architecture/features/products/data/products_repository.dart';
import 'package:flutter_base_architecture/features/products/models/products.dart';
import 'package:flutter_base_architecture/gen/assets.gen.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_base_architecture/resources/app_fonts.dart';
import 'package:flutter_base_architecture/routes/app_routes.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_button_count_widget.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_button_widget.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_related_product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class DetailInformationPage extends StatefulWidget {
  const DetailInformationPage({super.key, required this.documentId});
  final String documentId;

  @override
  State<DetailInformationPage> createState() => _DetailInformationPageState();
}

class _DetailInformationPageState extends State<DetailInformationPage> {
  int _count = 1;

  Products? _product; // ✅ кешимо продукт після FutureBuilder

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    final repo = context.read<ProductRepository>();

    final canAddToCart = _product != null;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: SvgPicture.asset(
            Assets.icons.icBack.path,
            width: 24.0,
            height: 24.0,
          ),
        ),
        centerTitle: false,
      ),

      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
          decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 12,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: SizedBox(
            child: CustomButtonsWidget(
              label: 'ADD TO CART',
              enable: canAddToCart,
              onPressed: () {
                final p = _product;
                if (p == null) return;

                context.read<CartBloc>().add(
                  CartEvent.add(productId: p.id, count: _count),
                );

                context.push(AppRoutes.shoppingCart);
              },
            ),
          ),
        ),
      ),

      body: FutureBuilder<Products>(
        future: repo.fetchByDocumentId(widget.documentId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  'Failed to load product details.\n${snapshot.error}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: AppFonts.fontFamily,
                    fontSize: 14,
                    color: AppColors.dark,
                  ),
                ),
              ),
            );
          }

          final product = snapshot.data;
          if (product == null) {
            return const Center(
              child: Text(
                'Product not found',
                style: TextStyle(
                  fontFamily: AppFonts.fontFamily,
                  fontSize: 16,
                  color: AppColors.dark,
                ),
              ),
            );
          }

          // ✅ зберігаємо продукт, щоб кнопка знизу знала product.id
          // робимо через microtask, щоб не сетати стейт під час build
          if (_product?.id != product.id) {
            Future.microtask(() {
              if (!mounted) return;
              setState(() => _product = product);
            });
          }

          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
              ).copyWith(bottom: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child:
                          product.photoUrl != null &&
                                  product.photoUrl!.isNotEmpty
                              ? Image.network(
                                product.photoUrl!,
                                fit: BoxFit.cover,
                                errorBuilder:
                                    (_, _, _) => Assets.images.banana.image(
                                      fit: BoxFit.cover,
                                    ),
                              )
                              : FittedBox(
                                fit: BoxFit.contain,
                                child: Assets.images.banana.image(),
                              ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  if (product.categoryName != null &&
                      product.categoryName!.isNotEmpty)
                    Text(
                      product.categoryName!.toUpperCase(),
                      style: TextStyle(
                        fontWeight: AppFonts.w600semiBold,
                        fontFamily: AppFonts.fontFamily,
                        fontSize: 16.0,
                        color: AppColors.orange,
                        height: 0.22,
                      ),
                    ),

                  const SizedBox(height: 8),

                  Text(
                    product.name,
                    style: TextStyle(
                      fontFamily: AppFonts.fontFamily,
                      fontWeight: AppFonts.w500medium,
                      fontSize: 20.0,
                      letterSpacing: -0.24,
                      color: AppColors.dark,
                    ),
                  ),
                  const SizedBox(height: 12),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '\$${(product.price ?? 0).toStringAsFixed(2)}',
                        style: TextStyle(
                          fontFamily: AppFonts.fontFamily,
                          fontWeight: AppFonts.w600semiBold,
                          fontSize: 20.0,
                          color: AppColors.dark,
                        ),
                      ),
                      const SizedBox(width: 9.0),

                      if (product.priceWithDiscount != null &&
                          product.priceWithDiscount! > 0)
                        Text(
                          '\$${product.priceWithDiscount!.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: AppFonts.w400regular,
                            fontFamily: AppFonts.fontFamily,
                            color: AppColors.softGray,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: AppColors.softGray,
                            decorationThickness: 1.4,
                          ),
                        ),

                      const Spacer(),

                      CustomButtonCountWidget(
                        heightCount: 36.0,
                        widthCount: 120.0,
                        paddingCount: 14.0,
                        value: _count,
                        onChanged: (v) => setState(() => _count = v),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    height: 72.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.0),
                      border: Border.all(color: AppColors.gray1, width: 1.0),
                    ),
                    child: Row(
                      children: [
                        Assets.icons.star.svg(width: 20, height: 20),
                        const SizedBox(width: 8),
                        Text(
                          '${(product.raiting ?? 0).toStringAsFixed(1)} rating',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: AppFonts.fontFamily,
                            fontWeight: AppFonts.w700bold,
                            letterSpacing: 0,
                            color: AppColors.dark,
                          ),
                        ),
                        const SizedBox(width: 12),
                        SizedBox(
                          height: 24,
                          child: VerticalDivider(
                            color: AppColors.gray1,
                            thickness: 1,
                            width: 1,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Assets.icons.delivery.svg(width: 20, height: 20),
                        const SizedBox(width: 8),
                        Text(
                          'FREE DELIVERY',
                          style: TextStyle(
                            color: AppColors.greenDelivery,
                            fontSize: 14.0,
                            fontWeight: AppFonts.w700bold,
                            fontFamily: AppFonts.fontFamily,
                            letterSpacing: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  if (product.description != null &&
                      product.description!.isNotEmpty)
                    Text(
                      product.description!,
                      style: TextStyle(
                        fontFamily: AppFonts.fontFamily,
                        fontWeight: AppFonts.w400regular,
                        fontSize: 14.0,
                        color: AppColors.dark,
                      ),
                    )
                  else
                    Text(
                      'No description provided.',
                      style: TextStyle(
                        fontFamily: AppFonts.fontFamily,
                        fontWeight: AppFonts.w400regular,
                        fontSize: 14.0,
                        color: AppColors.softGray,
                      ),
                    ),

                  const SizedBox(height: 24),

                  Row(
                    children: [
                      Text(
                        'Related product',
                        style: TextStyle(
                          color: AppColors.dark,
                          fontSize: 22.0,
                          fontFamily: AppFonts.fontFamily,
                          fontWeight: AppFonts.w700bold,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              'Show all',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: AppColors.orange,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Assets.icons.icRightArrow.svg(
                              width: 16,
                              height: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),
                  SizedBox(
                    height: 200,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(
                        horizontal: width < 360 ? 0 : 4,
                      ),
                      separatorBuilder: (_, _) => const SizedBox(width: 12.0),
                      itemCount: 3,
                      itemBuilder: (_, i) => const CustomRelatedProduct(),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
