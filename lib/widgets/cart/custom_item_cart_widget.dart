import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/features/products/models/products.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_base_architecture/resources/app_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../gen/assets.gen.dart';
import '../../routes/app_routes.dart';

class CustomItemCartWidget extends StatefulWidget {
  const CustomItemCartWidget({super.key, this.products});

  final Products? products;

  @override
  State<CustomItemCartWidget> createState() => _CustomItemCartWidgetState();
}

class _CustomItemCartWidgetState extends State<CustomItemCartWidget> {
  bool enableHeart = false;

  @override
  Widget build(BuildContext context) {
    final product = widget.products;

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        final product = widget.products;
        if (product == null) return;

        if (product.documentId == null || product.documentId!.isEmpty) {
          debugPrint(
            'ERROR: product without documentId: id=${product.id}, name=${product.name}',
          );
          return;
        }

        debugPrint(
          'Open details product: id=${product.id}, name=${product.name}, documentId=${product.documentId}',
        );

        context.push(
          AppRoutes.detailInformation,
          extra: product.documentId, // <-- ТЕПЕР СЮДИ documentId
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.gray1.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child:
                      product?.photoUrl != null && product!.photoUrl!.isNotEmpty
                          ? Image.network(
                            product.photoUrl!,
                            width: 110,
                            height: 130,
                            fit: BoxFit.cover,
                            errorBuilder:
                                (_, _, _) => Assets.images.apple.image(
                                  width: 110,
                                  height: 130,
                                  fit: BoxFit.cover,
                                ),
                          )
                          : Assets.images.apple.image(
                            width: 110,
                            height: 130,
                            fit: BoxFit.cover,
                          ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () => setState(() => enableHeart = !enableHeart),
                    child:
                        enableHeart
                            ? Assets.icons.heartRed.svg(width: 22, height: 22)
                            : Assets.icons.heart.svg(width: 22, height: 22),
                  ),
                ),
              ],
            ),

            const SizedBox(width: 18),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product?.name ?? '—',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: AppFonts.w600semiBold,
                        fontFamily: AppFonts.fontFamily,
                        color: AppColors.dark,
                        letterSpacing: -0.41,
                      ),
                    ),

                    const SizedBox(height: 8),

                    if (product?.categoryName != null &&
                        product!.categoryName!.isNotEmpty)
                      Text(
                        product.categoryName!,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: AppFonts.w400regular,
                          fontFamily: AppFonts.fontFamily,
                          color: AppColors.softGray,
                        ),
                      ),

                    const SizedBox(height: 10),

                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.gray2.withOpacity(0.2),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 4,
                          ),
                          child: Row(
                            children: [
                              Assets.icons.star.svg(width: 12, height: 12),
                              const SizedBox(width: 4),
                              const Text(
                                '4.3',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: AppFonts.w600semiBold,
                                  fontFamily: AppFonts.fontFamily,
                                  color: AppColors.dark,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          '45 Ratings',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: AppFonts.w500medium,
                            fontFamily: AppFonts.fontFamily,
                            color: AppColors.orange,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    Row(
                      children: [
                        Text(
                          '\$${product?.price?.toStringAsFixed(2) ?? '0.00'}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: AppFonts.w700bold,
                            fontFamily: AppFonts.fontFamily,
                            color: AppColors.dark,
                          ),
                        ),
                        const SizedBox(width: 7),
                        Text(
                          '\$${product?.priceWithDiscount?.toStringAsFixed(2) ?? '0.00'}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: AppFonts.w400regular,
                            fontFamily: AppFonts.fontFamily,
                            color: AppColors.softGray,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: AppColors.softGray,
                            decorationThickness: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
