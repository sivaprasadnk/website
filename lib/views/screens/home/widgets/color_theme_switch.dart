import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spnk/utils/theme_list.dart';
import 'package:spnk/views/bloc/theme_switch/theme_bloc.dart';
import 'package:spnk/views/bloc/theme_switch/theme_event.dart';
import 'package:spnk/views/bloc/theme_switch/theme_state.dart';

class ColorThemeSwitch extends StatelessWidget {
  const ColorThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return SizedBox(
          height: 65,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: lightColorList.length,
            itemBuilder: (context, index) {
              final lightColor = lightColorList[index];
              final darkColor = darkColorList[index];
              // var lightBColor = darkColorList[index];
              // var darkBgColor = darkColorList[index];

              return GestureDetector(
                onTap: () {
                  context.read<ThemeBloc>().add(UpdateColorTheme(index: index));
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 20,
                  width: 20,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: !state.isDarkTheme ? lightColor : darkColor,
                    border: Border.all(
                      width: 2,
                      color: !state.isDarkTheme ? darkColor : lightColor,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
