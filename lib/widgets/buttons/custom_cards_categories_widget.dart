import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';

import '../../gen/assets.gen.dart';
import '../../resources/app_fonts.dart';

class CustomCardsCategoriesWidget extends StatelessWidget {
  const CustomCardsCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Ink(
          height: 120.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14.0),
            border: Border.all(color: AppColors.grey1, width: 1.0),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(14.0),
            onTap: () {},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Assets.images.icLemon.image(width: 80.0, height: 80.0),
                SizedBox(width: 17.0),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fruits',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: AppFonts.fontFamily,
                          fontWeight: AppFonts.w600semiBold,
                        ),
                      ),
                      Text('1126 items', overflow: TextOverflow.ellipsis),
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
