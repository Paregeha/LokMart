import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_button_profile_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../gen/assets.gen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final LinearGradient gradient = LinearGradient(
    colors: [AppColors.gradientOne, AppColors.gradientTwo],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F6FB),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 303.0,
                width: double.infinity,
                decoration: BoxDecoration(gradient: gradient),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.white, width: 1.0),
                      ),
                      child: Container(
                        height: 106.0,
                        width: 106.0,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        clipBehavior: Clip.antiAlias,
                        child: Assets.images.man.image(fit: BoxFit.cover),
                      ),
                    ),
                    Text('Brayden Anderson'),
                    Text('braydenander@gmail.com'),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 250.0,
            left: 32.0,
            right: 32.0,
            bottom: 0.0,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          CustomButtonProfileWidget(
                            icon: SvgPicture.asset(
                              Assets.icons.profile,
                              colorFilter: ColorFilter.mode(
                                AppColors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                            label: 'Account info',
                          ),
                          SizedBox(height: 24.0),
                          CustomButtonProfileWidget(
                            icon: SvgPicture.asset(
                              Assets.icons.order,
                              colorFilter: ColorFilter.mode(
                                AppColors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                            label: 'My order',
                          ),
                          SizedBox(height: 24.0),
                          CustomButtonProfileWidget(
                            icon: SvgPicture.asset(
                              Assets.icons.payment,
                              colorFilter: ColorFilter.mode(
                                AppColors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                            label: 'Payment Method',
                          ),
                          SizedBox(height: 24.0),
                          CustomButtonProfileWidget(
                            icon: SvgPicture.asset(
                              Assets.icons.location,
                              colorFilter: ColorFilter.mode(
                                AppColors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                            label: 'Delivery Address',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 18.0),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            CustomButtonProfileWidget(
                              icon: SvgPicture.asset(
                                Assets.icons.setting,
                                colorFilter: ColorFilter.mode(
                                  AppColors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                              label: 'Setting',
                            ),
                            SizedBox(height: 24.0),
                            CustomButtonProfileWidget(
                              icon: SvgPicture.asset(
                                Assets.icons.helper,
                                colorFilter: ColorFilter.mode(
                                  AppColors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                              label: 'Help Center',
                            ),
                            SizedBox(height: 24.0),
                            CustomButtonProfileWidget(
                              icon: SvgPicture.asset(
                                Assets.icons.mail,
                                colorFilter: ColorFilter.mode(
                                  AppColors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                              label: 'Contact Us',
                            ),
                            SizedBox(height: 24.0),
                            CustomButtonProfileWidget(
                              icon: SvgPicture.asset(
                                Assets.icons.share,
                                colorFilter: ColorFilter.mode(
                                  AppColors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                              label: 'Share App',
                            ),
                            SizedBox(height: 24.0),
                            CustomButtonProfileWidget(
                              icon: SvgPicture.asset(
                                Assets.icons.starProfile,
                                colorFilter: ColorFilter.mode(
                                  AppColors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                              label: 'Rate App',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 18.0),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            CustomButtonProfileWidget(
                              isLogout: true,
                              icon: SvgPicture.asset(
                                Assets.icons.logout,
                                colorFilter: ColorFilter.mode(
                                  AppColors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                              label: 'Logout',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
