import 'package:flutter/material.dart';

ThemeData lightMode =ThemeData(
brightness: Brightness.light,
colorScheme: ColorScheme.light(
  onSurface: Colors.pink,
  primary: Colors.yellow,
  secondary: Colors.lightGreenAccent
)
);

ThemeData nightMode =ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    onPrimary: Colors.grey,
    onSecondary: Colors.black,
    onSurface: Colors.green

  )

);