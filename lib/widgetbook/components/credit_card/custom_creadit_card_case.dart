import 'package:flutter/cupertino.dart';
import 'package:flutter_base_architecture/widgets/credit_card/custom_credit_card_widget.dart';
import 'package:widgetbook/widgetbook.dart';

final customCreditCardCase = WidgetbookComponent(
  name: 'CustomCreditCardWidget',
  useCases: [
    WidgetbookUseCase(
      name: 'CreditCard',
      builder: (context) {
        return Center(child: CustomCreditCardWidget());
      },
    ),
  ],
);
