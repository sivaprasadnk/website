import 'package:flutter/cupertino.dart';

class RouteProvider extends ChangeNotifier {
  String? screenName;
  bool? menuSelectedCheck;

  RouteProvider({this.screenName, this.menuSelectedCheck});

  // RouteProvider _screen = RouteProvider();

  String? get screen => screenName ?? "Home";

  bool? get menuSelected => menuSelectedCheck ?? false;

  setScreen({required String name}) {
    screenName = name;
    notifyListeners();
  }

  setMenuSelected({required bool check}) {
    menuSelectedCheck = check;
    notifyListeners();
  }
}
