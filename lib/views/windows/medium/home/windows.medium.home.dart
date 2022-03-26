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

  bool homeSelected = true,
      projectSelected = false,
      contactmeSelected = false,
      menuSelected = false,
      experienceSelected = false;

  bool showProPic = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1)).then((value) {
      if (mounted)
        setState(() {
          showProPic = true;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;

    debugPrint('..@ screenWidth @ medium : $screenWidth');
    var screen = Provider.of<RouteProvider>(context).screen.toString();
    double size = 15;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            nameText(context: context).showCursorOnHover,
            Spacer(),
            Consumer<ThemeNotifier>(
              builder: (_, themeNotifier, __) => SizedBox(
                height: 50,
                width: 50,
                child: Switch(
                  onChanged: (val) {
                    themeNotifier.toggleTheme();
                  },
                  value: themeNotifier.darkTheme,
                ),
              ),
            ),
            SizedBox(width: 20)
          ],
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            Row(
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
            WindowsRightFooter(size: size),
            WindowsLeftFooter(size: size)
          ],
        ),
      ),
    );
  }
}
