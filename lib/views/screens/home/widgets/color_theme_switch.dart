import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spnk/utils/common_colors.dart';
import 'package:spnk/utils/extensions/context_extension.dart';
import 'package:spnk/utils/theme_list.dart';
import 'package:spnk/views/bloc/theme_switch/theme_bloc.dart';
import 'package:spnk/views/bloc/theme_switch/theme_event.dart';
import 'package:spnk/views/bloc/theme_switch/theme_state.dart';
import 'package:spnk/views/screens/home/widgets/theme_switch.dart';

class ColorThemeIcon extends StatelessWidget {
  const ColorThemeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: context.scaffoldColor,
                  border: Border.all(
                    color: context.primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: BlocBuilder<ThemeBloc, ThemeState>(
                  builder: (context, state) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Select Theme',
                              style: TextStyle(
                                color: context.primaryColor,
                                // color: state.themeData.brightness ==
                                //         Brightness.light
                                //     ? context.primaryColor
                                //     : context.scaffoldColor,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(width: 75),
                            const ThemeSwitch(),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Text('Foreground Color'),
                        if (state.themeData.brightness == Brightness.dark)
                          const LightColorList()
                        else
                          const DarkColorList(),
                        const SizedBox(height: 12),
                        const Text('Background Color'),
                        if (state.themeData.brightness == Brightness.dark)
                          const DarkColorList()
                        else
                          const LightColorList(),
                      ],
                    );
                  },
                ),
              ),
            );
          },
        );
      },
      child: Icon(
        Icons.color_lens,
        color: context.primaryColor,
      ),
    );
  }
}

class LightColorList extends StatelessWidget {
  const LightColorList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return SizedBox(
          height: 35,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: lightColorList.length,
            itemBuilder: (context, index) {
              final color = lightColorList[index];
              final isDarkTheme = state.themeData.brightness == Brightness.dark;

              return GestureDetector(
                onTap: () {
                  try {
                    if (isDarkTheme) {
                      context.read<ThemeBloc>().add(
                            UpdateTheme(
                              brightness: state.themeData.brightness,
                              primaryColor: color,
                              bgColor: context.scaffoldColor,
                            ),
                          );
                    } else {
                      context.read<ThemeBloc>().add(
                            UpdateTheme(
                              brightness: state.themeData.brightness,
                              primaryColor: context.primaryColor,
                              bgColor: color,
                            ),
                          );
                    }
                  } catch (err) {
                    debugPrint('err $err');
                  }
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 20,
                  width: 20,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                    border: Border.all(
                      width: 2,
                      color: kGreyColor,
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

class DarkColorList extends StatelessWidget {
  const DarkColorList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return SizedBox(
          height: 35,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: darkColorList.length,
            itemBuilder: (context, index) {
              final color = darkColorList[index];
              final isDarkTheme = state.themeData.brightness == Brightness.dark;

              return GestureDetector(
                onTap: () {
                  try {
                    if (isDarkTheme) {
                      context.read<ThemeBloc>().add(
                            UpdateTheme(
                              brightness: state.themeData.brightness,
                              primaryColor: context.primaryColor,
                              bgColor: color,
                            ),
                          );
                    } else {
                      context.read<ThemeBloc>().add(
                            UpdateTheme(
                              brightness: state.themeData.brightness,
                              primaryColor: color,
                              bgColor: context.scaffoldColor,
                            ),
                          );
                    }
                  } catch (err) {
                    debugPrint('err $err');
                  }
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 20,
                  width: 20,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                    border: Border.all(
                      width: 2,
                      color: kWhiteColor,
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

class ColorThemeSwitch extends StatelessWidget {
  const ColorThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return SizedBox(
          height: 35,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: lightColorList.length,
            itemBuilder: (context, index) {
              final lightColor = lightColorList[index];
              final darkColor = darkColorList[index];
              final isDarkTheme = state.themeData.brightness == Brightness.dark;

              // var lightBColor = darkColorList[index];
              // var darkBgColor = darkColorList[index];

              return GestureDetector(
                onTap: () {
                  context.read<ThemeBloc>().add(
                        ToggleTheme(
                          isDarkTheme:
                              state.themeData.brightness == Brightness.dark,
                          currentTheme: state.themeData,
                        ),
                      );
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 20,
                  width: 20,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: !isDarkTheme ? lightColor : darkColor,
                    border: Border.all(
                      width: 2,
                      color: !isDarkTheme ? darkColor : lightColor,
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
