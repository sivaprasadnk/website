
import 'package:flutter/material.dart';
import 'package:spnk/utils/common_colors.dart';
import 'package:spnk/utils/common_strings.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.indigo,
  splashColor: const Color(0xFF002278),
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Zina',
      fontSize: 50,
      color: kPrimaryBlueColor,
    ),
    displayMedium: TextStyle(
      fontFamily: kRajdhaniFontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 30,
      color: kPrimaryBlueColor,
    ),
    displaySmall: TextStyle(
      fontFamily: kRajdhaniFontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: kPrimaryBlueColor,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'Zina',
      fontSize: 50,
      color: kPrimaryBlueColor,
    ),
    titleLarge: TextStyle(
      fontFamily: kRajdhaniFontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 35,
      color: kPrimaryBlueColor,
    ),
    bodyLarge: TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.bold,
      fontFamily: kRajdhaniFontFamily,
      color: kPrimaryBlueColor,
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
  splashColor: kWhiteColor,
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Zina',
      fontSize: 50,
      color: kWhiteColor,
    ),
    displayMedium: TextStyle(
      fontFamily: kRajdhaniFontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 30,
      color: kWhiteColor,
    ),
    displaySmall: TextStyle(
      fontFamily: kRajdhaniFontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: kWhiteColor,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'Zina',
      fontSize: 50,
      color: kWhiteColor,
    ),
    titleLarge: TextStyle(
      fontSize: 35,
      fontFamily: kRajdhaniFontFamily,
      fontWeight: FontWeight.bold,
      color: kWhiteColor,
    ),
    bodyLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: kWhiteColor,
      fontSize: 21,
      fontFamily: kRajdhaniFontFamily,
    ),
  ),
  primarySwatch: kMaterialCyanColor,
  scrollbarTheme: const ScrollbarThemeData().copyWith(
    thumbVisibility: const WidgetStatePropertyAll(false),
    thumbColor: WidgetStateProperty.all(kCyanColor),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.red,
    textTheme: ButtonTextTheme.primary,
  ),
);
