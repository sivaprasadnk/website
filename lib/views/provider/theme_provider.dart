import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends Notifier<bool> {


  void toggleTheme() {
    state = !state;
  }

  @override
  bool build() {
    return true;
  }
}

final themeNotifierProvider = NotifierProvider<ThemeNotifier, bool>(() {
  return ThemeNotifier();
});
