import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';

class CustomCircleRadioButtonWidget extends StatelessWidget {
  const CustomCircleRadioButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final LinearGradient? gradient = LinearGradient(
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
          border: Border.all(color: AppColors.gradientTwo, width: 2.0),
        ),
        child: InkWell(
          child: Center(
            child: Container(
              width: 10.0,
              height: 10.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: gradient,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
