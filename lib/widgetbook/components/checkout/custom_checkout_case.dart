import 'package:flutter/cupertino.dart';
import 'package:flutter_base_architecture/widgets/checkout/custom_checkout_widget.dart';
import 'package:widgetbook/widgetbook.dart';

final customCheckoutComponent = WidgetbookComponent(
  name: 'CustomCheckoutWidget',
  useCases: [
    WidgetbookUseCase(
      name: 'Checkout',
      builder: (context) {
        return Center(child: CustomCheckoutWidget());
      },
    ),
  ],
);
