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
            padding: EdgeInsets.all(18),
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
                            // if (mounted)
                            //   setState(() {
                            //     homeSelected = true;
                            //     projectHovered = false;
                            //     contactmeSelected = false;
                            //     experienceSelected = false;
                            //   });
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
                          // hoverColor: Colors.cyanAccent,
                          // // highlightColor: Colors.cyan,
                          // onHover: (bool status) {
                          //   setState(() {
                          //     experienceSelected = status;
                          //   });
                          // },
                          onTap: () {
                            _tabController.animateTo(
                              1,
                              duration: _duration,
                            );
                            // if (mounted)
                            //   setState(() {
                            //     homeSelected = false;
                            //     projectHovered = false;
                            //     contactmeSelected = false;
                            //     experienceSelected = true;
                            //   });
                          },
                          child: Container(
                            // decoration: BoxDecoration(
                            //   color: experienceSelected
                            //       ? Colors.cyanAccent
                            //       : Colors.transparent,
                            // ),
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
                          // child: Column(
                          //   mainAxisSize: MainAxisSize.min,
                          //   children: [
                          //     Text(
                          //       'Experience',
                          //       style: TextStyle(
                          //         fontFamily: 'PatuaOne',
                          //         color: Colors.white,
                          //       ),
                          //     ),
                          //     SizedBox(height: 5),
                          //     // For showing an underline on hover
                          //     Visibility(
                          //       maintainAnimation: true,
                          //       maintainState: true,
                          //       maintainSize: true,
                          //       visible: experienceSelected,
                          //       child: Container(
                          //         height: 2,
                          //         width: 64,
                          //         color: Colors.white,
                          //       ),
                          //     )
                          //   ],
                          // ),
                        ),
                        InkWell(
                          onTap: () {
                            _tabController.animateTo(
                              2,
                              duration: _duration,
                            );
                            // if (mounted)
                            //   setState(() {
                            //     projectHovered = true;
                            //     homeSelected = false;
                            //     contactmeSelected = false;
                            //     experienceSelected = false;
                            //   });
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
                            // if (mounted)
                            //   setState(() {
                            //     homeSelected = false;
                            //     projectHovered = false;
                            //     contactmeSelected = true;
                            //     experienceSelected = false;
                            //   });
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
        body: Stack(
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
          ],
        ),
      ),
    );
  }
}
