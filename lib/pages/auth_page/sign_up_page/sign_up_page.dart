import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_base_architecture/resources/app_fonts.dart';
import 'package:flutter_base_architecture/routes/app_routes.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_button_widget.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_square_check_box_widget.dart';
import 'package:flutter_base_architecture/widgets/text_fields/custom_text_field_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../gen/assets.gen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
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
            Positioned(
              left: 0,
              right: 0,
              top: -55,
              child: Assets.images.headerBackground.image(
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                Spacer(),
                Assets.images.logo.image(width: double.infinity),
                Spacer(flex: 24),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(flex: 8),
                    Text(
                      'Create your account',
                      style: TextStyle(
                        color: AppColors.dark,
                        fontFamily: AppFonts.fontFamily,
                        fontWeight: AppFonts.w700bold,
                        fontSize: 24.0,
                        height: 1,
                      ),
                    ),
                    Spacer(flex: 1),
                    CustomTextFieldWidget(
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
                          Assets.icons.email,
                          width: 24.0,
                          height: 24.0,
                        ),
                      ),
                      hintText: 'Enter your email',
                    ),
                    Spacer(flex: 1),
                    CustomTextFieldWidget(
                      hintText: 'Enter your password',
                      prefix: Padding(
                        padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
                        child: SvgPicture.asset(
                          Assets.icons.lock,
                          width: 24.0,
                          height: 24.0,
                        ),
                      ),
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
                    CustomButtonsWidget(label: 'SIGN UP', onPressed: () {}),
                    Spacer(flex: 1),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomCheckBoxWidget(
                          isSelected: isSelected,
                          onPressed: () {
                            setState(() {
                              isSelected = !isSelected;
                            });
                          },
                        ),
                        SizedBox(width: 14.0),
                        Expanded(
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                'By tapping “Sign Up” you accept our ',
                                style: TextStyle(
                                  fontFamily: AppFonts.fontFamily,
                                  fontWeight: AppFonts.w500medium,
                                  fontSize: 16.0,
                                  color: AppColors.softGray,
                                  letterSpacing: 0,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  /* open Terms */
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text(
                                  'terms',
                                  style: TextStyle(
                                    fontFamily: AppFonts.fontFamily,
                                    fontWeight: AppFonts.w600semiBold,
                                    fontSize: 16.0,
                                    color: AppColors.orange,
                                    letterSpacing: 0,
                                  ),
                                ),
                              ),
                              Text(
                                ' and ',
                                style: TextStyle(
                                  fontFamily: AppFonts.fontFamily,
                                  fontWeight: AppFonts.w500medium,
                                  fontSize: 16.0,
                                  color: AppColors.softGray,
                                  letterSpacing: 0,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  /* open Condition */
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text(
                                  'condition',
                                  style: TextStyle(
                                    fontFamily: AppFonts.fontFamily,
                                    fontWeight: AppFonts.w600semiBold,
                                    fontSize: 16.0,
                                    color: AppColors.orange,
                                    letterSpacing: 0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Spacer(flex: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have account? ',
                          style: TextStyle(
                            fontFamily: AppFonts.fontFamily,
                            fontWeight: AppFonts.w400regular,
                            fontSize: 16.0,
                            color: AppColors.softGray,
                            letterSpacing: 0,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.go(AppRoutes.signIn);
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              fontFamily: AppFonts.fontFamily,
                              fontWeight: AppFonts.w600semiBold,
                              fontSize: 16.0,
                              color: AppColors.orange,
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(flex: 1),
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
