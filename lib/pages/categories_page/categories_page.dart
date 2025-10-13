import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_base_architecture/routes/app_routes.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_cards_categories_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../gen/assets.gen.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        title: Text('Categories'),
        leadingWidth: 68.0,
        titleSpacing: 16.0,
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 28.0),
          child: IconButton(
            onPressed: () => context.pop(),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 24.0, minHeight: 24.0),
            icon: SvgPicture.asset(
              Assets.icons.icBack,
              width: 24.0,
              height: 24.0,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 19.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: CustomCardsCategoriesWidget(
                onPressed: () {
                  context.push(AppRoutes.categoryItems);
                },
              ),
            ),
            SizedBox(height: 14.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: CustomCardsCategoriesWidget(),
            ),
            SizedBox(height: 14.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: CustomCardsCategoriesWidget(),
            ),
            SizedBox(height: 14.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: CustomCardsCategoriesWidget(),
            ),
            SizedBox(height: 14.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: CustomCardsCategoriesWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
