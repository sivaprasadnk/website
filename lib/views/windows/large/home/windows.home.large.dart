import 'package:flutter/material.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/windows/hover_extensions.dart';
import 'package:spnk/views/windows/large/contactme/windows.large.contactme.screen.dart';
import 'package:spnk/views/windows/large/experience/windows.large.experience.screen.dart';
import 'package:spnk/views/windows/large/home/windows.home.large.screen.dart';
import 'package:spnk/views/windows/large/projects/windows.large.projects.screen.dart';

class WindowsHomeLarge extends StatefulWidget {
  static const routeName = '/Home';

  @override
  _WindowsHomeLargeState createState() => _WindowsHomeLargeState();
}

class _WindowsHomeLargeState extends State<WindowsHomeLarge>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List _isHovering = [true, false, false];
  bool homeSelected = true,
      projectHovered = false,
      contactmeSelected = false,
      experienceSelected = false;

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    Future.delayed(Duration(milliseconds: 500)).then((value) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    // var screenHeight = screenSize.height;
    double size = 15;
    debugPrint('..@ screenWidth1 large: $screenWidth');
    debugPrint('..@ experienceSelected large: $experienceSelected');
    // final themeProvider = Provider.of<DarkThemeProvider>(context);
    // var screen = Provider.of<RouteProvider>(context).screen.toString();
    Duration _duration = Duration(seconds: 1);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        // backgroundColor: Colors.white,
        // backgroundColor: Color.fromRGBO(206, 45, 1, 1),
        backgroundColor: const Color.fromRGBO(0, 34, 51, 1),
        appBar: PreferredSize(
          preferredSize: Size(screenWidth, 65),
          child: Padding(
            padding: EdgeInsets.all(18) +
                EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: SizedBox(
              width: screenWidth,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _tabController.animateTo(
                          0,
                          duration: _duration,
                        );
                      },
                      child:
                          nameText(textColor: Colors.white).showCursorOnHover,
                    ),
                  ),
                  Expanded(
                    child: TabBar(
                      indicatorColor: Colors.red,
                      indicatorPadding: EdgeInsets.symmetric(horizontal: 25),
                      controller: _tabController,
                      tabs: [
                        InkWell(
                          // onHover: (bool status) {},
                          onTap: () {
                            _tabController.animateTo(
                              0,
                              duration: _duration,
                            );
                          },
                          child: Column(
                            children: [
                              Text(
                                'Home',
                                style: TextStyle(
                                    fontFamily: 'PatuaOne',
                                    color: Colors.white),
                              ),
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _tabController.animateTo(
                              1,
                              duration: _duration,
                            );
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Text(
                                  'Experience',
                                  style: TextStyle(
                                    fontFamily: 'PatuaOne',
                                    color: experienceSelected
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                                SizedBox(height: 5),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _tabController.animateTo(
                              2,
                              duration: _duration,
                            );
                          },
                          child: Column(
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
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _tabController.animateTo(
                              3,
                              duration: _duration,
                            );
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Stack(
            children: [
              TabBarView(
                controller: _tabController,
                children: [
                  WindowsHomeLargeScreen(),
                  WindowsLargeExperienceScreen(),
                  WindowsLargeProjectScreen(),
                  WindowsLargeContactMeScreen(),
                ],
              ),
              WindowsRightFooter(size: size),
              WindowsLeftFooter(size: size),
            ],
          ),
        ),
      ),
    );
  }
}
