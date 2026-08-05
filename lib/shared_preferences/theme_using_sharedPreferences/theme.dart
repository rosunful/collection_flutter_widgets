
import 'package:flutter/material.dart';

class Theme {

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    
    colorScheme: ColorScheme.light(
      primary: Colors.pink,
      secondary: Colors.pink,
      surface: Colors.green
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,

    )
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,

    colorScheme: ColorScheme.dark(
      primary: Colors.red,
      secondary: Colors.green,
      surface: Colors.brown,

    ),

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    )


  );

}