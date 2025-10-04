import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';

class CustomSliderWidget extends StatefulWidget {
  const CustomSliderWidget({
    super.key,
    this.min = 0.0,
    this.max = 500.0,
    required this.values,
    required this.onChanged,
    this.currency = r'\$',
  });

  final double min;
  final double max;
  final RangeValues values;
  final ValueChanged<RangeValues> onChanged;
  final String currency;

  @override
  State<CustomSliderWidget> createState() => _CustomSliderWidgetState();
}

class _CustomSliderWidgetState extends State<CustomSliderWidget> {
  late RangeValues _values = widget.values;

  @override
  Widget build(BuildContext context) {
    const active = AppColors.orange;
    const inactive = AppColors.grey1;

    const labelHeight = 24.0;
    const labelGap = 6.0;
    const sliderHeight = 36.0;
    const topOffset = labelHeight + labelGap;

    return SizedBox(
      height: topOffset + sliderHeight,
      child: LayoutBuilder(
        builder: (context, bc) {
          final w = bc.maxWidth;
          final leftX =
              ((_values.start - widget.min) / (widget.max - widget.min)) * w;
          final rightX =
              ((_values.end - widget.min) / (widget.max - widget.min)) * w;

          return Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                top: topOffset,
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 3,
                    activeTrackColor: active,
                    inactiveTrackColor: inactive,
                    overlayShape: SliderComponentShape.noOverlay,
                    rangeThumbShape: const _RoundThumbWithShadow(
                      radius: 10,
                      color: active,
                    ),
                    thumbColor: AppColors.white,
                    rangeTrackShape: const RoundedRectRangeSliderTrackShape(),
                    rangeValueIndicatorShape:
                        const PaddleRangeSliderValueIndicatorShape(),
                  ),
                  child: RangeSlider(
                    min: widget.min,
                    max: widget.max,
                    values: _values,
                    onChanged: (v) {
                      setState(() => _values = v);
                      widget.onChanged(v);
                    },
                  ),
                ),
              ),

              Positioned(
                top: 0,
                left: (leftX - 20).clamp(0, w - 40),
                width: 40,
                height: labelHeight,
                child: _PriceLabelPlaceholder(),
              ),
              Positioned(
                top: 0,
                left: (rightX - 28).clamp(0, w - 56),
                width: 56,
                height: labelHeight,
                child: _PriceLabelPlaceholder(),
              ),

              Positioned(
                top: 0,
                left: (leftX - 20).clamp(0, w - 40),
                width: 40,
                height: labelHeight,
                child: Center(
                  child: _PriceLabel(
                    text: '${widget.currency} ${_values.start.round()}',
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: (rightX - 28).clamp(0, w - 56),
                width: 56,
                height: labelHeight,
                child: Center(
                  child: _PriceLabel(
                    text: '${widget.currency} ${_values.end.round()}',
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _PriceLabel extends StatelessWidget {
  const _PriceLabel({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 12,
        color: AppColors.softGray,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _PriceLabelPlaceholder extends StatelessWidget {
  const _PriceLabelPlaceholder();
  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

class _RoundThumbWithShadow extends RangeSliderThumbShape {
  const _RoundThumbWithShadow({required this.radius, required this.color});
  final double radius;
  final Color color;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) =>
      Size.fromRadius(radius);

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    bool isDiscrete = false,
    bool isEnabled = true,
    bool isOnTop = false,
    bool isPressed = false,
    required SliderThemeData sliderTheme,
    TextDirection textDirection = TextDirection.ltr,
    Thumb thumb = Thumb.start,
  }) {
    final c = context.canvas;
    final shadow =
        Paint()
          ..color = Colors.black.withValues(alpha: 0.25)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
    c.drawCircle(center.translate(0, 2), radius + 4, shadow);
    c.drawCircle(center, radius + 3, Paint()..color = AppColors.white);
    c.drawCircle(center, radius, Paint()..color = color);
  }
}
