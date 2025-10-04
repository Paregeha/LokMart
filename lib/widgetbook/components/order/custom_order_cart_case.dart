import 'package:flutter/cupertino.dart';
import 'package:flutter_base_architecture/widgets/order_cart/custom_order_cart_widget.dart';
import 'package:widgetbook/widgetbook.dart';

final customOrderCartCase = WidgetbookComponent(
  name: 'CustomOrderCartWidget',
  useCases: [
    WidgetbookUseCase(
      name: 'OrderCart',
      builder: (context) {
        return Center(child: CustomOrderCartWidget());
      },
    ),
  ],
);
