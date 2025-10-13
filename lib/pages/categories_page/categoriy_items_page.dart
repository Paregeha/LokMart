import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/gen/assets.gen.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_base_architecture/widgets/cart/custom_item_cart_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/buttons/custom_filter_widget.dart';
import '../../widgets/text_fields/custom_text_field_widget.dart';

class CategoryItemsPage extends StatefulWidget {
  const CategoryItemsPage({super.key});

  @override
  State<CategoryItemsPage> createState() => _CategoryItemsPageState();
}

class _CategoryItemsPageState extends State<CategoryItemsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: SvgPicture.asset(
                Assets.icons.icBack,
                width: 24.0,
                height: 24.0,
              ),
            ),
          ),
        ),
        leadingWidth: 68.0,
        titleSpacing: 16.0,
        title: Text('Fruits'),
        centerTitle: false,
      ),
      body: Column(
        children: [
          SizedBox(height: 10.0),
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
          SizedBox(height: 30.0),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomItemCartWidget(),
                  CustomItemCartWidget(),
                  CustomItemCartWidget(),
                  CustomItemCartWidget(),
                  CustomItemCartWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
