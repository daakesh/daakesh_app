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
        style: style ??
            OutlinedButton.styleFrom(
              foregroundColor: ColorName.blueGray,
              side: const BorderSide(color: ColorName.blueGray),
              minimumSize: const Size(387.0, 56.0),
              textStyle: const TextStyle(
                fontFamily: FontFamily.apercuMedium,
                fontSize: 20.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
        child: Text(
          text,
        ),
      ),
    );
  }
}
