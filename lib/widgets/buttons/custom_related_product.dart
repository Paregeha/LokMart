import 'package:flutter/cupertino.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_base_architecture/resources/app_fonts.dart';

import '../../gen/assets.gen.dart';

class CustomRelatedProduct extends StatelessWidget {
  const CustomRelatedProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Assets.images.orange.image(),
        Text(
          'Fresh Lemon',
          style: TextStyle(
            fontWeight: AppFonts.w600semiBold,
            fontFamily: AppFonts.fontFamily,
            fontSize: 16.0,
            letterSpacing: -0.41,
            color: AppColors.dark,
          ),
        ),
        Row(
          children: [
            Text(
              '\$75.00',
              style: TextStyle(
                color: AppColors.dark,
                fontSize: 12.0,
                fontFamily: AppFonts.fontFamily,
                fontWeight: AppFonts.w600semiBold,
                letterSpacing: -0.08,
              ),
            ),
            SizedBox(width: 5.0),
            Text(
              '\$150.00',
              style: TextStyle(
                fontWeight: AppFonts.w400regular,
                fontSize: 10.0,
                letterSpacing: -0.08,
                fontFamily: AppFonts.fontFamily,
                decoration: TextDecoration.lineThrough,
                color: AppColors.softGray,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
