import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_base_architecture/resources/app_fonts.dart';
import 'package:flutter_base_architecture/routes/app_routes.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_button_widget.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_square_check_box_widget.dart';
import 'package:flutter_base_architecture/widgets/text_fields/custom_text_field_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../gen/assets.gen.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = false;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
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
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(flex: 10),
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
                      hintStyle: TextStyle(
                        color: AppColors.softGray,
                        fontSize: 16.0,
                        height: 1,
                        fontWeight: AppFonts.w500medium,
                        fontFamily: AppFonts.fontFamily,
                        letterSpacing: 0,
                      ),
                      prefix: Padding(
                        padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
                        child: SvgPicture.asset(
                          Assets.icons.user,
                          width: 24.0,
                          height: 24.0,
                        ),
                      ),
                      hintText: 'Enter your login',
                    ),
                    Spacer(flex: 1),
                    CustomTextFieldWidget(
                      prefix: Padding(
                        padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
                        child: SvgPicture.asset(
                          Assets.icons.lock,
                          width: 24.0,
                          height: 24.0,
                        ),
                      ),
                      hintText: 'Enter your password',
                      isPassword: true,
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
                            CustomCheckBoxWidget(
                              isSelected: isSelected,
                              onPressed: () {
                                setState(() {
                                  isSelected = !isSelected;
                                });
                              },
                            ),
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
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
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
                          'Don’t have an account? ',
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
                          onPressed: () {
                            context.go(AppRoutes.signUp);
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
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
