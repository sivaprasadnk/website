
import 'package:flutter/material.dart';
import 'package:spnk/utils/common_colors.dart';
import 'package:spnk/utils/common_strings.dart';


ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromRGBO(239, 239, 239, 1),
  ),
  brightness: Brightness.light,
  buttonTheme: ButtonThemeData(
    buttonColor: kPrimaryBlueColor,
    textTheme: ButtonTextTheme.primary,
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: Color.fromRGBO(239, 239, 239, 1),
  ),
  primaryColor: kPrimaryBlueColor,
  primarySwatch: Colors.indigo,
  scaffoldBackgroundColor: const Color.fromRGBO(239, 239, 239, 1),
  scrollbarTheme: const ScrollbarThemeData().copyWith(
    thumbVisibility: const WidgetStatePropertyAll(false),
    thumbColor: WidgetStateProperty.all(Colors.cyan),
  ),
  shadowColor: Colors.black.withOpacity(0.2),
  splashColor: const Color(0xFF002278),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.bold,
      fontFamily: kRajdhaniFontFamily,
      color: kPrimaryBlueColor,
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.bold,
      color: kPrimaryBlueColor,
      fontSize: 18,
      fontFamily: kRajdhaniFontFamily,
    ),
    bodySmall: TextStyle(
      fontFamily: kRajdhaniFontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: kPrimaryBlueColor,
    ),
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
  ),
);

ThemeData darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromRGBO(0, 34, 51, 1),
  ),
  brightness: Brightness.dark,
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.red,
    textTheme: ButtonTextTheme.primary,
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: Color.fromRGBO(0, 34, 51, 1),
  ),
  primaryColor: const Color.fromRGBO(239, 239, 239, 1),
  primarySwatch: kMaterialCyanColor,
  scaffoldBackgroundColor: const Color.fromRGBO(0, 34, 51, 1),
  scrollbarTheme: const ScrollbarThemeData().copyWith(
    thumbVisibility: const WidgetStatePropertyAll(false),
    thumbColor: WidgetStateProperty.all(kCyanColor),
  ),
  shadowColor: Colors.cyan.withOpacity(0.2),
  splashColor: kWhiteColor,
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: kWhiteColor,
      fontSize: 21,
      fontFamily: kRajdhaniFontFamily,
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.bold,
      color: kWhiteColor,
      fontSize: 18,
      fontFamily: kRajdhaniFontFamily,
    ),
    bodySmall: TextStyle(
      fontFamily: kRajdhaniFontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: kWhiteColor,
    ),
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
  ),
);
