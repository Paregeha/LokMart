import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/widgetbook/components/buttons/custom_slider_case.dart';
import 'package:widgetbook/widgetbook.dart';

import 'components/buttons/custom_button_case.dart';

void main() => runApp(const MyWidgetbook());

class MyWidgetbook extends StatelessWidget {
  const MyWidgetbook({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      addons: [
        DeviceFrameAddon(devices: [...Devices.ios.all, ...Devices.android.all]),
        TextScaleAddon(),
        GridAddon(),
        AlignmentAddon(),
        ThemeAddon(
          themes: [
            WidgetbookTheme(name: 'Light', data: ThemeData.light()),
            WidgetbookTheme(name: 'Dark', data: ThemeData.dark()),
          ],
          themeBuilder:
              (context, theme, child) => MaterialApp(
                theme: theme,
                home: child,
                debugShowCheckedModeBanner: false,
              ),
        ),
      ],
      directories: [
        WidgetbookCategory(
          name: 'Widgets',
          children: [customButtonComponent, customSliderComponent],
        ),
      ],
    );
  }
}
