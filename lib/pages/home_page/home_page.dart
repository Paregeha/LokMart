import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_architecture/gen/assets.gen.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_filter_widget.dart';
import 'package:flutter_base_architecture/widgets/navigations/custom_bottom_bar_widget.dart';
import 'package:flutter_base_architecture/widgets/text_fields/custom_text_field_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../resources/app_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PageController _bannerCtrl;

  int indexBottomBar = 0;
  int indexAdvertising = 0;

  final List<Widget> _banners = [
    Assets.images.mainBanner.image(),
    Assets.images.mainBanner.image(),
    Assets.images.mainBanner.image(),
  ];

  @override
  void initState() {
    super.initState();
    final start = _banners.length * 1000 + 1;
    _bannerCtrl = PageController(viewportFraction: 0.7, initialPage: start);
  }

  @override
  void dispose() {
    _bannerCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final widthLayout = constraints.maxWidth;
        final heightLayout = constraints.maxHeight;

        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          child: Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppBar(
              backgroundColor: AppColors.white,
              // elevation: 0,
              centerTitle: false,
              toolbarHeight: heightLayout * 0.08,
              titleSpacing: 30.0,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'Hello, Brayden',
                    style: TextStyle(
                      fontFamily: AppFonts.fontFamily,
                      fontWeight: AppFonts.w700bold,
                      fontSize: 22.0,
                      height: 1.0,
                      letterSpacing: -0.3,
                      color: AppColors.dark,
                    ),
                  ),
                  Text(
                    'Good morning.',
                    style: TextStyle(
                      fontFamily: AppFonts.fontFamily,
                      fontWeight: AppFonts.w400regular,
                      fontSize: 14.0,
                      height: 1.0,
                      letterSpacing: -0.3,
                      color: AppColors.softGray,
                    ),
                  ),
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(9999.0),
                    onTap: () {},
                    child: Stack(
                      children: [
                        Container(
                          width: 30.0,
                          height: 30.0,
                          child: Center(
                            child: SvgPicture.asset(
                              Assets.icons.icNotification,
                              width: 24.0,
                              height: 24.0,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 3.0,
                          child: Container(
                            width: 13.0,
                            height: 13.0,
                            decoration: BoxDecoration(
                              color: AppColors.orange,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '5',
                                style: TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: AppFonts.w500medium,
                                  fontFamily: AppFonts.fontFamily,
                                  height: 1.0,
                                  letterSpacing: 0.0,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Container(
                    width: 43.0,
                    height: 43.0,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    clipBehavior: Clip.antiAlias,
                    child: Assets.images.man.image(fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: heightLayout * 0.02, child: Placeholder()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomTextFieldWidget(
                              color: AppColors.white,
                              hintText: 'Search...',
                              prefix: Padding(
                                padding: const EdgeInsets.only(
                                  left: 25.0,
                                  top: 18.0,
                                  bottom: 18.0,
                                  right: 16.0,
                                ),
                                child: SvgPicture.asset(
                                  Assets.icons.icSearch,
                                  width: 24.0,
                                  height: 24.0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 18.0),
                          CustomFilterWidget(onPressed: () {}),
                        ],
                      ),
                    ),
                    SizedBox(height: heightLayout * 0.02, child: Placeholder()),
                    AspectRatio(
                      aspectRatio: 18 / 7,
                      child: PageView.builder(
                        controller: _bannerCtrl,
                        onPageChanged:
                            (i) => setState(
                              () => indexAdvertising = i % _banners.length,
                            ),
                        itemBuilder: (context, i) {
                          return AnimatedBuilder(
                            animation: _bannerCtrl,
                            builder: (context, child) {
                              final double currentPage =
                                  _bannerCtrl.hasClients
                                      ? (_bannerCtrl.page ??
                                          _bannerCtrl.initialPage.toDouble())
                                      : _bannerCtrl.initialPage.toDouble();

                              final double distanceFromCurrent =
                                  (i - currentPage).abs();

                              final double proximity = (1 - distanceFromCurrent)
                                  .clamp(0.0, 1.0);

                              const double minScale = 0.80;
                              const double maxScale = 1.00;
                              final double scaleFactor =
                                  minScale + (maxScale - minScale) * proximity;

                              return Transform.scale(
                                scale: scaleFactor,
                                alignment: Alignment.center,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(28),
                                  child: _banners[i % _banners.length],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    AnimatedSmoothIndicator(
                      activeIndex: indexAdvertising,
                      count: _banners.length,
                      effect: ExpandingDotsEffect(
                        dotWidth: 14,
                        dotHeight: 4,
                        expansionFactor: 2,
                        spacing: 5,
                        dotColor: AppColors.gray,
                        activeDotColor:
                            Color.lerp(
                              AppColors.gradientOne,
                              AppColors.gradientTwo,
                              0.5,
                            )!,
                      ),
                    ),

                    SizedBox(height: heightLayout * 0.04, child: Placeholder()),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Categories',
                            style: TextStyle(
                              color: AppColors.dark,
                              fontFamily: AppFonts.fontFamily,
                              fontWeight: AppFonts.w700bold,
                              fontSize: 22.0,
                              letterSpacing: -0.08,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Text(
                                  'Show all',
                                  style: TextStyle(
                                    color: AppColors.orange,
                                    fontFamily: AppFonts.fontFamily,
                                    fontWeight: AppFonts.w600semiBold,
                                    fontSize: 16.0,
                                    letterSpacing: -0.15,
                                  ),
                                ),
                                SizedBox(width: 6.0),
                                SvgPicture.asset(Assets.icons.icRightArrow),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 140, // під себе
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        separatorBuilder:
                            (_, __) => const SizedBox(width: 15.0),
                        itemCount: 5,
                        itemBuilder: (_, i) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 88,
                                height: 88,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(color: AppColors.gray1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Assets.images.icLemon.image(),
                                ),
                              ),
                              const SizedBox(height: 6),
                              const Text(
                                'Fruits',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: AppFonts.w600semiBold,
                                  fontFamily: AppFonts.fontFamily,
                                  letterSpacing: -0.41,
                                  color: AppColors.dark,
                                ),
                              ),
                              const Text(
                                '1126 Items',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: AppFonts.w400regular,
                                  fontFamily: AppFonts.fontFamily,
                                  letterSpacing: -0.08,
                                  color: AppColors.softGray,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(height: heightLayout * 0.01, child: Placeholder()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Popular Deals',
                            style: TextStyle(
                              color: AppColors.dark,
                              fontFamily: AppFonts.fontFamily,
                              fontWeight: AppFonts.w700bold,
                              fontSize: 22.0,
                              letterSpacing: -0.08,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Text(
                                  'Show all',
                                  style: TextStyle(
                                    color: AppColors.orange,
                                    fontFamily: AppFonts.fontFamily,
                                    fontWeight: AppFonts.w600semiBold,
                                    fontSize: 16.0,
                                    letterSpacing: -0.15,
                                  ),
                                ),
                                SizedBox(width: 6.0),
                                SvgPicture.asset(Assets.icons.icRightArrow),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 350,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        separatorBuilder: (_, _) => const SizedBox(width: 15.0),
                        itemCount: 5,
                        itemBuilder: (_, i) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Assets.images.banana.image(fit: BoxFit.fill),
                              const Text(
                                'Banana',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: AppFonts.w600semiBold,
                                  fontFamily: AppFonts.fontFamily,
                                  letterSpacing: -0.41,
                                  color: AppColors.dark,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColors.softGray
                                                .withValues(alpha: 0.2),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            11.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 7.0,
                                            vertical: 5.0,
                                          ),
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                Assets.icons.star,
                                              ),
                                              SizedBox(width: 4.0),
                                              Text(
                                                '4.5',
                                                style: TextStyle(
                                                  fontFamily:
                                                      AppFonts.fontFamily,
                                                  fontWeight:
                                                      AppFonts.w600semiBold,
                                                  fontSize: 10.0,
                                                  letterSpacing: -0.08,
                                                  color: AppColors.dark,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 7.0),
                                      Text(
                                        '97 Ratings',
                                        style: TextStyle(
                                          fontFamily: AppFonts.fontFamily,
                                          fontWeight: AppFonts.w500medium,
                                          fontSize: 12.0,
                                          letterSpacing: -0.08,
                                          color: AppColors.orange,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 100),
                                  Text(
                                    '\$15.00',
                                    style: TextStyle(
                                      fontFamily: AppFonts.fontFamily,
                                      fontWeight: AppFonts.w600semiBold,
                                      fontSize: 16.0,
                                      letterSpacing: -0.08,
                                      color: AppColors.dark,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
