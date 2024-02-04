import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../src.export.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final bool isSuffixOn;
  final bool isUnderlineOn;
  final Widget? suffixIcon;
  final List<TextInputFormatter> inputFormatters;
  final TextInputType keyboardType;
  final TextAlign textAlign;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final FocusNode? focusNode;
  final String hintText;
  final TextCapitalization textCapitalization;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final double? cursorHeight;
  final double cursorWidth;
  final TextAlignVertical textAlignVertical;

  const TextFormFieldWidget({
    super.key,
    required this.controller,
    this.obscureText = false,
    this.isSuffixOn = false,
    this.suffixIcon,
    this.inputFormatters = const[],
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

  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textCapitalization:textCapitalization,
      textAlignVertical: textAlignVertical,
      style: style ?? easyTheme.textTheme.labelMedium,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      textAlign: textAlign,
      cursorWidth:cursorWidth,
      cursorHeight:cursorHeight,
      onChanged: onChanged ?? (value){return;},
      onFieldSubmitted:onFieldSubmitted ??(value){return;},
      focusNode:focusNode,
      cursorColor: ColorName.blueGray,
      keyboardType: keyboardType,
      decoration: isUnderlineOn
          ? InputDecoration(
        enabledBorder: InputBorder.none,
        focusedBorder:InputBorder.none,
        isCollapsed: true,
        hintText:hintText,
        hintStyle: easyTheme.textTheme.labelMedium!.copyWith(color: ColorName.black.withOpacity(0.3)),

      )
          : !isSuffixOn
          ? InputDecoration(
        hintText:hintText,
        hintStyle:hintStyle ?? easyTheme.textTheme.labelMedium,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorName.darkGray,width: 1.5),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorName.darkGray,width: 1.5),
        ),
      )
          : InputDecoration(
        hintText:hintText,
        hintStyle:easyTheme.textTheme.labelMedium,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorName.darkGray,width: 1.5),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorName.darkGray,width: 1.5),
        ),
        suffixIcon: suffixIcon ?? const SizedBox(width: 0.0,height: 0.0,),
      ),






    );
  }
}
