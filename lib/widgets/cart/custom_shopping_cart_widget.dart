import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_base_architecture/resources/app_fonts.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_button_count_widget.dart';

import '../../gen/assets.gen.dart';

class CustomShoppingCartWidget extends StatelessWidget {
  /// ✅ Новий конструктор під реальні дані з бекенду
  const CustomShoppingCartWidget({
    super.key,
    required this.itemId,
    required this.title,
    required this.category,
    required this.price,
    required this.count,
    required this.onInc,
    required this.onDec,
    this.imageUrl,
    this.oldPrice,
  });

  final int itemId;

  final String title;
  final String category;

  /// current price
  final double price;

  /// old/striked price (optional)
  final double? oldPrice;

  final String? imageUrl;

  final int count;
  final VoidCallback onInc;
  final VoidCallback onDec;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14.0),
          border: Border.all(color: AppColors.gray1, width: 1.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14.0),
                child: _buildImage(),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: AppColors.dark,
                        fontFamily: AppFonts.fontFamily,
                        fontWeight: AppFonts.w600semiBold,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      category,
                      style: TextStyle(
                        color: AppColors.softGray,
                        fontFamily: AppFonts.fontFamily,
                        fontWeight: AppFonts.w500medium,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '\$ ${price.toStringAsFixed(2)}',
                              style: TextStyle(
                                color: AppColors.dark,
                                fontFamily: AppFonts.fontFamily,
                                fontWeight: AppFonts.w600semiBold,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                              ),
                            ),
                            if (oldPrice != null) ...[
                              const SizedBox(width: 3.0),
                              Text(
                                '\$ ${oldPrice!.toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: AppColors.softGray,
                                  fontFamily: AppFonts.fontFamily,
                                  fontWeight: AppFonts.w400regular,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: AppColors.softGray,
                                  decorationThickness: 1.5,
                                ),
                              ),
                            ],
                          ],
                        ),
                        CustomButtonCountWidget(
                          heightCount: 30.0,
                          widthCount: 87.0,
                          paddingCount: 10.0,
                          value: count, // ✅ controlled
                          onInc: onInc,
                          onDec: onDec,
                          min: 1,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return Assets.images.banana.image(
        width: 57.0,
        height: 57.0,
        fit: BoxFit.fill,
      );
    }

    return Image.network(
      imageUrl!,
      width: 57.0,
      height: 57.0,
      fit: BoxFit.cover,
      errorBuilder:
          (_, __, ___) => Assets.images.banana.image(
            width: 57.0,
            height: 57.0,
            fit: BoxFit.fill,
          ),
    );
  }
}
