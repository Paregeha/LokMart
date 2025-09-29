import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/gen/assets.gen.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class CustomButtonsWidget extends StatelessWidget {
  const CustomButtonsWidget({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.enable = false,
  });

  final String label;
  final IconData? icon;
  final VoidCallback? onPressed;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12.0),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.gradientOne, AppColors.gradientTwo],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: onPressed,
          child: SizedBox(
            height: 60.0,
            width: double.infinity,
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (enable) ...[
                    SvgPicture.asset(Assets.icons.buy, width: 18, height: 18),
                    SizedBox(width: 12.19),
                  ],
                  Text(
                    label,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 16.0,
                      letterSpacing: 0,
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
