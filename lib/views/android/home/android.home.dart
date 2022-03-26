import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/route_provider.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/android/contactme/android.contactme.screen.dart';
import 'package:spnk/views/android/experience/android.experience.screen.dart';
import 'package:spnk/views/android/home/android.home.screen.dart';
import 'package:spnk/views/android/menu/android.menu.screen.dart';
import 'package:spnk/views/android/projects/android.projects.screen.dart';

class AndroidHome extends StatefulWidget {
  static const routeName = '/AndroidHome';
  const AndroidHome({Key? key}) : super(key: key);

  @override
  _AndroidHomeScreenState createState() => _AndroidHomeScreenState();
}

class _AndroidHomeScreenState extends State<AndroidHome> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double size = 15;

    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    var screen = Provider.of<RouteProvider>(context).screen.toString();
    var menuSelectedCheck =
        Provider.of<RouteProvider>(context, listen: true).menuSelected;
    debugPrint('.. @@screen => $screen ');
    debugPrint('.. @@menuSelectedCheck =>$menuSelectedCheck');
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(0, 34, 51, 1),
        body: Container(
          width: screenWidth,
          child: Stack(
            children: [
              if (!menuSelectedCheck && screen == "Home")
                Positioned.fill(
                  top: screenHeight * 0.05,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      'assets/images/dash/dash1.png',
                      height: 230,
                    ),
                    // child: Lottie.asset(
                    //   'assets/lotties/robot_hello.json',
                    //   height: 200,
                    // ),
                  ),
                ),
              menuSelectedCheck
                  ? AndroidMenuScreen()
                  : screen == "Home"
                      ? AndroidHomeScreen()
                      : screen == "MyProjects"
                          ? AndroidProjects(screenHeight: screenHeight)
                          : screen == "Experience"
                              ? AndroidExperienceScreen(
                                  screenHeight: screenHeight)
                              : AndroidContactMeScreen(
                                  screenHeight: screenHeight),
              if (menuSelectedCheck) AndroidRightFooter(size: size),
            ],
          ),
        ),
        // body: menuSelectedCheck
        //     ? AndroidMenuScreen()
        //     : screen == "Home"
        //         ? AndroidHomeScreen()
        //         : screen == "MyProjects"
        //             ? AndroidProjects(screenHeight: screenHeight)
        //             : screen == "Experience"
        //                 ? AndroidExperienceScreen(screenHeight: screenHeight)
        //                 : AndroidContactMeScreen(screenHeight: screenHeight),
      ),
    );
  }
}
