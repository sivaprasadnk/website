import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:provider/provider.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/utils/screen_type.dart';
import 'package:spnk/views/provider/menu_provider.dart';
import 'package:spnk/views/provider/route_provider.dart';
import 'package:spnk/views/windows/common/name_text.dart';
import 'package:spnk/views/windows/common/theme_switch.dart';
import 'package:spnk/views/windows/hover_extensions.dart';
import 'package:spnk/views/windows/small/contactme/windows.small.contactme.screen.dart';
import 'package:spnk/views/windows/small/experience/windows.small.experience.screen.dart';
import 'package:spnk/views/windows/small/home/windows.small.drawer.dart';
import 'package:spnk/views/windows/small/home/windows.small.home.screen.dart';
import 'package:spnk/views/windows/small/projects/projects.screen.small.dart';

class WindowsSmallHome extends ConsumerStatefulWidget {
  static const routeName = '/HomeSmall';

  @override
  _WindowsSmallHomeState createState() => _WindowsSmallHomeState();
}

class _WindowsSmallHomeState extends ConsumerState<WindowsSmallHome> {
  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  bool showProPic = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    const double size = 15;

    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    final screen = ref.watch(routeNotifierProvider);
    final menuSelectedCheck = ref.watch(menuNotifierProvider);
    debugPrint('..@ screenWidth @ small : $screenWidth');
    debugPrint('..@ screenHeight @ small : $screenHeight');
    debugPrint('..@ screen @ small :$screen');
    debugPrint('..@ menuSelectedCheck @ small :$menuSelectedCheck');
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WindowsRightFooter(size: size),
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size(screenWidth, 80),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                ref.read(menuNotifierProvider.notifier).menuSelected = false;
                ref.read(routeNotifierProvider.notifier).selectedScreen =
                    Screen.home;
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 36, top: 18),
                child: nameText(context: context).showCursorOnHover,
              ),
            ),
            const Spacer(),
            const ThemeSwitch(),
            const SizedBox(
              width: 20,
            ),
            if (!menuSelectedCheck)
              GestureDetector(
                onTap: () {
                  ref.read(menuNotifierProvider.notifier).menuSelected = true;
                  ref.read(routeNotifierProvider.notifier).selectedScreen =
                      Screen.home;
                },
                child: Icon(
                  Icons.menu,
                  color: Theme.of(context).splashColor,
                ).showCursorOnHover,
              )
            else
              GestureDetector(
                onTap: () {
                  ref.read(menuNotifierProvider.notifier).menuSelected = false;
                  ref.read(routeNotifierProvider.notifier).selectedScreen =
                      Screen.home;
                },
                child: Icon(
                  Icons.close,
                  color: Theme.of(context).splashColor,
                ).showCursorOnHover,
              ),
            const SizedBox(width: 10),
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
