import 'package:get/get.dart';
import 'package:spnk/utils/screen_type.dart';

class RouteController extends GetxController {
  Rx<Screen> selectedScreen = Screen.home.obs;
  // Screen get selectedScreen => Screen.home.obs;

  void updateScreen(Screen newVaue) {
    selectedScreen.value = newVaue;
  }
  // set selectedScreen(Screen name) {
  //   selectedScreen = name;
  // }
}



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
