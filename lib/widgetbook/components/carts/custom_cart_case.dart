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
        return Center(
          child: CustomShoppingCartWidget(
            itemId: 1,
            title: 'Organic Banana',
            category: 'Fruit',
            price: 4.0,
            oldPrice: 8.0,
            count: 1,
            onInc: () {},
            onDec: () {},
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'ItemCarts',
      builder: (context) {
        return const Center(child: CustomItemCartWidget());
      },
    ),
  ],
);
