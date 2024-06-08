import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/utils/screen_type.dart';
import 'package:spnk/views/bloc/screen_details/screen_bloc.dart';
import 'package:spnk/views/windows/common/name_text.dart';
import 'package:spnk/views/windows/common/theme_switch.dart';
import 'package:spnk/views/windows/hover_extensions.dart';
import 'package:spnk/views/windows/medium/contactme/windows.medium.contactme.screen.dart';
import 'package:spnk/views/windows/medium/experience/windows.medium.experience.dart';
import 'package:spnk/views/windows/medium/home/windows.medium.home.screen.dart';
import 'package:spnk/views/windows/medium/home/windows.medium.menu.dart';
import 'package:spnk/views/windows/medium/projects/projects.medium.new.dart';

class WindowsMediumHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screen = context.read<ScreenBloc>().state.selectedScreen;
    const double size = 15;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 10),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WindowsLeftFooter(size: size),
            WindowsRightFooter(size: size),
          ],
        ),
      ),
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenWidth, 100),
        child: Padding(
          padding: const EdgeInsets.all(16) +
              const EdgeInsets.only(left: 20, right: 20),
          child: SizedBox(
            width: screenWidth,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: nameText(context: context).showCursorOnHover,
                  ),
                ),
                const ThemeSwitch(),
              ],
            ),
          ),
        ),
      ),
      body: SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WindowsMediumMenu(),
            if (screen == Screen.home)
              WindowsMediumHomeScreen()
            else
              screen == Screen.contactMe
                  ? const WindowsMediumContactMeScreen()
                  : screen == Screen.experience
                      ? WindowsMediumExperienceScreen()
                      : screen == Screen.projects
                          ? ProjectsMediumNew()
                          : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
