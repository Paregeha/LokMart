import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

class AppThemes {
  const AppThemes._();

  static ThemeData light() {
    return ThemeData(
      fontFamily: AppFonts.fontFamily,
      scaffoldBackgroundColor: AppColors.white,
      colorScheme: const ColorScheme.light().copyWith(
        primary: AppColors.dark,
        secondary: AppColors.yellowStar,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.w400),
        headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
        titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        bodyMedium: TextStyle(fontSize: 14, height: 1.4),
        labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
    );
  }
}

// В main
//
// final materialLightTheme = ThemeData.light().copyWith(
//   scaffoldBackgroundColor: AppColors.bgHighContrastLight,
//   extensions: [
//     //GLOBAL
//     const TypographyTheme(color: AppColors.highContrastLight),
//   ] ,
// )
