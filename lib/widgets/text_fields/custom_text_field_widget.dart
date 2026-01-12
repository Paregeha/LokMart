import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../gen/assets.gen.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_fonts.dart';

class CustomTextFieldWidget extends StatefulWidget {
  const CustomTextFieldWidget({
    super.key,
    this.controller,
    this.focusNode,
    this.hintText,
    this.prefix,
    this.suffix,
    this.isPassword = false,
    this.initialObscure = true,
    this.maxLength,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
    this.borderRadius = 14.0,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 18,
    ),
    this.inputFormatters,
    this.textStyle,
    this.hintStyle,
    this.padding = 0.0,
    this.color = AppColors.gray1,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;

  final double padding;

  final Widget? prefix;
  final Widget? suffix;

  final bool isPassword;
  final bool initialObscure;

  final int? maxLength;

  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  final bool enabled;
  final double borderRadius;
  final EdgeInsets contentPadding;

  final List<TextInputFormatter>? inputFormatters;

  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  final Color color;

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  late bool _obscure;

  FocusNode? _internalFocusNode;

  FocusNode get _focusNode => widget.focusNode ?? _internalFocusNode!;

  @override
  void initState() {
    super.initState();
    _obscure = widget.isPassword ? widget.initialObscure : false;

    if (widget.focusNode == null) {
      _internalFocusNode = FocusNode();
    }

    _focusNode.addListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChanged);
    _internalFocusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Widget? effectiveSuffix =
        widget.isPassword
            ? IconButton(
              onPressed: () => setState(() => _obscure = !_obscure),
              icon:
                  (_obscure ? Assets.icons.eyeTrue : Assets.icons.eyeFalse)
                      .svg(),
            )
            : widget.suffix;

    final bool isFocused = _focusNode.hasFocus;

    final Color borderColor =
        !widget.enabled
            ? AppColors.gradientTwo
            : (isFocused ? AppColors.orange : AppColors.gray1);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.padding),
      child: Container(
        height: 60.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: Border.all(color: borderColor, width: 1),
        ),
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          child: TextField(
            controller: widget.controller,
            focusNode: _focusNode,
            enabled: widget.enabled,
            obscureText: widget.isPassword ? _obscure : false,
            maxLength: widget.maxLength,
            maxLines: 1,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            onChanged: widget.onChanged,
            onSubmitted: widget.onSubmitted,
            inputFormatters: widget.inputFormatters,
            style: widget.textStyle,
            cursorColor: AppColors.orange,
            cursorWidth: 2.0,
            decoration: InputDecoration(
              // ✅ прибрали OutlineInputBorder щоб НЕ було подвійного бордера
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,

              hintText: widget.hintText,
              hintStyle:
                  widget.hintStyle ??
                  const TextStyle(
                    color: AppColors.softGray,
                    fontSize: 16.0,
                    height: 1,
                    fontWeight: AppFonts.w500medium,
                    fontFamily: AppFonts.fontFamily,
                    letterSpacing: 0,
                  ),

              // ✅ фон теж тримаємо тут, але рамка — тільки у Container
              filled: true,
              fillColor: widget.color,

              contentPadding: widget.contentPadding,

              prefixIcon: widget.prefix,
              prefixIconConstraints: const BoxConstraints(
                minHeight: 0,
                minWidth: 0,
              ),
              suffixIcon: effectiveSuffix,

              counterText: '',
            ),
          ),
        ),
      ),
    );
  }
}
