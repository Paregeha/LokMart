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
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: SvgPicture.asset(
              Assets.icons.icSearch,
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
      body: SizedBox(
        // height: 80,
        child: ListView.separated(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: 3,
          separatorBuilder: (_, _) => const SizedBox(width: 19),
          itemBuilder: (_, index) {
            return Column(
              children: [
                Expanded(
                  child: Container(
                    // width: 140.0,
                    // height: 70.0,
                    decoration: BoxDecoration(
                      // color: Colors.black,
                      borderRadius: BorderRadius.circular(7),
                      // border: Border.all(color: AppColors.gray1),
                      border: Border(
                        // top: BorderSide(color: Colors.black12, width: 1),
                        // left: BorderSide(color: Colors.black12, width: 1),
                        // right: BorderSide(color: Colors.black12, width: 1),
                        bottom: BorderSide(color: Colors.orange, width: 7),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 41.0,
                        right: 41.0,
                        top: 14.0,
                        bottom: 18.0,
                      ),

                      child: Text('All $index'),
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  width: double.infinity,
                  color: AppColors.orange,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
