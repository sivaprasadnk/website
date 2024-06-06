
import 'package:flutter/material.dart';
import 'package:spnk/utils/common_strings.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.indigo,
  splashColor: const Color(0xFF002278),
  textTheme: TextTheme(
    displayLarge: const TextStyle(
      fontFamily: 'Zina',
      fontSize: 50,
      color: Color.fromRGBO(0, 34, 120, 1),
    ),
    displayMedium: TextStyle(
      fontFamily: kRajdhaniFontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 30,
      color: const Color.fromRGBO(0, 34, 120, 1),
    ),
    displaySmall: TextStyle(
      fontFamily: kRajdhaniFontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: const Color.fromRGBO(0, 34, 120, 1),
    ),
    headlineSmall: const TextStyle(
      fontFamily: 'Zina',
      fontSize: 50,
      color: Color.fromRGBO(0, 34, 120, 1),
    ),
    titleLarge: TextStyle(
      fontFamily: kRajdhaniFontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 35,
      color: const Color.fromRGBO(0, 34, 120, 1),
    ),
    bodyLarge: TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.bold,
      fontFamily: kRajdhaniFontFamily,
      color: const Color.fromRGBO(0, 34, 120, 1),
    ),
  ),
  scrollbarTheme: const ScrollbarThemeData().copyWith(
    thumbVisibility: const WidgetStatePropertyAll(false),
    thumbColor: WidgetStateProperty.all(Colors.cyan),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.indigo,
    textTheme: ButtonTextTheme.primary,
  ),
  scaffoldBackgroundColor: const Color.fromRGBO(239, 239, 239, 1),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color.fromRGBO(0, 34, 51, 1),
  splashColor: Colors.white,
  textTheme: TextTheme(
    displayLarge: const TextStyle(
      fontFamily: 'Zina',
      fontSize: 50,
      color: Colors.white,
    ),
    displayMedium: TextStyle(
      fontFamily: kRajdhaniFontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 30,
      color: Colors.white,
    ),
    displaySmall: TextStyle(
      fontFamily: kRajdhaniFontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.white,
    ),
    headlineSmall: const TextStyle(
      fontFamily: 'Zina',
      fontSize: 50,
      color: Colors.white,
    ),
    titleLarge: TextStyle(
      fontSize: 35,
      fontFamily: kRajdhaniFontFamily,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 21,
      fontFamily: kRajdhaniFontFamily,
    ),
  ),
  primarySwatch: Colors.cyan,
  scrollbarTheme: const ScrollbarThemeData().copyWith(
    thumbVisibility: const WidgetStatePropertyAll(false),
    thumbColor: WidgetStateProperty.all(Colors.cyan),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.red,
    textTheme: ButtonTextTheme.primary,
  ),
);
