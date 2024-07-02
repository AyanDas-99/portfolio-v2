import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      shadowColor: Colors.black,
      surfaceTintColor: Colors.black,
    ),
    fontFamily: 'OpenSans',
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 180,
        fontFamily: 'FiraCode',
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displayMedium: TextStyle(
        fontSize: 150,
        fontFamily: 'FiraCode',
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        fontFamily: 'FiraCode',
        fontSize: 30,
      ),
      bodyMedium: TextStyle(
        color: lightGrey,
        fontSize: 20,
      ),
    ),
  );
  static const Color lightGrey = Color(0xFFA6A6A6);
  static const Color darkGrey = Color(0xFF3D3D3D);
}
