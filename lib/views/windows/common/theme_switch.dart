import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:spnk/views/provider/theme_provider.dart';
import 'package:spnk/views/windows/hover_extensions.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkTheme = ref.watch(themeNotifierProvider);
    return SizedBox(
      height: 50,
      width: 75,
      child: GestureDetector(
        onDoubleTap: () {},
        child: DayNightSwitcher(
          isDarkModeEnabled: darkTheme,
          onStateChanged: (isDarkModeEnabled) {
            ref.read(themeNotifierProvider.notifier).toggleTheme();
          },
        ),
      ),
    ).showCursorOnHover;
  }
}
