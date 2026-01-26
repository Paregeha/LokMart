import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/widgets/navigations/custom_bottom_bar_widget.dart';
import 'package:widgetbook/widgetbook.dart';

final customBottomBarWidget = WidgetbookComponent(
  name: 'CustomBottomBarWidget',
  useCases: [
    WidgetbookUseCase(
      name: 'BottomBar',
      builder: (context) {
        int index = 0;

        return Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            height: 120,
            child: StatefulBuilder(
              builder: (ctx, setStateSB) {
                return CustomBottomBarWidget(
                  activeIndex: index,
                  onTap: (i) => setStateSB(() => index = i),
                );
              },
            ),
          ),
        );
      },
    ),
  ],
);
