import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';

class CustomCircleSecondRadioButtonWidget extends StatelessWidget {
  const CustomCircleSecondRadioButtonWidget({
    super.key,
    this.isSelected = true,
  });

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
          child: Center(
            child:
                isSelected
                    ? Center(
                      child: Icon(
                        Icons.check_rounded,
                        size: 20.0,
                        color: Colors.white,
                      ),
                    )
                    : null,
          ),
        ),
      ),
    );
  }
}
