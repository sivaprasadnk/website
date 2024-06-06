import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spnk/utils/screen_type.dart';


class RouteNotifier extends Notifier<Screen> {
  @override
  Screen build() {
    return Screen.home;
  }

  Screen get selectedScreen => state;

  set selectedScreen(Screen name) {
    state = name;
  }
}

final routeNotifierProvider = NotifierProvider<RouteNotifier, Screen>(() {
  return RouteNotifier();
});


// // ignore_for_file: prefer_final_fields

// import 'package:flutter/cupertino.dart';


// class RouteProvider extends ChangeNotifier {
//   Screen _selectedScreen = Screen.home;
//   Screen get selectedSCreen => _selectedScreen;

//   bool menuSelectedCheck = false;

//   bool get menuSelected => menuSelectedCheck;

//   void setScreen({required Screen name}) {
//     _selectedScreen = name;
//     notifyListeners();
//   }

//   void setMenuSelected({required bool check}) {
//     menuSelectedCheck = check;
//     notifyListeners();
//   }
// }
