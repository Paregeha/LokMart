import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_circle_check_box_widget.dart';

import '../../features/order/models/order.dart';
import '../../gen/assets.gen.dart';
import '../../resources/app_colors.dart';
import '../order_cart/custom_order_cart_widget.dart';

class CustomDropDownOrderWidget extends StatefulWidget {
  const CustomDropDownOrderWidget({
    super.key,
    required this.order,
    this.initialExpanded = false,
    this.color = AppColors.deliveryOrderIcon,
    this.colorTheme = AppColors.deliveryOrder,
    this.onTrackPressed,
  });

  final OrderModel order;
  final bool initialExpanded;
  final Color color;
  final Color colorTheme;

  final VoidCallback? onTrackPressed;

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

  String _prettyStatus(String raw) {
    final s = raw.trim().toLowerCase();
    if (s.isEmpty) return 'Unknown';
    switch (s) {
      case 'in_progress':
        return 'On Delivery';
      case 'completed':
        return 'Completed';
      case 'cancelled':
      case 'canceled':
        return 'Canceled';
      default:
        return raw;
    }
  }

  List<String> _timelineLabels(OrderModel o) {
    final t = o.timeline;

    if (t.isNotEmpty) {
      final labels = <String>[];
      for (final step in t) {
        final label =
            (step['label'] ?? step['title'] ?? step['name'] ?? '')
                .toString()
                .trim();
        if (label.isNotEmpty) labels.add(label);
      }
      if (labels.isNotEmpty) return labels;
    }

    return const ['Order Placed', 'Preparing', 'On Delivery', 'Arrived'];
  }

  bool _timelineDoneAt(OrderModel o, int index) {
    final t = o.timeline;
    if (t.isEmpty) return false;

    if (index >= 0 && index < t.length) {
      final step = t[index];
      final v = step['done'] ?? step['checked'] ?? step['finished'];
      if (v is bool) return v;
      if (v is String) return v.toLowerCase() == 'true';
      if (v is num) return v != 0;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final o = widget.order;
    final orderId = o.orderNumber.isNotEmpty ? o.orderNumber : o.documentId;
    final statusText = _prettyStatus(o.orderStatus);
    const itemsText = 'Items';

    final timeline = _timelineLabels(o);

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
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
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
                          children: [
                            Text(
                              'Order ID #$orderId',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text('$itemsText • $statusText'),
                          ],
                        ),
                      ],
                    ),
                    AnimatedRotation(
                      duration: const Duration(milliseconds: 220),
                      turns: _expanded ? 0.0 : 0.5,
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
                                  for (int i = 0; i < timeline.length; i++) ...[
                                    _InfoRow(
                                      text: timeline[i],
                                      isSelected: _timelineDoneAt(o, i),
                                    ),
                                    if (i != timeline.length - 1)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 13.0,
                                        ),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: 2.0,
                                            height: 25.0,
                                            decoration: BoxDecoration(
                                              color: const Color(
                                                0xFF9EA6BE,
                                              ).withValues(alpha: 0.2),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],

                                  const SizedBox(height: 18),

                                  if (widget.onTrackPressed != null)
                                    SizedBox(
                                      height: 48,
                                      child: ElevatedButton(
                                        onPressed: widget.onTrackPressed,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.orange,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          elevation: 0,
                                        ),
                                        child: const Text(
                                          'Track order',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            )
                            : const SizedBox.shrink(),
                  ),
                ),

                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.text, required this.isSelected});

  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          CustomCircleCheckBoxWidget(isSelected: isSelected, onPressed: null),
          const SizedBox(width: 18.0),
          Text(text),
        ],
      ),
    );
  }
}
