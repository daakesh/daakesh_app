import 'package:flutter/material.dart';
import '../../../src.export.dart';

class DaakeshLogoWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final bool isLight;

  const DaakeshLogoWidget({
    super.key,
    this.height,
    this.width,
    this.isLight = false,
  });

  @override
  Widget build(BuildContext context) {
    return !isLight
        ? Assets.svg.daakeshLogo.svg(width: width ?? 272.0.w)
        : Assets.svg.lightDaakeshLogo.svg(width: width ?? 272.0.w);
  }
}
