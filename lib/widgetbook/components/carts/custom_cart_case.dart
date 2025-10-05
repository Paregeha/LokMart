import 'package:flutter/cupertino.dart';
import 'package:flutter_base_architecture/widgets/cart/custom_item_cart_widget.dart';
import 'package:flutter_base_architecture/widgets/cart/custom_shopping_cart_widget.dart';
import 'package:widgetbook/widgetbook.dart';

final customCartCase = WidgetbookComponent(
  name: 'CustomCartWidgets',
  useCases: [
    WidgetbookUseCase(
      name: 'Shopping Carts',
      builder: (context) {
        return Center(child: CustomShoppingCartWidget());
      },
    ),

    WidgetbookUseCase(
      name: 'ItemCarts',
      builder: (context) {
        return Center(child: CustomItemCartWidget());
      },
    ),
  ],
);
