import 'package:flutter/material.dart';
import '../../../../src.export.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle? style;
  final EdgeInsets? padding;
  final bool isBold;

  const TextButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    this.style,
    this.padding,
    this.isBold = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: onPressed,
        child: Text(
          text,
          style: style ??
              (!isBold
                  ? context.easyTheme.textTheme.bodyMedium!
                      .copyWith(color: ColorName.skyBlue, fontSize: 17.0)
                  : context.easyTheme.textTheme.bodyMedium!.copyWith(
                      color: ColorName.skyBlue,
                      fontFamily: FontFamily.apercuBold,
                      fontSize: 17.0)),
        ),
      ),
    );
  }
}
