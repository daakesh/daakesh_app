import 'package:daakesh/gen/fonts.gen.dart';
import 'package:daakesh/src/src.export.dart';
import 'package:flutter/material.dart';
import '../../../gen/colors.gen.dart';


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
        minimumSize:  Size(387.0.w, 56.0.h),
        backgroundColor: ColorName.blueGray,
        foregroundColor: ColorName.white,
        textStyle:  TextStyle(
          fontFamily: FontFamily.apercuRegular,
          fontSize: 20.0.sp,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0.r),
        ),
      ),
    ),
    ///OutlinedButtonTheme
    outlinedButtonTheme: OutlinedButtonThemeData(
       style: OutlinedButton.styleFrom(
         foregroundColor: ColorName.blueGray,
         side: const BorderSide(color: ColorName.blueGray),
         minimumSize:Size(387.0.w, 56.0.h),
         textStyle: TextStyle(
           fontFamily: FontFamily.apercuMedium,
           fontSize: 20.0.sp,
         ),
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(8.0.r),
         ),
       ),
     ),
    ///

    ///TextStyle
    textTheme:  TextTheme(
      ///sfProDisplaySemiBold
      labelSmall: TextStyle(
        fontFamily: FontFamily.sfProDisplaySemiBold,
        fontSize: 18.0.sp,
        color: ColorName.black,
      ),
      ///labelMedium
      labelMedium: TextStyle(
        fontFamily: FontFamily.sfProDisplayRegular,
        fontSize: 18.0.sp,
        color: ColorName.black,
      ),
      ///labelMedium
      labelLarge: TextStyle(
        fontFamily: FontFamily.segoeUISemiBold,
        fontSize: 22.0.sp,
        color: ColorName.white,
      ),
      ///bodySmall => apercuLight
      bodySmall:TextStyle(
        fontFamily: FontFamily.apercuLight,
        fontSize: 14.0.sp,
        color: ColorName.ashGray,
      ),
      ///bodyMedium
      bodyMedium:TextStyle(
        fontFamily: FontFamily.apercuRegular,
        fontSize: 17.0.sp,
        color: ColorName.blueGray,
      ),
      ///bodyLarge
      bodyLarge:TextStyle(
        fontFamily: FontFamily.apercuMedium,
        fontSize: 20.0.sp,
        color: ColorName.blueGray,
      ),

      ///headlineSmall
      headlineSmall: TextStyle(
        fontFamily: FontFamily.apercuBold,
        fontSize: 18.0.sp,
        color: ColorName.blueGray,
      ),
      ///headlineMedium
      headlineMedium: TextStyle(
        fontFamily: FontFamily.apercuBold,
        fontSize: 25.0.sp,
        color: ColorName.blueGray,
      ),
      ///headlineLarge
      headlineLarge: TextStyle(
        fontFamily: FontFamily.apercuBold,
        fontSize: 40.0.sp,
        color: ColorName.blueGray,
      ),


    ),
    //sliderTheme: SliderThemeData(),

  );

  ///darkMode
  static final ThemeData darkMode = ThemeData(
    scaffoldBackgroundColor: ColorName.blueGray,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(387.0, 56.0),
        backgroundColor: ColorName.white,
        foregroundColor: ColorName.skyBlue,
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
        foregroundColor: ColorName.white,
        side: const BorderSide(color: ColorName.white),
        minimumSize:const Size(387.0, 56.0),
        textStyle: const TextStyle(
          fontFamily: FontFamily.apercuMedium,
          fontSize: 20.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),

    ///Body-Text style
    textTheme: const TextTheme(
      bodyMedium:TextStyle(
        fontFamily: FontFamily.apercuRegular,
        fontSize: 17.0,
        color: ColorName.blueGray,
      ),
      headlineMedium: TextStyle(
        fontFamily: FontFamily.apercuBold,
        fontSize: 25.0,

        color: ColorName.white,
      ),
      headlineLarge: TextStyle(
        fontFamily: FontFamily.apercuBold,
        fontSize: 40.0,
        color: ColorName.white,
      ),


    ),

  );
}
