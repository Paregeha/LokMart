import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_base_architecture/resources/app_fonts.dart';

import '../../gen/assets.gen.dart';

class CustomCreditCardWidget extends StatelessWidget {
  const CustomCreditCardWidget({super.key});

  String formatCardNumber(String cardNumber) {
    final cleanNumber = cardNumber.replaceAll(RegExp(r'\D'), '');

    final masked = cleanNumber.replaceRange(
      0,
      cleanNumber.length - 4,
      '*' * (cleanNumber.length - 4),
    );

    final formatted =
        masked
            .replaceAllMapped(
              RegExp(r'.{1,4}'),
              (match) => '${match.group(0)} ',
            )
            .trim();

    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    final LinearGradient gradient = LinearGradient(
      colors: [AppColors.cardOneGradientOne, AppColors.cardOneGradientTwo],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Container(
          height: 203.0,
          width: 287.0,
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [Assets.images.mastercard.image()]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      formatCardNumber('4242424242428596'),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                        SizedBox(height: 5.0),
                        Text(
                          '08/21',
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'CARD HOLDER',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: AppColors.white,
                            fontWeight: AppFonts.w400regular,
                            fontFamily: AppFonts.fontFamily,
                            height: 1,
                            letterSpacing: 0,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'Brayden Anderson',
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
          ),
        ),
      ),
    );
  }
}
