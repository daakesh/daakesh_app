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
      elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(130.0, 34.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
     buttonTheme: ButtonThemeData(
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
       splashColor: Colors.red,
       buttonColor: const Color(0xFF7A3FE1),
       height: 34.0,
       highlightColor: Colors.green,
       textTheme: ButtonTextTheme.normal,
     ),
       textTheme: const TextTheme(
       bodyLarge:TextStyle(
           fontSize: 26.0,
           color: Color(0xff2E2B2A),
           height: 2.0
       ),
       bodyMedium:TextStyle(
         fontSize: 14.0,
         color: Color(0xff2E2B2A),
         height: 1.8,
       ),
       bodySmall:TextStyle(
         fontSize: 10.0,
         color: Color(0xFF7A3FE1),
         height: 1.3,
       ),
     ),

  );

  ///darkMode
  static final ThemeData darkMode = ThemeData();
}
