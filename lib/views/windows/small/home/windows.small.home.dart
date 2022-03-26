import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/route_provider.dart';
import 'package:spnk/provider/theme_provider.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/windows/hover_extensions.dart';
import 'package:spnk/views/windows/small/contactme/windows.small.contactme.screen.dart';
import 'package:spnk/views/windows/small/experience/windows.small.experience.screen.dart';
import 'package:spnk/views/windows/small/home/windows.small.drawer.dart';
import 'package:spnk/views/windows/small/home/windows.small.home.screen.dart';
import 'package:spnk/views/windows/small/projects/windows.small.projects.screen.dart';

class WindowsSmallHome extends StatefulWidget {
  static const routeName = '/HomeSmall';

  @override
  _WindowsSmallHomeState createState() => _WindowsSmallHomeState();
}

class _WindowsSmallHomeState extends State<WindowsSmallHome> {
  bool homeSelected = true,
      projectSelected = false,
      contactmeSelected = false,
      menuSelected = false,
      experienceSelected = false;

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
    Future.delayed(Duration(seconds: 1)).then((value) {
      if (mounted)
        setState(() {
          showProPic = true;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    double size = 15;

    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;

    var screen = Provider.of<RouteProvider>(context).screen.toString();
    var menuSelectedCheck =
        Provider.of<RouteProvider>(context, listen: true).menuSelected;
    debugPrint('..@ screenWidth @ small : $screenWidth');
    debugPrint('..@ screenHeight @ small : $screenHeight');
    debugPrint('..@ screen @ small :$screen');
    debugPrint('..@ menuSelectedCheck @ small :$menuSelectedCheck');
    return Scaffold(
      extendBodyBehindAppBar: true,
      // backgroundColor: const Color.fromRGBO(0, 34, 51, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            // SizedBox(width: screenWidth * 0.1),
            GestureDetector(
              onTap: () {
                Provider.of<RouteProvider>(context, listen: false)
                    .setMenuSelected(check: false);
                Provider.of<RouteProvider>(context, listen: false)
                    .setScreen(name: 'Home');
              },
              child: nameText(context: context).showCursorOnHover,
            ),
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
            SizedBox(
              width: 20,
            ),
            if (!menuSelectedCheck)
              GestureDetector(
                onTap: () {
                  Provider.of<RouteProvider>(context, listen: false)
                      .setMenuSelected(check: true);
                  Provider.of<RouteProvider>(context, listen: false)
                      .setScreen(name: 'Home');
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
                      .setScreen(name: 'Home');
                },
                child: Icon(
                  Icons.close,
                  color: Theme.of(context).splashColor,
                ).showCursorOnHover,
              ),
            SizedBox(width: 10)
          ],
        ),
      ),
      body: Container(
          width: screenWidth,
          // padding: EdgeInsets.only(left: screenWidth * 0.1),
          child: Stack(
            children: [
              !menuSelectedCheck
                  ? screen == "Home"
                      ? WindowsSmallHomeScreen(showProPic: showProPic)
                      : screen == "ContactMe"
                          ? WindowsSmallContactMeScreen()
                          : screen == "MyProjects"
                              ? WindowsSmallProjectsScreen()
                              : screen == "Experience"
                                  ? WindowsSmallExperienceScreen()
                                  : SizedBox.shrink()
                  : WindowsSmallDrawer(),
              WindowsRightFooter(size: size),
              WindowsLeftFooter(size: size)
            ],
          )
          // : InvalidDisplayScreen(),
          ),
    );
  }
}
