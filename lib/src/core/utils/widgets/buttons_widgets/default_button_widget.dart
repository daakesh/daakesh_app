import 'package:daakesh/src/core/core.export.dart';
import 'package:flutter/material.dart';

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
        style: style ?? context.easyTheme.elevatedButtonTheme.style,
        child: Text(
          text,
        ),
      ),
    );
  }
}
