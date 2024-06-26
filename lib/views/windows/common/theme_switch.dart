import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spnk/views/bloc/theme_switch/theme_bloc.dart';
import 'package:spnk/views/bloc/theme_switch/theme_event.dart';
import 'package:spnk/views/bloc/theme_switch/theme_state.dart';
import 'package:spnk/views/windows/hover_extensions.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return SizedBox(
          height: 50,
          width: 75,
          child: GestureDetector(
            onDoubleTap: () {},
            onTap: () {
              context.read<ThemeBloc>().add(ToggleTheme());
            },
            child: !state.isDarkTheme
                ? const Icon(Icons.dark_mode)
                : const Icon(Icons.light_mode),
            // child: DayNightSwitcher(
            //   isDarkModeEnabled: state.isDarkTheme,
            //   onStateChanged: (isDarkModeEnabled) {
            //     context.read<ThemeBloc>().add(ToggleTheme());
            //   },
            // ),
          ),
        );
      },
    ).showCursorOnHover;
  }
}
