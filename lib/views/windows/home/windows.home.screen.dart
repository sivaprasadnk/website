import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:spnk/provider/quotes/quotes.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/windows/home/windows.home.container.dart';
import 'package:spnk/views/windows/projects/windows.project.container.dart';

class WindowsHomeScreen extends StatefulWidget {
  static const routeName = '/Home';
  const WindowsHomeScreen({Key? key}) : super(key: key);

  @override
  _WindowsHomeScreenState createState() => _WindowsHomeScreenState();
}

class _WindowsHomeScreenState extends State<WindowsHomeScreen> {
  bool isDarkModeEnabled = false;
  // DateTime time = DateTime.now();
  List _isHovering = [true, false, false];
  Quotes? item;
  bool homeSelected = true, projectSelected = false, contactmeSelected = false;
  late Widget fbPng;
  late Widget waPng;
  late Widget instaPng;
  late Widget linkedInPng;
  late bool showImage;
  late bool showQuote = false;
  double iconSize = 30;
  bool quoteLoaded = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    // final themeProvider = Provider.of<DarkThemeProvider>(context);
    // var screen = Provider.of<RouteProvider>(context).screen.toString();

    return Scaffold(
      backgroundColor: Color.fromRGBO(7, 17, 26, 1),
      appBar: PreferredSize(
        preferredSize: Size(screenWidth, 65),
        child: Container(
          color: Color.fromRGBO(7, 17, 26, 1),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        homeSelected = true;
                        projectSelected = false;
                      });
                    },
                    child: nameText(textColor: Colors.white),
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      homeSelected = true;
                      projectSelected = false;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Home',
                        style: TextStyle(
                          fontFamily: 'PatuaOne',
                          color: _isHovering[0]
                              ? Colors.blue.shade200
                              : Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      // For showing an underline on hover
                      Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: homeSelected,
                        child: Container(
                          height: 2,
                          width: 40,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: screenWidth / 50,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      projectSelected = true;
                      homeSelected = false;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Projects',
                        style: TextStyle(
                          fontFamily: 'PatuaOne',
                          color: _isHovering[1]
                              ? Colors.blue.shade200
                              : Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      // For showing an underline on hover
                      Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: projectSelected,
                        child: Container(
                          height: 2,
                          width: 40,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: screenWidth / 50,
                ),
              ],
            ),
          ),
        ),
      ),
      body: (homeSelected)
          ? WindowsHomeContainer(
              screenWidth: screenWidth, screenHeight: screenHeight)
          : projectSelected
              ? WindowsProjectContainer(
                  screenWidth: screenWidth, screenHeight: screenHeight)
              : Container(),
    );
  }

  @override
  void initState() {
    super.initState();
    showImage = false;
    fbPng = Image.asset(fbPngAssetName, height: iconSize);
    waPng = Image.asset(whatsappPngeAssetName, height: iconSize);
    instaPng = Image.asset(instaPngImageName, height: iconSize);
    linkedInPng = Image.asset(linkedInAssetName,
        height: iconSize, color: Colors.blue[900]);
  }
}
