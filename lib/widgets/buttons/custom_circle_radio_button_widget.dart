import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';

class CustomCircleRadioButtonWidget extends StatelessWidget {
  const CustomCircleRadioButtonWidget({super.key, this.isSelected = true});

  final bool isSelected;

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
        width: 20.0,
        height: 20.0,
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? AppColors.gradientTwo : AppColors.softColor,
            width: 2.0,
          ),
        ),
        child: InkWell(
          child: Center(
            child:
                isSelected
                    ? Container(
                      width: 10.0,
                      height: 10.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: gradient,
                      ),
                    )
                    : null,
          ),
        ),
      ),
    );
  }
}
