import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spnk/provider/quotes/quotes.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/windows/backup/contactme/windows.contactme.container.backup.dart';
import 'package:spnk/views/windows/backup/experience%20-%20backup/windows.experience.container.dart';
import 'package:spnk/views/windows/backup/home.backup/windows.home.container.dart';
import 'package:spnk/views/windows/backup/projects/windows.project.container.dart';
import 'package:spnk/views/windows/hover_extensions.dart';

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
  bool homeSelected = true,
      projectSelected = false,
      contactmeSelected = false,
      experienceSelected = false;

  double ballTopPosition = -250;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500)).then((value) {
      if (mounted)
        setState(() {
          // showSnowman = true;
          ballTopPosition = 0;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    debugPrint('..@ screenWidth : $screenWidth');
    // final themeProvider = Provider.of<DarkThemeProvider>(context);
    // var screen = Provider.of<RouteProvider>(context).screen.toString();

    return Scaffold(
      extendBodyBehindAppBar: true,
      // backgroundColor: Colors.white,
      backgroundColor: Color.fromRGBO(206, 45, 1, 1),
      appBar: PreferredSize(
        preferredSize: Size(screenWidth, 65),
        child: Stack(
          children: [
            Container(
              // color: Color.fromRGBO(7, 17, 26, 1),
              // color: Color.fromRGBO(206, 45, 1, 1),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (mounted)
                          setState(() {
                            homeSelected = true;
                            projectSelected = false;
                            contactmeSelected = false;
                            experienceSelected = false;
                          });
                      },
                      child:
                          nameText(textColor: Colors.white).showCursorOnHover,
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    InkWell(
                      onTap: () {
                        if (mounted)
                          setState(() {
                            homeSelected = true;
                            projectSelected = false;
                            contactmeSelected = false;
                            experienceSelected = false;
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
                        if (mounted)
                          setState(() {
                            homeSelected = false;
                            projectSelected = false;
                            contactmeSelected = false;
                            experienceSelected = true;
                          });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Experience',
                            style: TextStyle(
                              fontFamily: 'PatuaOne',
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          // For showing an underline on hover
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: experienceSelected,
                            child: Container(
                              height: 2,
                              width: 64,
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
                        if (mounted)
                          setState(() {
                            projectSelected = true;
                            homeSelected = false;
                            contactmeSelected = false;
                            experienceSelected = false;
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
                              width: 45,
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
                        if (mounted)
                          setState(() {
                            homeSelected = false;
                            projectSelected = false;
                            contactmeSelected = true;
                            experienceSelected = false;
                          });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Contact Me',
                            style: TextStyle(
                              fontFamily: 'PatuaOne',
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          // For showing an underline on hover
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: contactmeSelected,
                            child: Container(
                              height: 2,
                              width: 64,
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
            AnimatedPositioned(
              right: 365,
              top: ballTopPosition,
              duration: Duration(seconds: 2),
              child: Container(
                height: MediaQuery.of(context).size.width * 0.1,
                child: Lottie.network(
                    'https://assets2.lottiefiles.com/packages/lf20_a5P1NS.json'),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Align(
              child: CustomPaint(
                painter: WindowsHomeBgCurve(ctx: context),
                child: Container(),
              ),
            ),
          ),
          AnimatedPositioned(
            right: 365,
            top: ballTopPosition,
            duration: Duration(seconds: 2),
            child: Container(
              height: MediaQuery.of(context).size.width * 0.1,
              child: Lottie.network(
                  'https://assets2.lottiefiles.com/packages/lf20_a5P1NS.json'),
            ),
          ),
          if (homeSelected)
            WindowsHomeContainer(
                screenWidth: screenWidth, screenHeight: screenHeight),
          if (projectSelected)
            WindowsProjectContainer(
                screenWidth: screenWidth, screenHeight: screenHeight),
          if (contactmeSelected)
            WindowsContactMeContainer(
                screenWidth: screenWidth, screenHeight: screenHeight),
          if (experienceSelected)
            WindowsExperienceContainer(
                screenWidth: screenWidth, screenHeight: screenHeight),
        ],
      ),
    );
  }
}
