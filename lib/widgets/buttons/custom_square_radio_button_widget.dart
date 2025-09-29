import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomRadioButtonWidget extends StatelessWidget {
  const CustomRadioButtonWidget({
    super.key,
    this.isSelected = true,
    this.onPressed,
  });

  final bool isSelected;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final LinearGradient? gradient;
    if (isSelected) {
      gradient = LinearGradient(
        colors: [AppColors.gradientOne, AppColors.gradientTwo],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      );
    } else {
      gradient = null;
    }

    return Material(
      type: MaterialType.transparency,
      child: Ink(
        width: 20.0,
        height: 20.0,
        decoration: BoxDecoration(
          color: isSelected ? null : Colors.transparent,
          gradient: gradient,
          borderRadius: BorderRadius.circular(3.0),
          border:
              isSelected
                  ? null
                  : Border.all(color: AppColors.softColor, width: 2.0),
        ),
        child: InkWell(
          onTap: onPressed,
          child: Center(
            child:
                isSelected
                    ? Icon(Icons.check_rounded, size: 20.0, color: Colors.white)
                    : null,
          ),
        ),
      ),
    );
  }
}
