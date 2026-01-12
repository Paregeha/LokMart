import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';

class CustomCheckBoxWidget extends StatelessWidget {
  const CustomCheckBoxWidget({
    super.key,
    this.isSelected = true,
    this.onPressed,
  });

  final bool isSelected;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final LinearGradient? gradient =
        isSelected
            ? const LinearGradient(
              colors: [AppColors.gradientOne, AppColors.gradientTwo],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            )
            : null;

    return Material(
      color: Colors.transparent,
      child: Ink(
        width: 24.0,
        height: 24.0,
        decoration: BoxDecoration(
          gradient: gradient,
          color: isSelected ? null : Colors.transparent,
          borderRadius: BorderRadius.circular(4.0),
          border:
              isSelected
                  ? null
                  : Border.all(color: AppColors.softGray, width: 2.0),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(4.0),
          onTap: onPressed,
          child: Center(
            child:
                isSelected
                    ? const Icon(
                      Icons.check_rounded,
                      size: 18.0,
                      color: Colors.white,
                    )
                    : null,
          ),
        ),
      ),
    );
  }
}
