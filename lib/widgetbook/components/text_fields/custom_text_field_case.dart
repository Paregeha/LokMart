import 'package:flutter/cupertino.dart';
import 'package:flutter_base_architecture/widgets/text_fields/custom_text_field_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widgetbook/widgetbook.dart';

import '../../../gen/assets.gen.dart';

final customTextFieldWidget = WidgetbookComponent(
  name: 'CustomTextFieldWidget',
  useCases: [
    WidgetbookUseCase(
      name: 'Login',
      builder: (context) {
        final paddingString = context.knobs.string(
          label: 'Padding',
          initialValue: '32.0',
        );

        final padding = double.tryParse(paddingString) ?? 0;

        return Center(
          child: CustomTextFieldWidget(
            hintText: 'Login',
            padding: padding,
            prefix: Assets.icons.user.svg(width: 24.0, height: 24.0),
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Email',
      builder: (context) {
        final paddingString = context.knobs.string(
          label: 'Padding',
          initialValue: '32.0',
        );

        final padding = double.tryParse(paddingString) ?? 0;

        return Center(
          child: CustomTextFieldWidget(
            hintText: 'Email',
            padding: padding,
            prefix: Assets.icons.email.svg(width: 24.0, height: 24.0),
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Password',
      builder: (context) {
        final paddingString = context.knobs.string(
          label: 'Padding',
          initialValue: '32.0',
        );

        final padding = double.tryParse(paddingString) ?? 0;

        return Center(
          child: CustomTextFieldWidget(
            hintText: 'Password',
            padding: padding,
            isPassword: true,
            prefix: Assets.icons.lock.svg(width: 24.0, height: 24.0),
          ),
        );
      },
    ),
  ],
);
