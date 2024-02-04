import 'package:daakesh/gen/assets.gen.dart';
import 'package:daakesh/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class AuthenticationBackgroundWidget extends StatelessWidget {
  final Widget widget;
  const AuthenticationBackgroundWidget({super.key, required this.widget});

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
      child:widget ,
    );

  }
}
