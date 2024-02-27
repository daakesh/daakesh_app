import 'dart:ui';

import 'package:daakesh/app_widget.dart';
import 'package:flutter/material.dart';

class ResponsiveText{

  static double getResponsiveFontSize({required double fontSize}){
    double scaleFactor = getScaleFactor();
    double responsiveFontSize = fontSize * scaleFactor;
    double lowerLimit = fontSize * 0.8;
    double upperLimit = fontSize * 1.2;
    return responsiveFontSize.clamp(lowerLimit, upperLimit);

  }

  static double getScaleFactor() {
    //double width = MediaQuery.sizeOf(navigatorKey.currentState!.context).width;
    var dispatcher = PlatformDispatcher.instance;
    var physicalWidth = dispatcher.views.first.physicalSize.width;
    var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
    double width = physicalWidth / devicePixelRatio;
    if (width < 600) {
      return width / 400;
    } else if (width < 900) {
      return width / 500;
    } else {
      return width / 1000;
    }
  }
}