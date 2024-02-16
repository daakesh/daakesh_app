import 'package:daakesh/gen/assets.gen.dart';
import 'package:daakesh/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class DefaultBackgroundWidget extends StatelessWidget {
  final Widget child;
  const DefaultBackgroundWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorName.white,
        image: DecorationImage(
          image: AssetImage(Assets.png.authScreensBackground.path),
          opacity: 0.4
        ),
      ),
      child:child ,
    );

  }
}
