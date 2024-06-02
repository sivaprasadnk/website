import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:spnk/utils/common_strings.dart';

ThemeData light = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.indigo,
  splashColor: const Color(0xFF002278),
  textTheme: TextTheme(
    // caption: TextStyle(
    //   fontFamily: kFontFamily2,
    //   fontWeight: FontWeight.bold,
    //   fontSize: 30,
    //   color: const Color.fromRGBO(0, 34, 120, 1),
    // ),
    // headline1: const TextStyle(
    //   color: Colors.black,
    //   fontSize: 12,
    //   fontFamily: 'PatuaOne',
    // ),
    // headline2: TextStyle(
    //   fontFamily: kFontFamily2,
    //   color: const Color.fromRGBO(0, 34, 120, 1),
    //   fontWeight: FontWeight.bold,
    //   fontSize: 28.0,
    // ),
    displayLarge: const TextStyle(
      fontFamily: 'Zina',
      fontSize: 50,
      color: Color.fromRGBO(0, 34, 120, 1),
    ),
    displayMedium: TextStyle(
      fontFamily: kFontFamily2,
      fontWeight: FontWeight.bold,
      fontSize: 30,
      color: const Color.fromRGBO(0, 34, 120, 1),
    ),
    displaySmall: TextStyle(
      fontFamily: kFontFamily2,
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: const Color.fromRGBO(0, 34, 120, 1),
    ),
    // headline4: TextStyle(
    //   fontFamily: kFontFamily2,
    //   fontWeight: FontWeight.bold,
    //   fontSize: 15,
    //   color: const Color.fromRGBO(0, 34, 120, 1),
    // ),
    headlineSmall: const TextStyle(
      fontFamily: 'Zina',
      fontSize: 50,
      color: Color.fromRGBO(0, 34, 120, 1),
    ),
    titleLarge: TextStyle(
      fontFamily: kFontFamily2,
      fontWeight: FontWeight.bold,
      fontSize: 35,
      color: const Color.fromRGBO(0, 34, 120, 1),
    ),
    bodyLarge: TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.bold,
      fontFamily: kFontFamily2,
      color: const Color.fromRGBO(0, 34, 120, 1),
    ),
    // bodyText2: TextStyle(
    //   fontWeight: FontWeight.bold,
    //   fontFamily: kFontFamily2,
    //   fontSize: 18,
    //   color: const Color.fromRGBO(0, 34, 120, 1),
    // ),
    // subtitle1: TextStyle(
    //   fontWeight: FontWeight.bold,
    //   fontFamily: kFontFamily2,
    //   fontSize: 12,
    //   color: Color.fromRGBO(0, 34, 200, 1),
    // ),
    // subtitle1: const TextStyle(
    //   // fontFamily: 'PatuaOne',
    //   color: Color.fromRGBO(0, 34, 200, 1),
    //   fontWeight: FontWeight.bold,
    //   fontSize: 15.0,
    // ),
    // subtitle2: TextStyle(
    //   color: const Color.fromRGBO(0, 34, 120, 1),
    //   fontSize: 21,
    //   fontFamily: kFontFamily2,
    //   fontWeight: FontWeight.bold,
    // ),
  ),
  scrollbarTheme: const ScrollbarThemeData().copyWith(
    // isAlwaysShown: false,
    thumbVisibility: const WidgetStatePropertyAll(false),
    thumbColor: WidgetStateProperty.all(Colors.cyan),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.indigo,
    textTheme: ButtonTextTheme.primary,
  ),
  scaffoldBackgroundColor: const Color.fromRGBO(239, 239, 239, 1),
  // scaffoldBackgroundColor: Color.fromRGBO(202, 235, 242, 1)
  // scaffoldBackgroundColor: Color(0xfff1f1f1),
);

ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color.fromRGBO(0, 34, 51, 1),
  splashColor: Colors.white,
  textTheme: TextTheme(
    // subtitle1: const TextStyle(
    //   color: Colors.white,
    //   fontWeight: FontWeight.bold,
    //   fontSize: 15.0,
    // ),
    // caption: TextStyle(
    //   fontFamily: kFontFamily2,
    //   fontWeight: FontWeight.bold,
    //   fontSize: 30,
    //   color: Colors.white,
    // ),
    // headline1: const TextStyle(
    //   color: Colors.white,
    //   fontFamily: 'PatuaOne',
    //   fontSize: 12,
    // ),
    // headline2: TextStyle(
    //   fontFamily: kFontFamily2,
    //   // fontFamily: 'PatuaOne',
    //   color: Colors.white,
    //   fontWeight: FontWeight.bold,
    //   fontSize: 28.0,
    // ),
    displayLarge: const TextStyle(
      fontFamily: 'Zina',
      fontSize: 50,
      color: Colors.white,
    ),
    displayMedium: TextStyle(
      fontFamily: kFontFamily2,
      fontWeight: FontWeight.bold,
      fontSize: 30,
      color: Colors.white,
    ),
    displaySmall: TextStyle(
      fontFamily: kFontFamily2,
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.white,
    ),
    // headline4: TextStyle(
    //   fontFamily: kFontFamily2,
    //   fontWeight: FontWeight.bold,
    //   fontSize: 15,
    //   color: Colors.white,
    // ),
    headlineSmall: const TextStyle(
      fontFamily: 'Zina',
      // fontWeight: FontWeight.bold,
      fontSize: 50,
      color: Colors.white,
    ),
    // headline4: ,
    titleLarge: TextStyle(
      fontSize: 35,
      fontFamily: kFontFamily2,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 21,
      fontFamily: kFontFamily2,
    ),
    // bodyText2: TextStyle(
    //   fontWeight: FontWeight.bold,
    //   fontFamily: kFontFamily2,
    //   fontSize: 18,
    //   color: Colors.white,
    // ),
    // subtitle2: TextStyle(
    //   color: Colors.white,
    //   fontSize: 21,
    //   fontFamily: kFontFamily2,
    //   fontWeight: FontWeight.bold,
    // ),
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

class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";
  // SharedPreferences? prefs;
  late bool _darkTheme;

  bool get darkTheme => _darkTheme; //Getter

  ThemeNotifier() {
    _darkTheme = true;
    loadFromPrefs();
  }

  void toggleTheme() {
    _darkTheme = !_darkTheme;
    saveToPrefs();
    notifyListeners();
  }

  Future<void> loadFromPrefs() async {
    // prefs = await SharedPreferences.getInstance();
    _darkTheme = false;
    notifyListeners();
  }

  Future<void> saveToPrefs() async {
    // prefs = await SharedPreferences.getInstance();
    // prefs!.setBool(key, darkTheme);
  }
}
