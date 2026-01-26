import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_circle_check_box_widget.dart';

import '../../gen/assets.gen.dart';
import '../../resources/app_colors.dart';
import '../order_cart/custom_order_cart_widget.dart';

class CustomDropDownOrderWidget extends StatefulWidget {
  const CustomDropDownOrderWidget({
    super.key,
    this.initialExpanded = false,
    this.color = AppColors.deliveryOrderIcon,
    this.colorTheme = AppColors.deliveryOrder,
  });

  final bool initialExpanded;
  final Color color;
  final Color colorTheme;

  @override
  State<CustomDropDownOrderWidget> createState() =>
      _CustomDropDownOrderWidgetState();
}

class _CustomDropDownOrderWidgetState extends State<CustomDropDownOrderWidget>
    with TickerProviderStateMixin {
  late bool _expanded;

  @override
  void initState() {
    super.initState();
    _expanded = widget.initialExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => setState(() => _expanded = !_expanded),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              // border: Border.all(color: Colors.black12),
            ),
            child: Column(
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CustomOrderCartWidget(
                          color: widget.color,
                          colorTheme: widget.colorTheme,
                        ),
                        const SizedBox(width: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Order ID #0012345',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 2),
                            Text('12 Items • On Delivery'),
                          ],
                        ),
                      ],
                    ),
                    AnimatedRotation(
                      duration: const Duration(milliseconds: 220),
                      turns: _expanded ? 0.0 : 0.5, // 0.5 = 180°
                      child: Assets.icons.status.svg(),
                    ),
                  ],
                ),

                ClipRect(
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 220),
                    curve: Curves.easeInOut,
                    alignment: Alignment.topCenter,
                    child:
                        _expanded
                            ? Padding(
                              padding: const EdgeInsets.only(top: 34),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  _InfoRow(),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 13.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        width: 2.0,
                                        height: 25.0,
                                        decoration: BoxDecoration(
                                          color: Color(
                                            0xFF9EA6BE,
                                          ).withValues(alpha: 0.2),
                                        ),
                                      ),
                                    ),
                                  ),
                                  _InfoRow(),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 13.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        width: 2.0,
                                        height: 25.0,
                                        decoration: BoxDecoration(
                                          color: Color(
                                            0xFF9EA6BE,
                                          ).withValues(alpha: 0.2),
                                        ),
                                      ),
                                    ),
                                  ),
                                  _InfoRow(),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 13.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        width: 2.0,
                                        height: 25.0,
                                        decoration: BoxDecoration(
                                          color: Color(
                                            0xFF9EA6BE,
                                          ).withValues(alpha: 0.2),
                                        ),
                                      ),
                                    ),
                                  ),
                                  _InfoRow(),
                                ],
                              ),
                            )
                            : const SizedBox.shrink(),
                  ),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          CustomCircleCheckBoxWidget(),
          SizedBox(width: 18.0),
          Text('Order Placed'),
        ],
      ),
    );
  }
}
