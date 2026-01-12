import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_button_count_widget.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_button_profile_widget.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_circle_check_box_widget.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_circle_radio_button_widget.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_square_check_box_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widgetbook/widgetbook.dart';

import '../../../gen/assets.gen.dart';
import '../../../widgets/buttons/custom_button_widget.dart';

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
      name: 'SquareCheckBox',
      builder: (context) {
        var isSelected = context.knobs.boolean(
          label: 'Is Selected?',
          initialValue: true,
        );
        return Center(
          child: CustomCheckBoxWidget(
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
        final bool isSelected = context.knobs.boolean(
          label: 'Is Selected',
          initialValue: true,
        );

        return Center(
          child: CustomCircleRadioButtonWidget(isSelected: isSelected),
        );
      },
    ),

    WidgetbookUseCase(
      name: 'CircleCheckBox',
      builder: (context) {
        final bool isSelected = context.knobs.boolean(
          label: 'Is Selected',
          initialValue: true,
        );

        return Center(
          child: CustomCircleCheckBoxWidget(isSelected: isSelected),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'ButtonProfile',
      builder: (context) {
        final String label = context.knobs.string(
          label: 'Label',
          initialValue: 'Account Info',
        );

        final bool isLogout = context.knobs.boolean(
          label: 'IsLogout',
          initialValue: true,
        );

        return Center(
          child: CustomButtonProfileWidget(
            icon: SvgPicture.asset(Assets.icons.email.path),
            label: label,
            isLogout: isLogout,
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'ButtonCounts',
      builder: (context) {
        // final String widthCountString = context.knobs.string(
        //   label: 'widthCount',
        //   initialValue: '100.0',
        // );
        // final double widthCount = double.tryParse(widthCountString) ?? 0;

        // final String heightCountString = context.knobs.string(
        //   label: 'heightCount',
        //   initialValue: '30.0',
        // );
        // final double heightCount = double.tryParse(heightCountString) ?? 0;

        final String widthCountBigString = context.knobs.string(
          label: 'widthBigCount',
          initialValue: '100.0',
        );
        final double widthBigCount = double.tryParse(widthCountBigString) ?? 0;

        final String heightCountBigString = context.knobs.string(
          label: 'heightBigCount',
          initialValue: '30.0',
        );
        final double heightBigCount =
            double.tryParse(heightCountBigString) ?? 0;

        return Center(
          child: CustomButtonCountWidget(
            heightCount: heightBigCount,
            widthCount: widthBigCount,
            paddingCount: 10.0,
          ),
        );
      },
    ),
  ],
);
