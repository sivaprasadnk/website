import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/route_provider.dart';
import 'package:spnk/provider/theme_provider.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/windows/hover_extensions.dart';
import 'package:spnk/views/windows/medium/contactme/windows.medium.contactme.screen.dart';
import 'package:spnk/views/windows/medium/experience/windows.medium.experience.dart';
import 'package:spnk/views/windows/medium/home/windows.medium.home.screen.dart';
import 'package:spnk/views/windows/medium/home/windows.medium.menu.dart';
import 'package:spnk/views/windows/medium/projects/windows.medium.projects.screen.dart';

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
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;

    debugPrint('..@ screenWidth @ medium : $screenWidth');
    var screen = Provider.of<RouteProvider>(context).screen.toString();
    double size = 15;

    return Scaffold(
      bottomNavigationBar: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 10),
        child: Row(
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
          padding: EdgeInsets.all(15) + EdgeInsets.only(left: 50),
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
                      child: DayNightSwitcher(
                        // nightBackgroundColor: Colors.black54,
                        // moonColor: Colors.black54,
                        isDarkModeEnabled: provider.darkTheme,
                        onStateChanged: (isDarkModeEnabled) {
                          provider.toggleTheme();
                          // setState(() {
                          //   // this.isDarkModeEnabled = isDarkModeEnabled;
                          // });
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: SizedBox(
        // height: screenSize.height * 0.9,
        child: Row(
          children: [
            WindowsMediumMenu(),
            screen == "Home"
                ? WindowsMediumHomeScreen()
                : screen == "ContactMe"
                    ? WindowsMediumContactMeScreen()
                    : screen == "Experience"
                        ? WindowsMediumExperienceScreen()
                        : screen == "MyProjects"
                            ? WindowsMediumProjectsScreen()
                            : Container()
          ],
        ),
      ),
    );
  }
}
