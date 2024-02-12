import 'package:flutter/material.dart';
import '../../../../src.export.dart';


class DefaultButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonStyle? style;
  final EdgeInsetsDirectional? padding;

  const DefaultButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    this.style,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: ElevatedButton(
        onPressed: onPressed,
        style: style ?? easyTheme.elevatedButtonTheme.style,
        child: Text(
          text,
        ),
      ),
    );
  }
}
