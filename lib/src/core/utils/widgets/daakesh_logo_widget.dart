import 'package:flutter/material.dart';
import '../../../src.export.dart';

class DaakeshLogoWidget extends StatelessWidget {
  final double height;
  final double width;
  final bool isLight;

  const DaakeshLogoWidget({super.key,this.height = 56.0,this.width = 184.0,this.isLight = false});

  @override
  Widget build(BuildContext context) {
    return !isLight
        ? Assets.svg.daakeshLogo.svg(height: height,width:width)
        : Assets.svg.lightDaakeshLogo.svg(height: height,width:width);
  }
}