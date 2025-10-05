import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_architecture/gen/assets.gen.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_base_architecture/resources/app_fonts.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_button_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../routes/app_routes.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final controller = PageController();
  int _index = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onNext() {
    if (_index < 3) {
      controller.nextPage(
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeOut,
      );
    } else {
      context.go(AppRoutes.signIn);
    }
  }

  final pages = List.generate(
    4,
    (index) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey.shade300,
      ),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: SizedBox(
        height: 280,
        child: Center(
          child: Text('Page $index', style: TextStyle(color: Colors.indigo)),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light, // ANDROID
        statusBarBrightness: Brightness.dark, // iOS
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Assets.images.illustrationBackground.image(
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: controller,
                    onPageChanged: (i) => setState(() => _index = i),
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 46.0,
                              right: 46.0,
                              top: 66.0,
                            ),
                            child: Assets.images.onBoardingOne.image(
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Spacer(flex: 7),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 28.0,
                            ),
                            child: Text(
                              'Welcome to LokMart! Grocery Applications',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: AppFonts.fontFamily,
                                fontWeight: AppFonts.w700bold,
                                fontSize: 22.0,
                                letterSpacing: 0,
                                color: AppColors.dark,
                              ),
                            ),
                          ),
                          Spacer(flex: 1),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 64.0,
                            ),
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing'
                              ' elit, sed do eiusmod tempor incididunt '
                              'ut labore',
                              style: TextStyle(
                                fontFamily: AppFonts.fontFamily,
                                fontWeight: AppFonts.w400regular,
                                fontSize: 14.0,
                                letterSpacing: 0,
                                color: AppColors.dark,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Spacer(flex: 1),
                        ],
                      ),

                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 61.0,
                              right: 61.0,
                              top: 66.0,
                            ),
                            child: Assets.images.onBoardingTwo.image(
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Spacer(flex: 7),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 28.0,
                            ),
                            child: Text(
                              '24/7 Support',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: AppFonts.fontFamily,
                                fontWeight: AppFonts.w700bold,
                                fontSize: 22.0,
                                letterSpacing: 0,
                                color: AppColors.dark,
                              ),
                            ),
                          ),
                          Spacer(flex: 1),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 64.0,
                            ),
                            child: Text(
                              'Our team is always here for you — day or night.'
                              ' Get help whenever you need it.',
                              style: TextStyle(
                                fontFamily: AppFonts.fontFamily,
                                fontWeight: AppFonts.w400regular,
                                fontSize: 14.0,
                                letterSpacing: 0,
                                color: AppColors.dark,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Spacer(flex: 1),
                        ],
                      ),

                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 19.0,
                              right: 19.0,
                              top: 52.0,
                            ),
                            child: Assets.images.onBoardingThree.image(
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Spacer(flex: 7),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 28.0,
                            ),
                            child: Text(
                              'Deals & Rewards',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: AppFonts.fontFamily,
                                fontWeight: AppFonts.w700bold,
                                fontSize: 22.0,
                                letterSpacing: 0,
                                color: AppColors.dark,
                              ),
                            ),
                          ),
                          Spacer(flex: 1),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 64.0,
                            ),
                            child: Text(
                              'Enjoy exclusive discounts, special offers, '
                              'and rewarding bonuses every time you shop.',
                              style: TextStyle(
                                fontFamily: AppFonts.fontFamily,
                                fontWeight: AppFonts.w400regular,
                                fontSize: 14.0,
                                letterSpacing: 0,
                                color: AppColors.dark,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Spacer(flex: 1),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 45.0,
                              right: 45.0,
                              top: 77.0,
                            ),
                            child: Assets.images.onBoardingFour.image(
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Spacer(flex: 7),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 28.0,
                            ),
                            child: Text(
                              'Best Quality and Fast Delivery!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: AppFonts.fontFamily,
                                fontWeight: AppFonts.w700bold,
                                fontSize: 22.0,
                                letterSpacing: 0,
                                color: AppColors.dark,
                              ),
                            ),
                          ),
                          Spacer(flex: 1),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 64.0,
                            ),
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing '
                              'elit, sed do eiusmod tempor incididunt ut labore',
                              style: TextStyle(
                                fontFamily: AppFonts.fontFamily,
                                fontWeight: AppFonts.w400regular,
                                fontSize: 14.0,
                                letterSpacing: 0,
                                color: AppColors.dark,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Spacer(flex: 1),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 27.0),
                SmoothPageIndicator(
                  controller: controller,
                  count: pages.length,
                  effect: ExpandingDotsEffect(
                    dotWidth: 15.0,
                    dotHeight: 8.0,
                    expansionFactor: 1.5,
                    dotColor: AppColors.gray,
                    spacing: 4.0,
                    activeDotColor:
                        Color.lerp(
                          AppColors.gradientOne,
                          AppColors.gradientTwo,
                          0.5,
                        )!,
                  ),
                ),
                SizedBox(height: 41.0),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 32.0,
                    right: 32.0,
                    bottom: 44.0,
                  ),

                  child: CustomButtonsWidget(
                    label: _index < 3 ? 'NEXT' : 'GET STARTED',
                    onPressed: () {
                      _onNext();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
