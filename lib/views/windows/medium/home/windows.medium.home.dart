import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/provider/route_provider.dart';
import 'package:spnk/views/provider/theme_provider.dart';
import 'package:spnk/views/windows/hover_extensions.dart';
import 'package:spnk/views/windows/medium/contactme/windows.medium.contactme.screen.dart';
import 'package:spnk/views/windows/medium/experience/windows.medium.experience.dart';
import 'package:spnk/views/windows/medium/home/windows.medium.home.screen.dart';
import 'package:spnk/views/windows/medium/home/windows.medium.menu.dart';
import 'package:spnk/views/windows/medium/projects/projects.medium.new.dart';

class WindowsMediumHome extends StatefulWidget {
  @override
  _WindowsMediumHomeState createState() => _WindowsMediumHomeState();
}

class _WindowsMediumHomeState extends State<WindowsMediumHome> {
  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }



  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    debugPrint('..@ screenWidth @ medium : $screenWidth');
    const double size = 15;

    return Scaffold(
      bottomNavigationBar: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 10),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WindowsLeftFooter(size: size),
            WindowsRightFooter(size: size)
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
                    onTap: () {
                      // _tabController.animateTo(
                      //   0,
                      //   duration: _duration,
                      // );
                    },
                    child: nameText(context: context).showCursorOnHover,
                  ),
                ),
                Consumer<ThemeNotifier>(
                  builder: (_, provider, __) {
                    return SizedBox(
                      height: 50,
                      width: 75,
                      child: GestureDetector(
                        onDoubleTap: () {},
                        child: DayNightSwitcher(
                          isDarkModeEnabled: provider.darkTheme,
                          onStateChanged: (isDarkModeEnabled) {
                            provider.toggleTheme();
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: Consumer<RouteProvider>(
        builder: (_, provider, __) {
          final screen = provider.selectedSCreen;

          return SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const WindowsMediumMenu(),
                if (screen == Screen.home)
                  WindowsMediumHomeScreen()
                else
                  screen == Screen.contactMe
                      ? const WindowsMediumContactMeScreen()
                      : screen == Screen.experience
                          ? WindowsMediumExperienceScreen()
                          : screen == Screen.projects
                              ? const ProjectsMediumNew()
                                  : const SizedBox.shrink()
              ],
            ),
          );
        },
      ),
    );
  }
}
