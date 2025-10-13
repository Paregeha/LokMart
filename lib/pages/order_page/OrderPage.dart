import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        titleSpacing: 32.0,
        actionsPadding: EdgeInsets.only(right: 32.0),
        actions: [
          SvgPicture.asset(
            Assets.icons.icSearch,
            width: 24.0,
            height: 24.0,
            colorFilter: ColorFilter.mode(AppColors.dark, BlendMode.srcIn),
          ),
        ],
        title: Text('My Order'),
        backgroundColor: AppColors.white,
        centerTitle: false,
      ),
      body: Column(
        children: [
          ListView.separated(
            separatorBuilder: (_, _) => const SizedBox(width: 19.0),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(height: 56.0, child: Text('All'));
            },
          ),
        ],
      ),
    );
  }
}
