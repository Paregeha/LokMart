import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_base_architecture/widgets/cart/custom_item_cart_widget.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text('Wishlists'),
        centerTitle: false,
        scrolledUnderElevation: 0,
        titleSpacing: 32.0,
        backgroundColor: AppColors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            children: [
              SizedBox(height: 8.0),
              CustomItemCartWidget(),
              SizedBox(height: 25.0),
              CustomItemCartWidget(),
              SizedBox(height: 25.0),
              CustomItemCartWidget(),
              SizedBox(height: 25.0),
              CustomItemCartWidget(),
              SizedBox(height: 25.0),
              CustomItemCartWidget(),
              SizedBox(height: 25.0),
              CustomItemCartWidget(),
              SizedBox(height: 25.0),
              CustomItemCartWidget(),
              SizedBox(height: 25.0),
              CustomItemCartWidget(),
              SizedBox(height: 25.0),
              CustomItemCartWidget(),
              SizedBox(height: 25.0),
              CustomItemCartWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
