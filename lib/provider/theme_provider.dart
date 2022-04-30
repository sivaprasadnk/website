import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData light = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.indigo,
  splashColor: const Color.fromRGBO(0, 34, 120, 1),
  textTheme: const TextTheme(
    caption: TextStyle(
      fontFamily: 'PlayfairDisplay',
      fontWeight: FontWeight.bold,
      fontSize: 30,
      // color: Colors.teal,
      color: Color.fromRGBO(0, 34, 120, 1),
    ),
    headline1: TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontFamily: 'PatuaOne',
    ),
    headline2: TextStyle(
      fontFamily: 'PlayfairDisplay',
      color: Color.fromRGBO(0, 34, 120, 1),
      fontWeight: FontWeight.bold,
      fontSize: 28.0,
    ),
    headline3: TextStyle(
      fontFamily: 'PlayfairDisplay',
      fontWeight: FontWeight.bold,
      fontSize: 30,
      color: Color.fromRGBO(0, 34, 120, 1),
    ),
    headline4: TextStyle(
      fontFamily: 'PlayfairDisplay',
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: Color.fromRGBO(0, 34, 120, 1),
    ),
    headline6: TextStyle(
      fontFamily: 'PlayfairDisplay',
      fontWeight: FontWeight.bold,
      fontSize: 35,
      color: Color.fromRGBO(0, 34, 120, 1),
    ),
    bodyText1: TextStyle(
      fontWeight: FontWeight.bold,
      color: Color.fromRGBO(0, 34, 120, 1),
    ),
    bodyText2: TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'PlayfairDisplay',
      fontSize: 13,
      color: Color.fromRGBO(0, 34, 120, 1),
    ),
    // subtitle1: TextStyle(
    //   fontWeight: FontWeight.bold,
    //   fontFamily: 'PlayfairDisplay',
    //   fontSize: 12,
    //   color: Color.fromRGBO(0, 34, 200, 1),
    // ),
    subtitle1: TextStyle(
      // fontFamily: 'PatuaOne',
      color: Color.fromRGBO(0, 34, 200, 1),
      fontWeight: FontWeight.bold,
      fontSize: 15.0,
    ),
    subtitle2: TextStyle(
      color: Color.fromRGBO(0, 34, 120, 1),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  scrollbarTheme: const ScrollbarThemeData().copyWith(
    isAlwaysShown: false,
    thumbColor: MaterialStateProperty.all(Colors.cyan),
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
  scaffoldBackgroundColor: const Color.fromRGBO(0, 34, 51, 1),
  splashColor: Colors.white,
  textTheme: const TextTheme(
    subtitle1: TextStyle(
      // fontFamily: 'PatuaOne',
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 15.0,
    ),
    caption: TextStyle(
      fontFamily: 'PlayfairDisplay',
      fontWeight: FontWeight.bold,
      fontSize: 30,
      color: Colors.white,
    ),
    headline1: TextStyle(
      color: Colors.white,
      fontFamily: 'PatuaOne',
      fontSize: 12,
    ),
    headline2: TextStyle(
      fontFamily: 'PlayfairDisplay',
      // fontFamily: 'PatuaOne',
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 28.0,
    ),
    headline3: TextStyle(
      fontSize: 30,
      fontFamily: 'PlayfairDisplay',
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline4: TextStyle(
      fontFamily: 'PlayfairDisplay',
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: Colors.white,
    ),
    // headline4: ,
    headline6: TextStyle(
      fontSize: 35,
      fontFamily: 'PlayfairDisplay',
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyText1: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyText2: TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'PlayfairDisplay',
      fontSize: 15,
      color: Colors.white,
    ),
    subtitle2: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  primarySwatch: Colors.cyan,
  scrollbarTheme: const ScrollbarThemeData().copyWith(
    isAlwaysShown: false,
    thumbColor: MaterialStateProperty.all(Colors.cyan),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.red,
    textTheme: ButtonTextTheme.primary,
  ),
);

class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";
  SharedPreferences? prefs;
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
    prefs = await SharedPreferences.getInstance();
    _darkTheme = prefs!.getBool(key) ?? true;
    notifyListeners();
  }

  Future<void> saveToPrefs() async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setBool(key, darkTheme);
  }
}
