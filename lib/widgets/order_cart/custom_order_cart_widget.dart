import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../gen/assets.gen.dart';
import '../../resources/app_colors.dart';

class CustomOrderCartWidget extends StatelessWidget {
  const CustomOrderCartWidget({
    super.key,
    this.colorTheme = AppColors.deliveryOrder,
    this.color = AppColors.deliveryOrderIcon,
  });

  final Color color;
  final Color colorTheme;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 49.0,
        height: 49.0,
        decoration: BoxDecoration(
          color: colorTheme,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Center(
          child: Assets.icons.order.svg(
            width: 24.0,
            height: 24.0,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
