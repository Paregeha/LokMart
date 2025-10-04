import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_slider_widget.dart';
import 'package:widgetbook/widgetbook.dart';

final customSliderComponent = WidgetbookComponent(
  name: 'CustomSliderWidget',
  useCases: [
    WidgetbookUseCase(
      name: 'Slider',
      builder: (context) {
        final start = context.knobs.double.slider(
          label: 'Start',
          initialValue: 10,
          min: 0,
          max: 300,
        );
        final end = context.knobs.double.slider(
          label: 'End',
          initialValue: 230,
          min: 0,
          max: 300,
        );
        return Center(
          child: CustomSliderWidget(
            values: RangeValues(start, end),
            onChanged: (_) {},
            currency: r'$',
          ),
        );
      },
    ),
  ],
);
