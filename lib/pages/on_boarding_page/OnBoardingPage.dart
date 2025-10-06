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
    return LayoutBuilder(
      builder: (context, constraints) {
        final widthLayout = constraints.maxWidth;
        final heightLayout = constraints.maxHeight;
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
                          _OnBoardingList(
                            heightLayout: heightLayout,
                            label: 'Welcome to LokMart! Grocery Applications',
                            text:
                                'Lorem ipsum dolor sit amet, consectetur adipiscing'
                                ' elit, sed do eiusmod tempor incididunt '
                                'ut labore',
                            photo: Assets.images.onBoardingOne.image(
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          _OnBoardingList(
                            heightLayout: heightLayout,
                            label: '24/7 Support',

                            text:
                                'Our team is always here for you — day or night.'
                                ' Get help whenever you need it.',
                            photo: Assets.images.onBoardingTwo.image(
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),

                          _OnBoardingList(
                            heightLayout: heightLayout,
                            label: 'Deals & Rewards',

                            text:
                                'Enjoy exclusive discounts, special offers, '
                                'and rewarding bonuses every time you shop.',
                            photo: Assets.images.onBoardingThree.image(
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),

                          _OnBoardingList(
                            heightLayout: heightLayout,
                            label: 'Best Quality and Fast Delivery!',

                            text:
                                'Lorem ipsum dolor sit amet, consectetur adipiscing '
                                'elit, sed do eiusmod tempor incididunt ut labore',
                            photo: Assets.images.onBoardingFour.image(
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
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
      },
    );
  }
}

class _OnBoardingList extends StatelessWidget {
  const _OnBoardingList({
    super.key,
    this.heightLayout,
    required this.label,
    required this.text,
    required this.photo,
  });

  final heightLayout;
  final String label;
  final String text;
  final Widget photo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 46.0,
            right: 46.0,
            top: heightLayout * 0.07,
          ),
          child: photo,
        ),
        SizedBox(height: heightLayout * 0.13),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Text(
            label,
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
        SizedBox(height: heightLayout * 0.05),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64.0),
          child: Text(
            text,
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
        SizedBox(height: heightLayout * 0.05),
      ],
    );
  }
}
