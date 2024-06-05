import 'package:get/get.dart';

class MenuController extends GetxController {
  final _menuSelected = false.obs;

  bool get menuSelected => _menuSelected.value;
  set menuSelected(bool value) {
    _menuSelected.value = value;
  }
}
