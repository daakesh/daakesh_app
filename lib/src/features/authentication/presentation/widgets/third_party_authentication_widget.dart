import 'package:flutter/material.dart';
import '../../../../src.export.dart';

class ThirdPartyAuthenticationWidget extends StatelessWidget {
  const ThirdPartyAuthenticationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(flex: 2,),
        Assets.png.googleIcon.image(height:36.0 ,width: 36.0),
        const Spacer(flex: 1,),
        Assets.svg.facebookIcon.svg(height:36.0 ,width: 36.0),
        const Spacer(flex: 1,),
        Assets.svg.appleIcon.svg(height:36.0 ,width: 36.0),
        const Spacer(flex: 2,),
      ],);
  }
}