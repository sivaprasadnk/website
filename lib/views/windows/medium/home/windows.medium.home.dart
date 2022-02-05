import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/route_provider.dart';
import 'package:spnk/utils/common_strings.dart';
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
  late Widget fbPng;
  late Widget waPng;
  late Widget instaPng;
  late Widget linkedInPng;
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
    double iconSize = 30;
    fbPng = Image.asset(fbPngAssetName, height: iconSize);
    waPng = Image.asset(whatsappPngeAssetName, height: iconSize);
    instaPng = Image.asset(instaPngImageName, height: iconSize);
    linkedInPng = Image.asset(linkedInAssetName,
        height: iconSize, color: Colors.blue[900]);
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    // var screenHeight = screenSize.height;

    debugPrint('..@ screenWidth @ medium : $screenWidth');
    var screen = Provider.of<RouteProvider>(context).screen.toString();
    double size = 15;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromRGBO(0, 34, 51, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(0, 34, 51, 1),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            nameText(textColor: Colors.white).showCursorOnHover,
            Spacer(),
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
