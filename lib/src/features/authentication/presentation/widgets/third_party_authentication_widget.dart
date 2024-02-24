import 'package:flutter/material.dart';
import '../../../../src.export.dart';

class ThirdPartyAuthenticationWidget extends StatelessWidget {
  const ThirdPartyAuthenticationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.png.googleIcon.image(height:36.0.h ,width: 36.0.w),
        SizedBox(width: 44.04.w,),
        Assets.svg.facebookIcon.svg(height:36.0.h ,width: 36.0.w),
        SizedBox(width: 44.04.w,),
        Assets.svg.appleIcon.svg(height:36.0.h ,width: 36.0.w),
      ],);
  }
}