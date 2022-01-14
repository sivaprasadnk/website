import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/route_provider.dart';
import 'package:spnk/utils/common_strings.dart';
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
  late Widget fbPng;
  late Widget waPng;
  late Widget instaPng;
  late Widget linkedInPng;
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
    double iconSize = 30;
    fbPng = Image.asset(fbPngAssetName, height: iconSize);
    waPng = Image.asset(whatsappPngeAssetName, height: iconSize);
    instaPng = Image.asset(instaPngImageName, height: iconSize);
    linkedInPng = Image.asset(linkedInAssetName,
        height: iconSize, color: Colors.blue[900]);
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;

    var screen = Provider.of<RouteProvider>(context).screen.toString();
    var menuSelectedCheck =
        Provider.of<RouteProvider>(context, listen: true).menuSelected as bool;
    debugPrint('..@ screenWidth @ small : $screenWidth');
    debugPrint('..@ screen @ small :$screen');
    debugPrint('..@ menuSelectedCheck @ small :$menuSelectedCheck');
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromRGBO(0, 34, 51, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(0, 34, 51, 1),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            nameText(textColor: Colors.white),
            Spacer(),
            if (!menuSelectedCheck)
              GestureDetector(
                onTap: () {
                  Provider.of<RouteProvider>(context, listen: false)
                      .setMenuSelected(check: true);
                  Provider.of<RouteProvider>(context, listen: false)
                      .setScreen(name: 'Home');
                },
                child: Icon(Icons.menu).showCursorOnHover,
              ),
            SizedBox(width: 10)
          ],
        ),
      ),
      body: !menuSelectedCheck
          ? screen == "Home"
              ? WindowsSmallHomeScreen(showProPic: showProPic)
              : screen == "ContactMe"
                  ? WindowsSmallContactMeScreen()
                  : screen == "MyProjects"
                      ? WindowsSmallProjectsScreen()
                      : screen == "Experience"
                          ? WindowsSmallExperienceScreen()
                          : Container()
          : WindowsSmallDrawer(),
    );
  }
}
