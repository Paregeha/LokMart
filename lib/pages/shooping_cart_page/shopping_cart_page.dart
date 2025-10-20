import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_button_widget.dart';
import 'package:flutter_base_architecture/widgets/cart/custom_shopping_cart_widget.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        title: Text('ShoppingCart'),
        titleSpacing: 32.0,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              CustomShoppingCartWidget(),
              SizedBox(height: 16.0),
              CustomShoppingCartWidget(),
              SizedBox(height: 16.0),
              CustomShoppingCartWidget(),
              SizedBox(height: 16.0),
              CustomShoppingCartWidget(),
              SizedBox(height: 45.0),
              Row(children: [Text('Bill Details')]),
              SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Item Total'), Text('\$14.0')],
              ),
              SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Delivery Free 9.71 kms'), Text('+ \$10.08')],
              ),
              SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Texes and Charge'), Text('+ \$15.02')],
              ),
              SizedBox(height: 15.0),
              Divider(height: 1, color: AppColors.gray1),
              SizedBox(height: 21.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Order Total'), Text('+ \$39.01')],
              ),
              SizedBox(height: 34),
              CustomButtonsWidget(label: 'CHECKOUT'),
            ],
          ),
        ),
      ),
    );
  }
}
