import 'package:flutter/cupertino.dart';
import 'package:widgetbook/widgetbook.dart';

final customSliderComponent = WidgetbookComponent(
  name: 'CustomSliderWidget',
  useCases: [
    WidgetbookUseCase(
      name: 'Slider',
      builder: (context) {
        return Center();
      },
    ),
  ],
);
