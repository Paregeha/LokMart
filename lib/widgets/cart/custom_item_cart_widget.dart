import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_base_architecture/resources/app_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../gen/assets.gen.dart';

class CustomItemCartWidget extends StatefulWidget {
  const CustomItemCartWidget({super.key});

  @override
  State<CustomItemCartWidget> createState() => _CustomItemCartWidgetState();
}

class _CustomItemCartWidgetState extends State<CustomItemCartWidget> {
  bool enableHeart = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(14.0),
          onTap: () {},
          child: SizedBox(
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14.0),
                      child: Assets.images.apple.image(
                        width: 112.0,
                        height: 138.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      right: 11.0,
                      top: 11.0,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            enableHeart = !enableHeart;
                          });
                        },
                        child:
                            enableHeart
                                ? SvgPicture.asset(Assets.icons.heartRed)
                                : SvgPicture.asset(Assets.icons.heart),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 22.0),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Orange',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: AppFonts.w600semiBold,
                        fontFamily: AppFonts.fontFamily,
                        letterSpacing: -0.41,
                        color: AppColors.dark,
                      ),
                    ),
                    SizedBox(height: 13.0),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11.0),
                            border: Border.all(
                              color: AppColors.gray2.withValues(alpha: 0.2),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 7,
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  Assets.icons.star,
                                  width: 12.0,
                                  height: 12.0,
                                ),
                                SizedBox(width: 4.0),
                                Text(
                                  '4.3',
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: AppFonts.w600semiBold,
                                    fontFamily: AppFonts.fontFamily,
                                    letterSpacing: -0.08,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          '45 Ratings',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: AppFonts.w500medium,
                            fontFamily: AppFonts.fontFamily,
                            letterSpacing: -0.08,
                            color: AppColors.orange,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 17.0),

                    Row(
                      children: [
                        Text(
                          '\$150.00',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: AppFonts.w600semiBold,
                            fontFamily: AppFonts.fontFamily,
                            letterSpacing: -0.08,
                            color: AppColors.dark,
                          ),
                        ),
                        SizedBox(width: 7.0),
                        Text(
                          '\$200.00',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: AppFonts.w400regular,
                            fontFamily: AppFonts.fontFamily,
                            letterSpacing: -0.08,
                            color: AppColors.softGray,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: AppColors.softGray,
                            decorationThickness: 1.5,
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
