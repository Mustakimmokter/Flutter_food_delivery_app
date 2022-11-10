import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.textEditingController,
    this.textInputType,
    this.textStyle,
    this.hintStyle,
    this.labelStyle,
    this.obscureText,
    this.obscuringCharacter,
    this.hintText,
    this.labelText,
    this.decoration,
    this.contentPadding,
    this.border,
    this.focusBorder,
    this.prefix,
    this.suffix,
    this.onTap,
    this.onChange,
    this.focusBorderColor,
    this.focusBorderRadius,
    this.enabledBorderColor,
    this.enabledBorderRadius,
    this.label,
    this.fillColor,
    this.prefixIcon,
    this.suffixIcon,
    this.elevation,
    this.shadowColor,
  });

  final TextEditingController? textEditingController;
  final TextInputType? textInputType;
  final TextStyle? textStyle, hintStyle, labelStyle;
  final bool? obscureText;
  final String? obscuringCharacter, hintText, labelText;
  final InputDecoration? decoration;
  final EdgeInsets? contentPadding;
  final OutlineInputBorder? border, focusBorder;
  final Widget? prefix, suffix, label, prefixIcon, suffixIcon;
  final VoidCallback? onTap;
  final Function(String)? onChange;
  final Color? focusBorderColor, enabledBorderColor, fillColor, shadowColor;
  final double? focusBorderRadius, enabledBorderRadius, elevation;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation ?? 0,
      borderRadius: BorderRadius.circular(enabledBorderRadius ?? 02),
      shadowColor: shadowColor ?? Colors.grey.withOpacity(.2),
      child: TextField(
        controller: textEditingController,
        keyboardType: textInputType,
        style: textStyle,
        onTap: onTap,
        onChanged: onChange,
        obscureText: obscureText ?? false,
        obscuringCharacter: obscuringCharacter ?? '*',
        decoration: decoration ??
            InputDecoration(
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              filled: true,
              label: label,
              fillColor: fillColor ?? Colors.transparent,
              enabledBorder: border ??
                  OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(enabledBorderRadius ?? 02),
                    borderSide: BorderSide(
                      color: enabledBorderColor ?? Color(0xff717171),
                    ),
                  ),
              contentPadding: contentPadding,
              focusedBorder: focusBorder ??
                  OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(focusBorderRadius ?? 02),
                    borderSide: BorderSide(
                      color: focusBorderColor ?? Color(0xff717171),
                    ),
                  ),
              hintText: hintText,
              labelText: labelText,
              labelStyle: labelStyle,
              hintStyle: hintStyle,
              alignLabelWithHint: false,
              suffix: suffix,
              prefix: prefix,
            ),
      ),
    );
  }
}
