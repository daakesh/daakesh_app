import 'package:daakesh/src/src.export.dart';
import 'package:flutter/material.dart';

/// This is class[AppTheme] to toggle between app mode.
///
/// There are tow variables from [ThemeData] type.
///
/// Light & Dark mode variable and we call it in [Main] class.
///
///

class AppTheme {
  ///lightMode
  static final ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: Colors.white,

    ///ElevatedButtonTheme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
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
    ),

    ///OutlinedButtonTheme
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
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
    ),

    ///

    ///TextStyle
    textTheme: TextTheme(
      ///sfProDisplaySemiBold
      labelSmall: TextStyle(
        fontFamily: FontFamily.sfProDisplaySemiBold,
        fontSize: ResponsiveText.getResponsiveFontSize(fontSize: 18.0),
        color: ColorName.black,
      ),

      ///labelMedium
      labelMedium: TextStyle(
        fontFamily: FontFamily.sfProDisplayRegular,
        fontSize: ResponsiveText.getResponsiveFontSize(fontSize: 18.0),
        color: ColorName.black,
      ),

      ///labelLarge
      labelLarge: TextStyle(
        fontFamily: FontFamily.segoeUISemiBold,
        fontSize: ResponsiveText.getResponsiveFontSize(fontSize: 22.0),
        color: ColorName.white,
      ),

      ///bodySmall => apercuLight
      bodySmall: TextStyle(
        fontFamily: FontFamily.apercuLight,
        fontSize: ResponsiveText.getResponsiveFontSize(fontSize: 14.0),
        color: ColorName.ashGray,
      ),

      ///bodyMedium
      bodyMedium: TextStyle(
        fontFamily: FontFamily.apercuRegular,
        fontSize: ResponsiveText.getResponsiveFontSize(fontSize: 17.0),
        color: ColorName.blueGray,
      ),

      ///bodyLarge
      bodyLarge: TextStyle(
        fontFamily: FontFamily.apercuMedium,
        fontSize: ResponsiveText.getResponsiveFontSize(fontSize: 20.0),
        color: ColorName.blueGray,
      ),

      ///headlineSmall
      headlineSmall: TextStyle(
        fontFamily: FontFamily.apercuBold,
        fontSize: ResponsiveText.getResponsiveFontSize(fontSize: 18.0),
        color: ColorName.blueGray,
      ),

      ///headlineMedium
      headlineMedium: TextStyle(
        fontFamily: FontFamily.apercuBold,
        fontSize: ResponsiveText.getResponsiveFontSize(fontSize: 25.0),
        color: ColorName.blueGray,
      ),

      ///headlineLarge
      headlineLarge: TextStyle(
        fontFamily: FontFamily.apercuBold,
        fontSize: ResponsiveText.getResponsiveFontSize(fontSize: 40.0),
        color: ColorName.blueGray,
      ),
    ),
    //sliderTheme: SliderThemeData(),
  );
}
