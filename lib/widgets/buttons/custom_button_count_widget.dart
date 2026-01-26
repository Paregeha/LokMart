import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';

import '../../gen/assets.gen.dart';

class CustomButtonCountWidget extends StatefulWidget {
  const CustomButtonCountWidget({
    super.key,
    required this.heightCount,
    required this.widthCount,
    required this.paddingCount,

    this.value,

    this.onChanged,
    this.onInc,
    this.onDec,

    this.min = 1,
    this.max,
  });

  final double heightCount;
  final double widthCount;
  final double paddingCount;

  final int? value;
  final ValueChanged<int>? onChanged;

  final VoidCallback? onInc;
  final VoidCallback? onDec;

  final int min;
  final int? max;

  @override
  State<CustomButtonCountWidget> createState() =>
      _CustomButtonCountWidgetState();
}

class _CustomButtonCountWidgetState extends State<CustomButtonCountWidget> {
  late int _count;

  bool _isMinusPressed = false;
  bool _isPlusPressed = false;

  static const _animDuration = Duration(milliseconds: 150);

  bool get _isControlled => widget.value != null;

  @override
  void initState() {
    super.initState();
    _count = (widget.value ?? widget.min).clamp(
      widget.min,
      widget.max ?? 1 << 30,
    );
  }

  @override
  void didUpdateWidget(covariant CustomButtonCountWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (_isControlled && widget.value != oldWidget.value) {
      _count = (widget.value ?? widget.min).clamp(
        widget.min,
        widget.max ?? 1 << 30,
      );
    }
  }

  void _emitChanged(int next) {
    final clamped = next.clamp(widget.min, widget.max ?? 1 << 30);

    if (!_isControlled) {
      setState(() => _count = clamped);
    }

    widget.onChanged?.call(clamped);
  }

  void _handleDec() {
    if (widget.onDec != null) {
      widget.onDec!.call();
      return;
    }

    _emitChanged(_count - 1);
  }

  void _handleInc() {
    if (widget.onInc != null) {
      widget.onInc!.call();
      return;
    }

    _emitChanged(_count + 1);
  }

  @override
  Widget build(BuildContext context) {
    final current = _isControlled ? (widget.value ?? _count) : _count;

    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: widget.widthCount,
          height: widget.heightCount,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedContainer(
                duration: _animDuration,
                curve: Curves.easeOut,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color:
                      _isMinusPressed
                          ? AppColors.orange.withValues(alpha: 0.1)
                          : AppColors.white,
                  border: Border.all(
                    color:
                        _isMinusPressed ? Colors.transparent : AppColors.gray1,
                  ),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8.0),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onHighlightChanged: (isPressed) {
                    setState(() => _isMinusPressed = isPressed);
                  },
                  onTap: () {
                    if (current > widget.min) _handleDec();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: widget.paddingCount,
                    ),
                    child: Center(
                      child: Assets.icons.minus.svg(
                        width: 10.0,
                        height: 2.0,
                        colorFilter: ColorFilter.mode(
                          _isMinusPressed ? AppColors.orange : AppColors.dark,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Center(
                  child: Text(
                    '$current',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              AnimatedContainer(
                duration: _animDuration,
                curve: Curves.easeOut,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color:
                      _isPlusPressed
                          ? AppColors.orange.withValues(alpha: 0.1)
                          : AppColors.white,
                  border: Border.all(
                    color:
                        _isPlusPressed ? Colors.transparent : AppColors.gray1,
                  ),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8.0),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onHighlightChanged: (isPressed) {
                    setState(() => _isPlusPressed = isPressed);
                  },
                  onTap: () {
                    final max = widget.max;
                    if (max == null || current < max) _handleInc();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: widget.paddingCount,
                    ),
                    child: Center(
                      child: Assets.icons.pluss.svg(
                        width: 10.0,
                        height: 10.0,
                        colorFilter: ColorFilter.mode(
                          _isPlusPressed ? AppColors.orange : AppColors.dark,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
