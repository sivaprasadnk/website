import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuNotifier extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  bool get menuSelected => state;

  set menuSelected(bool value) {
    state = value;
  }
}

final menuNotifierProvider = NotifierProvider<MenuNotifier, bool>(() {
  return MenuNotifier();
});
