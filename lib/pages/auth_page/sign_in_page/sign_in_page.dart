import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_base_architecture/resources/app_fonts.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_button_widget.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_square_check_box_widget.dart';
import 'package:flutter_base_architecture/widgets/text_fields/custom_text_field_widget.dart';
import 'package:flutter_svg/svg.dart';

import '../../../gen/assets.gen.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light, // ANDROID
        statusBarBrightness: Brightness.dark, // iOS
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Stack(
          children: [
            Assets.images.headerBackground.image(fit: BoxFit.cover),
            Column(
              children: [
                Spacer(),
                Center(child: Assets.images.logo.image()),
                Spacer(flex: 7),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(flex: 12),
                    Text(
                      'Welcome back',
                      style: TextStyle(
                        color: AppColors.dark,
                        fontSize: 24.0,
                        fontWeight: AppFonts.w700bold,
                        fontFamily: AppFonts.fontFamily,
                        height: 1,
                        letterSpacing: 0,
                      ),
                    ),
                    Spacer(flex: 1),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: AppFonts.w400regular,
                        fontFamily: AppFonts.fontFamily,
                        color: AppColors.softGray,
                        height: 1,
                        letterSpacing: 0,
                      ),
                    ),
                    Spacer(flex: 1),
                    CustomTextFieldWidget(
                      prefix: SvgPicture.asset(Assets.icons.user),
                      hintText: 'Enter your login',
                    ),
                    Spacer(flex: 1),
                    CustomTextFieldWidget(
                      prefix: SvgPicture.asset(Assets.icons.lock),
                      hintText: 'Enter your password',
                      suffix: Padding(
                        padding: const EdgeInsets.only(
                          right: 23.0,
                          top: 18.0,
                          bottom: 18.0,
                        ),
                        child: SvgPicture.asset(
                          Assets.icons.eyeTrue,
                          width: 24.0,
                          height: 24.0,
                        ),
                      ),
                    ),
                    Spacer(flex: 1),
                    CustomButtonsWidget(label: 'SIGN IN'),
                    Spacer(flex: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomCheckBoxWidget(),
                            SizedBox(width: 4.0),
                            Text(
                              'Keep Sign In',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: AppFonts.w600semiBold,
                                fontFamily: AppFonts.fontFamily,
                                color: AppColors.dark,
                                letterSpacing: 0,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: AppFonts.w600semiBold,
                              fontFamily: AppFonts.fontFamily,
                              color: AppColors.orange,
                              letterSpacing: 0,
                              decoration: TextDecoration.underline,
                              decorationThickness: 1.5,
                              decorationColor: AppColors.orange,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(flex: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account?',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: AppFonts.w400regular,
                            fontFamily: AppFonts.fontFamily,
                            color: AppColors.softGray,
                            height: 1,
                            letterSpacing: 0,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: AppFonts.w600semiBold,
                              fontFamily: AppFonts.fontFamily,
                              color: AppColors.orange,
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
