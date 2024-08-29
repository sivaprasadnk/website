import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spnk/utils/extensions/widget_extensions.dart';
import 'package:spnk/views/bloc/theme_switch/theme_bloc.dart';
import 'package:spnk/views/bloc/theme_switch/theme_event.dart';
import 'package:spnk/views/bloc/theme_switch/theme_state.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

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
                ? Icon(
                    Icons.dark_mode,
                    color: Theme.of(context).primaryColor,
                  )
                : Icon(
                    Icons.light_mode,
                    color: Theme.of(context).primaryColor,
                  ),
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
