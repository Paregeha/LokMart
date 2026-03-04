import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../gen/assets.gen.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_fonts.dart';

class AccountInfoPage extends StatelessWidget {
  const AccountInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final gradient = LinearGradient(
      colors: [AppColors.gradientOne, AppColors.gradientTwo],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FB),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 60, bottom: 30),
            decoration: BoxDecoration(gradient: gradient),
            child: SafeArea(
              bottom: false,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: SvgPicture.asset(
                      Assets.icons.icBack.path,
                      width: 24,
                      height: 24,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  const Text(
                    'Account Info',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: AppFonts.w700bold,
                      fontFamily: AppFonts.fontFamily,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Expanded(
            child: Center(
              child: Text(
                'Account information content here',
                style: TextStyle(fontSize: 16, color: AppColors.softGray),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
