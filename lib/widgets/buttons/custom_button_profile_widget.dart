import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../gen/assets.gen.dart';

class CustomButtonProfileWidget extends StatelessWidget {
  const CustomButtonProfileWidget({
    super.key,
    required this.icon,
    required this.label,
    this.isLogout = false,
  });

  final Widget icon;
  final String label;
  final bool isLogout;

  @override
  Widget build(BuildContext context) {
    final gradient = LinearGradient(
      colors: [AppColors.gradientOne, AppColors.gradientTwo],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    return Material(
      child: Ink(
        width: double.infinity,
        height: 41.0,
        decoration: BoxDecoration(color: Colors.white),
        child: InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Ink(
                    width: 41.0,
                    height: 41.0,
                    decoration: BoxDecoration(
                      gradient: gradient,
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        Assets.icons.user,
                        width: 24.0,
                        height: 24.0,
                        colorFilter: ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Text(label),
                ],
              ),

              if (!isLogout) SvgPicture.asset(Assets.icons.icArrowNext),
            ],
          ),
        ),
      ),
    );
  }
}
