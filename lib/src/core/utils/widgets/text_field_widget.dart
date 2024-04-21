import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../src.export.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final bool isSuffixPrefixOn;
  final bool? enabled;
  final bool isUnderlineOn;
  final bool readOnly;
  final bool expands;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final List<TextInputFormatter> inputFormatters;
  final TextInputType keyboardType;
  final TextAlign textAlign;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final FocusNode? focusNode;
  final String hintText;
  final VoidCallback? onTap;
  final TextCapitalization textCapitalization;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final double? cursorHeight;
  final double cursorWidth;
  final int? maxLines;
  final TextAlignVertical textAlignVertical;

  const TextFormFieldWidget({
    super.key,
    required this.controller,
    this.obscureText = false,
    this.isSuffixPrefixOn = false,
    this.suffixIcon,
    this.prefixIcon,
    this.inputFormatters = const [],
    this.keyboardType = TextInputType.text,
    this.textAlign = TextAlign.start,
    this.onChanged,
    this.focusNode,
    this.onFieldSubmitted,
    this.hintText = '',
    this.textCapitalization = TextCapitalization.none,
    this.hintStyle,
    this.isUnderlineOn = false,
    this.style,
    this.cursorHeight,
    this.cursorWidth = 2.0,
    this.textAlignVertical = TextAlignVertical.center,
    this.onTap,
    this.enabled,
    this.readOnly = false,
    this.expands = false,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorName.transparent,
      child: TextFormField(
        controller: controller,
        textCapitalization: textCapitalization,
        textAlignVertical: textAlignVertical,
        style: style ??
            context.easyTheme.textTheme.labelMedium!
                .copyWith(fontSize: 18.0.sp),
        inputFormatters: inputFormatters,
        obscureText: obscureText,
        textAlign: textAlign,
        expands: expands,
        maxLines: maxLines,
        onTap: onTap ?? () {},
        enabled: enabled ?? true,
        readOnly: readOnly,
        cursorWidth: cursorWidth,
        cursorHeight: cursorHeight,
        onChanged: onChanged ??
            (value) {
              return;
            },
        onFieldSubmitted: onFieldSubmitted ??
            (value) {
              return;
            },
        focusNode: focusNode,
        cursorColor: ColorName.blueGray,
        keyboardType: keyboardType,
        decoration: isUnderlineOn
            ? InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                isCollapsed: true,
                hintText: hintText,
                hintStyle: context.easyTheme.textTheme.labelMedium!.copyWith(
                    color: ColorName.black.withOpacity(0.3), fontSize: 18.0.sp),
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon,
              )
            : !isSuffixPrefixOn
                ? InputDecoration(
                    hintText: hintText,
                    hintStyle: hintStyle ??
                        context.easyTheme.textTheme.labelMedium!
                            .copyWith(fontSize: 18.0.sp),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorName.darkGray, width: 1.5),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorName.darkGray, width: 1.5),
                    ),
                    suffixIcon: suffixIcon,
                    prefixIcon: prefixIcon,
                  )
                : InputDecoration(
                    hintText: hintText,
                    hintStyle: context.easyTheme.textTheme.labelMedium!
                        .copyWith(fontSize: 18.0.sp),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorName.darkGray, width: 1.5),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorName.darkGray, width: 1.5),
                    ),
                    suffixIcon: suffixIcon,
                    prefixIcon: prefixIcon,
                  ),
      ),
    );
  }
}
