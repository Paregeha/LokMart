import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../gen/assets.gen.dart';
import '../../resources/app_colors.dart';

class CustomOrderCartWidget extends StatelessWidget {
  const CustomOrderCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 49.0,
        height: 49.0,
        decoration: BoxDecoration(
          color: AppColors.deliveryOrder,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Center(
          child: SvgPicture.asset(
            Assets.icons.order,
            width: 24.0,
            height: 24.0,
            colorFilter: ColorFilter.mode(
              AppColors.deliveryOrderIcon,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
