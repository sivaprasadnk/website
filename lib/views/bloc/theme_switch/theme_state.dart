import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:spnk/utils/string_constants.dart';
import 'package:spnk/utils/theme_list.dart';

class ThemeState extends Equatable {
  final bool isDarkTheme;
  final int themeIndex;
  ThemeState({
    bool? isDarkTheme,
    int? themeIndex,
  })  : isDarkTheme = isDarkTheme ?? _getInitialTheme(),
        themeIndex = themeIndex ?? 0;

  ThemeState copyWith({bool? isDark, int? index}) {
    return ThemeState(
      isDarkTheme: isDark ?? isDarkTheme,
      themeIndex: index ?? themeIndex,
    );
  }

  @override
  List<Object?> get props => [isDarkTheme, themeIndex];

  static bool _getInitialTheme() {
    final now = DateTime.now();
    return now.hour < 12;
  }

  ThemeData getTheme({required bool isDarkTheme, required int index}) {
    final darkColor = darkColorList[index];
    final lightColor = lightColorList[index];
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: !isDarkTheme ? lightColor : darkColor,
      ),
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      drawerTheme: DrawerThemeData(
        backgroundColor: !isDarkTheme ? lightColor : darkColor,
      ),
      primaryColor: isDarkTheme ? lightColor : darkColor,
      hoverColor: isDarkTheme ? lightColor : darkColor,
      scaffoldBackgroundColor: !isDarkTheme ? lightColor : darkColor,
      scrollbarTheme: const ScrollbarThemeData().copyWith(
        thumbVisibility: const WidgetStatePropertyAll(false),
        thumbColor: WidgetStateProperty.all(
          isDarkTheme ? lightColor : darkColor,
        ),
      ),
      shadowColor: !isDarkTheme
          ? darkColor.withOpacity(0.5)
          : lightColor.withOpacity(0.5),
      splashColor: const Color(0xFF002278),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.bold,
          fontFamily: kRajdhaniFontFamily,
          color: isDarkTheme ? lightColor : darkColor,
        ),
        bodyMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: kRajdhaniFontFamily,
          color: isDarkTheme ? lightColor : darkColor,
        ),
        bodySmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: kRajdhaniFontFamily,
          color: isDarkTheme ? lightColor : darkColor,
        ),
        displayLarge: TextStyle(
          fontSize: 50,
          fontFamily: 'Zina',
          color: isDarkTheme ? lightColor : darkColor,
        ),
        displayMedium: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontFamily: kRajdhaniFontFamily,
          color: isDarkTheme ? lightColor : darkColor,
        ),
        displaySmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: kRajdhaniFontFamily,
          color: isDarkTheme ? lightColor : darkColor,
        ),
        headlineSmall: TextStyle(
          fontSize: 50,
          fontFamily: 'Zina',
          color: isDarkTheme ? lightColor : darkColor,
        ),
        titleLarge: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          fontFamily: kRajdhaniFontFamily,
          color: isDarkTheme ? lightColor : darkColor,
        ),
      ),
    );
  }
}
