// ignore_for_file: prefer_final_fields

import 'package:flutter/cupertino.dart';

enum Screen { home, contactMe, projects, experience, family }

class RouteProvider extends ChangeNotifier {
  Screen _selectedScreen = Screen.home;
  Screen get selectedSCreen => _selectedScreen;

  bool menuSelectedCheck = false;

  bool get menuSelected => menuSelectedCheck;

  void setScreen({required Screen name}) {
    _selectedScreen = name;
    notifyListeners();
  }

  void setMenuSelected({required bool check}) {
    menuSelectedCheck = check;
    notifyListeners();
  }
}
