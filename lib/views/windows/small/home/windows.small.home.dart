import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/dialog_provider.dart';
import 'package:spnk/provider/route_provider.dart';
import 'package:spnk/provider/theme_provider.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/windows/hover_extensions.dart';
import 'package:spnk/views/windows/small/contactme/windows.small.contactme.screen.dart';
import 'package:spnk/views/windows/small/experience/windows.small.experience.screen.dart';
import 'package:spnk/views/windows/small/home/windows.small.drawer.dart';
import 'package:spnk/views/windows/small/home/windows.small.home.screen.dart';
import 'package:spnk/views/windows/small/projects/projects.screen.small.dart';

class WindowsSmallHome extends StatefulWidget {
  static const routeName = '/HomeSmall';

  @override
  _WindowsSmallHomeState createState() => _WindowsSmallHomeState();
}

class _WindowsSmallHomeState extends State<WindowsSmallHome> {
  

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  bool showProPic = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then((value) {
      debugPrint('.. @@ small init state');
      final status =
          Provider.of<DialogProvider>(context, listen: false).dialogIsOpen;
      debugPrint('.. @@ small init state status : $status');

      if (status) {
        Provider.of<DialogProvider>(context, listen: false)
            .updateDialogOpenStatus(status: false);
        Navigator.of(context).pop();
      } else {}
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    const double size = 15;

    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    final screen = Provider.of<RouteProvider>(context).selectedSCreen;
    final menuSelectedCheck =
        Provider.of<RouteProvider>(context, listen: true).menuSelected;
    debugPrint('..@ screenWidth @ small : $screenWidth');
    debugPrint('..@ screenHeight @ small : $screenHeight');
    debugPrint('..@ screen @ small :$screen');
    debugPrint('..@ menuSelectedCheck @ small :$menuSelectedCheck');
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [WindowsRightFooter(size: size)],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size(screenWidth, 80),

        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Provider.of<RouteProvider>(context, listen: false)
                    .setMenuSelected(check: false);
                Provider.of<RouteProvider>(context, listen: false)
                    .setScreen(name: Screen.home);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 36, top: 18),
                child: nameText(context: context).showCursorOnHover,
              ),
            ),
            const Spacer(),
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
            const SizedBox(
              width: 20,
            ),
            if (!menuSelectedCheck)
              GestureDetector(
                onTap: () {
                  Provider.of<RouteProvider>(context, listen: false)
                      .setMenuSelected(check: true);
                  Provider.of<RouteProvider>(context, listen: false)
                      .setScreen(name:Screen.home);
                },
                child: Icon(
                  Icons.menu,
                  color: Theme.of(context).splashColor,
                ).showCursorOnHover,
              )
            else
              GestureDetector(
                onTap: () {
                  Provider.of<RouteProvider>(context, listen: false)
                      .setMenuSelected(check: false);
                  Provider.of<RouteProvider>(context, listen: false)
                      .setScreen(name: Screen.home);
                },
                child: Icon(
                  Icons.close,
                  color: Theme.of(context).splashColor,
                ).showCursorOnHover,
              ),
            const SizedBox(width: 10)
          ],
        ),
      ),
      body: SizedBox(
        width: screenWidth,
        child: Stack(
          children: [
            if (!menuSelectedCheck)
              screen == Screen.home
                  ? WindowsSmallHomeScreen(showProPic: showProPic)
                  : screen == Screen.contactMe
                      ? WindowsSmallContactMeScreen()
                      : screen == Screen.projects
                          ? const ProjectsScreenSmall()
                          : screen == Screen.experience
                              ? WindowsSmallExperienceScreen()
                              : const SizedBox.shrink()
            else
              WindowsSmallDrawer(),
          ],
        ),
      ),
    );
  }
}
