import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_base_architecture/resources/app_fonts.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_button_count_widget.dart';

import '../../gen/assets.gen.dart';

class CustomShoppingCartWidget extends StatelessWidget {
  const CustomShoppingCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14.0),
            border: Border.all(color: AppColors.grey1, width: 1.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14.0),
                  child: Assets.images.banana.image(
                    width: 57.0,
                    height: 57.0,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Organic Banana',
                        style: TextStyle(
                          color: AppColors.dark,
                          fontFamily: AppFonts.fontFamily,
                          fontWeight: AppFonts.w600semiBold,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        'Fruit',
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
                                '\$ 4.0',
                                style: TextStyle(
                                  color: AppColors.dark,
                                  fontFamily: AppFonts.fontFamily,
                                  fontWeight: AppFonts.w600semiBold,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                              ),
                              SizedBox(width: 3.0),
                              Text(
                                '\$ 8.0',
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
                          ),
                          CustomButtonCountWidget(
                            heightCount: 30.0,
                            widthCount: 87,
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
      ),
    );
  }
}
