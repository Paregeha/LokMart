import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../features/products/models/products.dart';
import '../../gen/assets.gen.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_fonts.dart';

class CustomDealsCartWidget extends StatelessWidget {
  const CustomDealsCartWidget({
    super.key,
    required this.product,
    required this.onPressed,
  });

  final Products product;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final imageWidget =
        (product.photoUrl != null && product.photoUrl!.isNotEmpty)
            ? Image.network(
              product.photoUrl!,
              fit: BoxFit.cover,
              width: 272.0,
              height: 210.0,
              errorBuilder:
                  (_, _, _) => Assets.images.banana.image(fit: BoxFit.fill),
            )
            : Assets.images.banana.image(fit: BoxFit.fill);

    return InkWell(
      borderRadius: BorderRadius.circular(14.0),
      onTap: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: imageWidget,
          ),
          const SizedBox(height: 8),
          Text(
            product.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: AppFonts.w600semiBold,
              fontFamily: AppFonts.fontFamily,
              letterSpacing: -0.41,
              color: AppColors.dark,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.softGray.withValues(alpha: 0.2),
                        ),
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7.0,
                          vertical: 5.0,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(Assets.icons.star),
                            const SizedBox(width: 4.0),
                            Text(
                              (4 ?? 0).toStringAsFixed(1),
                              style: const TextStyle(
                                fontFamily: AppFonts.fontFamily,
                                fontWeight: AppFonts.w600semiBold,
                                fontSize: 10.0,
                                letterSpacing: -0.08,
                                color: AppColors.dark,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 7.0),
                    Text(
                      '${product.raiting ?? 0} Ratings',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: AppFonts.fontFamily,
                        fontWeight: AppFonts.w500medium,
                        fontSize: 12.0,
                        letterSpacing: -0.08,
                        color: AppColors.orange,
                      ),
                    ),
                  ],
                ),
                Text(
                  '\$${(product.price ?? 0).toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontFamily: AppFonts.fontFamily,
                    fontWeight: AppFonts.w600semiBold,
                    fontSize: 16.0,
                    letterSpacing: -0.08,
                    color: AppColors.dark,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
