import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';

class CustomCircleCheckBoxWidget extends StatelessWidget {
  const CustomCircleCheckBoxWidget({
    super.key,
    this.isSelected = true,
    this.onPressed,
  });

  final bool isSelected;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final LinearGradient gradient = LinearGradient(
      colors: [AppColors.gradientOne, AppColors.gradientTwo],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    return Material(
      color: Colors.transparent,
      child: Ink(
        width: 26.0,
        height: 26.0,
        decoration: BoxDecoration(
          gradient: isSelected ? gradient : null,
          color: isSelected ? null : Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? Colors.transparent : AppColors.softGray,
            width: 2.0,
          ),
        ),
        child: InkWell(
          onTap: onPressed,
          customBorder: const CircleBorder(),
          child: Center(
            child:
                isSelected
                    ? const Icon(
                      Icons.check_rounded,
                      size: 20.0,
                      color: Colors.white,
                    )
                    : null,
          ),
        ),
      ),
    );
  }
}
