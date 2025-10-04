import 'package:flutter/material.dart';

class CustomSliderWidget extends StatefulWidget {
  const CustomSliderWidget({
    super.key,
    this.min = 0.0,
    this.max = 500.0,
    required this.values,
    required this.onChanged,
    this.currency = r'$',
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
    const active = Color(0xFFF07A3B); // помаранчевий
    const inactive = Color(0xFFE9EEF4); // сірий трек

    return LayoutBuilder(
      builder: (context, bc) {
        final w = bc.maxWidth;
        // позиції підписів — частка від ширини
        final leftX =
            ((_values.start - widget.min) / (widget.max - widget.min)) * w;
        final rightX =
            ((_values.end - widget.min) / (widget.max - widget.min)) * w;

        return Stack(
          clipBehavior: Clip.none,
          children: [
            // Підписи над ручками
            Positioned(
              left: (leftX - 20).clamp(0, w - 40),
              top: -24,
              width: 40,
              child: _PriceLabel(
                text: '${widget.currency}${_values.start.round()}',
              ),
            ),
            Positioned(
              left: (rightX - 28).clamp(0, w - 56),
              top: -24,
              width: 56,
              child: _PriceLabel(
                text: '${widget.currency}${_values.end.round()}',
              ),
            ),

            // Сам слайдер
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 3,
                activeTrackColor: active,
                inactiveTrackColor: inactive,
                overlayShape: SliderComponentShape.noOverlay,
                rangeThumbShape: _RoundThumbWithShadow(
                  radius: 10,
                  color: active,
                ),
                thumbColor: Colors.white,
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
          ],
        );
      },
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
        fontSize: 14,
        color: Color(0xFF8592A6), // сіро-блакитний як на скріні
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

/// Кастомний “кружок” з помаранчевим внутрішнім і білим кільцем + тінь
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
    final canvas = context.canvas;

    // тінь
    final shadowPaint =
        Paint()
          ..color = Colors.black.withOpacity(0.15)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);
    canvas.drawCircle(center.translate(0, 1), radius + 2, shadowPaint);

    // біле кільце
    canvas.drawCircle(center, radius + 4, Paint()..color = Colors.white);

    // помаранчевий заповнювач
    canvas.drawCircle(center, radius, Paint()..color = color);
  }
}
