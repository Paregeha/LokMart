import 'package:flutter/cupertino.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_cards_categories_widget.dart';
import 'package:widgetbook/widgetbook.dart';

final customCardsButtonsComponent = WidgetbookComponent(
  name: 'CustomCardsButtonsWidget',
  useCases: [
    WidgetbookUseCase(
      name: 'Categories',
      builder: (context) {
        return Center(child: CustomCardsCategoriesWidget());
      },
    ),
  ],
);
