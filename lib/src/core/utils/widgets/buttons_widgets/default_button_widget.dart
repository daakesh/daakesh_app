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
        style: style ??
            ElevatedButton.styleFrom(
              minimumSize: const Size(387.0, 56.0),
              backgroundColor: ColorName.blueGray,
              foregroundColor: ColorName.white,
              textStyle: const TextStyle(
                fontFamily: FontFamily.apercuRegular,
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
