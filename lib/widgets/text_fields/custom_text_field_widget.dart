import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../gen/assets.gen.dart';
import '../../resources/app_colors.dart';

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
      horizontal: 0,
      vertical: 0,
    ),
    this.inputFormatters,
    this.textStyle,
    this.hintStyle,
    this.padding = 0.0,
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

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.isPassword ? widget.initialObscure : false;
  }

  @override
  Widget build(BuildContext context) {
    final Widget? effectiveSuffix =
        widget.isPassword
            ? IconButton(
              onPressed: () => setState(() => _obscure = !_obscure),
              icon: SvgPicture.asset(
                _obscure ? Assets.icons.eyeTrue : Assets.icons.eyeFalse,
              ),
            )
            : widget.suffix;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.padding),
      child: Container(
        height: 60.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.grey1,
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        alignment: Alignment.center,
        child: TextField(
          controller: widget.controller,
          focusNode: widget.focusNode,
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
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: widget.hintStyle,
            filled: true,
            fillColor: AppColors.grey1,
            contentPadding: widget.contentPadding,
            prefixIconConstraints: BoxConstraints(
              minHeight: 0.0,
              minWidth: 0.0,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 20.0),
              child: widget.prefix,
            ),
            suffixIcon: effectiveSuffix,
            counterText: '',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(color: AppColors.grey1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(color: AppColors.grey1),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(color: AppColors.gradientTwo),
            ),
          ),
        ),
      ),
    );
  }
}
