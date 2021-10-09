import 'package:flutter/material.dart';

class DarkThemeProvider with ChangeNotifier {
  // SharedData darkThemePreference = SharedData();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    // darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}
