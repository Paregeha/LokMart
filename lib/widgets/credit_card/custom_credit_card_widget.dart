import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_base_architecture/resources/app_fonts.dart';

import '../../gen/assets.gen.dart';

class CustomCreditCardWidget extends StatelessWidget {
  const CustomCreditCardWidget({
    super.key,
    required this.brand,
    required this.last4,
    required this.expMonth,
    required this.expYear,
    this.cardHolder = 'CARD HOLDER',
    this.isSelected = false,
    this.isDefault = false,
  });

  final String brand;
  final String last4;
  final int expMonth;
  final int expYear;

  final String cardHolder;

  final bool isSelected;
  final bool isDefault;

  String _formatMasked(String last4) {
    return '**** **** **** $last4';
  }

  String _formatExp(int m, int y) {
    final mm = m.toString().padLeft(2, '0');
    final yy = (y % 100).toString().padLeft(2, '0');
    return '$mm/$yy';
  }

  @override
  Widget build(BuildContext context) {
    final LinearGradient gradient = LinearGradient(
      colors: [AppColors.cardOneGradientOne, AppColors.cardOneGradientTwo],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: isSelected ? AppColors.orange : Colors.transparent,
          width: 2,
        ),
        boxShadow: [
          if (isSelected)
            BoxShadow(
              color: AppColors.orange.withOpacity(0.25),
              blurRadius: 14,
              offset: const Offset(0, 10),
            ),
        ],
      ),
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Assets.images.mastercard.image(height: 24),
              if (isDefault)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.20),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'DEFAULT',
                    style: TextStyle(
                      fontFamily: AppFonts.fontFamily,
                      fontWeight: AppFonts.w600semiBold,
                      fontSize: 12,
                      color: AppColors.white,
                      height: 1,
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(height: 23.0),

          // card number
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _formatMasked(last4),
                style: TextStyle(
                  fontSize: 26.0,
                  color: AppColors.white,
                  fontWeight: AppFonts.w700bold,
                  fontFamily: AppFonts.fontFamily,
                  height: 1,
                  letterSpacing: 0,
                ),
              ),
            ],
          ),

          const SizedBox(height: 33.0),

          // bottom row: exp + brand/holder
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // exp
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'VALID THRU',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: AppColors.white,
                      fontWeight: AppFonts.w400regular,
                      fontFamily: AppFonts.fontFamily,
                      height: 1,
                      letterSpacing: 0,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    _formatExp(expMonth, expYear),
                    style: TextStyle(
                      fontSize: 16.0,
                      color: AppColors.white,
                      fontWeight: AppFonts.w400regular,
                      fontFamily: AppFonts.fontFamily,
                      height: 1,
                      letterSpacing: 0,
                    ),
                  ),
                ],
              ),

              // brand (або holder)
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'BRAND',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: AppColors.white,
                      fontWeight: AppFonts.w400regular,
                      fontFamily: AppFonts.fontFamily,
                      height: 1,
                      letterSpacing: 0,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    brand.toUpperCase(),
                    style: TextStyle(
                      fontSize: 16.0,
                      color: AppColors.white,
                      fontWeight: AppFonts.w500medium,
                      fontFamily: AppFonts.fontFamily,
                      height: 1,
                      letterSpacing: 0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
