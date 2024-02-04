import 'package:flutter/material.dart';
import '../../../../src.export.dart';


class OutlineButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonStyle? style;
  final EdgeInsets? padding;

  const OutlineButtonWidget({
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
      child: OutlinedButton(
        onPressed: onPressed,
        style: style ?? easyTheme.outlinedButtonTheme.style,
        child: Text(
          text,
        ),
      ),
    );
  }
}
