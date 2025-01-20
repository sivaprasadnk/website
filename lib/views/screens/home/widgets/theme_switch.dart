import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spnk/utils/extensions/context_extension.dart';
import 'package:spnk/utils/extensions/widget_extensions.dart';
import 'package:spnk/views/bloc/theme_switch/theme_bloc.dart';
import 'package:spnk/views/bloc/theme_switch/theme_event.dart';
import 'package:spnk/views/bloc/theme_switch/theme_state.dart';

class BrightnessSwitch extends StatelessWidget {
  const BrightnessSwitch({super.key});

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
              final isDarkTheme = state.themeData.brightness == Brightness.dark;
              context.read<ThemeBloc>().add(
                    UpdateTheme(
                      brightness:
                          isDarkTheme ? Brightness.light : Brightness.dark,
                      primaryColor: context.scaffoldColor,
                      bgColor: context.primaryColor,
                    ),
                  );
            },
            child: state.themeData.brightness != Brightness.dark
                ? Icon(
                    Icons.dark_mode,
                    color: context.primaryColor,
                  ).showCursorOnHover
                : Icon(
                    Icons.light_mode,
                    color: context.primaryColor,
                  ).showCursorOnHover,
          ),
        );
      },
    );
  }
}
