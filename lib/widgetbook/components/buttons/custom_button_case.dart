import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_circle_radio_button_widget.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_square_radio_button_widget.dart';
import 'package:widgetbook/widgetbook.dart';

import '../../../widgets/buttons/custom_button_widget.dart'; // поправ шлях

final customButtonComponent = WidgetbookComponent(
  name: 'CustomButtonsWidget',
  useCases: [
    WidgetbookUseCase(
      name: 'Button',
      builder: (context) {
        final label = context.knobs.string(
          label: 'label',
          initialValue: 'NEXT',
        );

        final padStr = context.knobs.string(
          label: 'Padding',
          initialValue: '32',
        );
        final pad = double.tryParse(padStr) ?? 0;

        final enable = context.knobs.boolean(
          label: 'Enable Icon',
          initialValue: false,
        );

        return Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: pad),
            child: CustomButtonsWidget(
              label: label,
              enable: enable,
              onPressed: () {
                debugPrint('Tap');
              },
            ),
          ),
        );
      },
    ),

    WidgetbookUseCase(
      name: 'SquareRadioButton',
      builder: (context) {
        var isSelected = context.knobs.boolean(
          label: 'Is Selected?',
          initialValue: true,
        );
        return Center(
          child: CustomRadioButtonWidget(
            isSelected: isSelected,
            onPressed: () {
              isSelected = !isSelected;
            },
          ),
        );
      },
    ),

    WidgetbookUseCase(
      name: 'CircleRadioButton',
      builder: (context) {
        return Center(child: CustomCircleRadioButtonWidget());
      },
    ),
  ],
);
