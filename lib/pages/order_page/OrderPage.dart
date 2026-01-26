import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_drop_down_order_widget.dart';

import '../../gen/assets.gen.dart';
import '../../resources/app_colors.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        titleSpacing: 32.0,
        actionsPadding: EdgeInsets.only(right: 32.0),
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: Assets.icons.icSearch.svg(
              width: 24.0,
              height: 24.0,
              colorFilter: ColorFilter.mode(AppColors.dark, BlendMode.srcIn),
            ),
          ),
        ],
        title: Text('My Order'),
        backgroundColor: AppColors.white,
        centerTitle: false,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 56,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 32),
              itemCount: 3,
              separatorBuilder: (_, _) => const SizedBox(width: 19),
              itemBuilder: (_, index) {
                return SizedBox(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(color: AppColors.gray1, width: 1),
                        ),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.fromLTRB(41, 14, 41, 18),
                        child: Text('All $index'),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 7,
                            decoration: const BoxDecoration(
                              color: AppColors.orange,
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(7),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 30.0),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomDropDownOrderWidget(),
                  Divider(height: 1.0),
                  SizedBox(height: 20.0),
                  CustomDropDownOrderWidget(
                    color: AppColors.white,
                    colorTheme: AppColors.completedOrder,
                  ),
                  Divider(height: 1.0),
                  SizedBox(height: 20.0),
                  CustomDropDownOrderWidget(
                    color: AppColors.white,
                    colorTheme: AppColors.completedOrder,
                  ),
                  Divider(height: 1.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
