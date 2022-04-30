// ignore_for_file: prefer_final_fields

import 'package:flutter/cupertino.dart';

class RouteProvider extends ChangeNotifier {
  String screenName = "Home";
  bool menuSelectedCheck = false;

  // RouteProvider({required this.screenName, required this.menuSelectedCheck});

  String get screen => screenName;

  bool get menuSelected => menuSelectedCheck;

  void setScreen({required String name}) {
    screenName = name;
    notifyListeners();
  }

  void setMenuSelected({required bool check}) {
    menuSelectedCheck = check;
    notifyListeners();
  }
}
