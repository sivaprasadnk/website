import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/route_provider.dart';
import 'package:spnk/views/android/backup/contact_me/android.contactme.screen.dart';
import 'package:spnk/views/android/backup/experience/android.experience.screen.dart';
import 'package:spnk/views/android/backup/projects/android.projects.screen.dart';
import 'package:spnk/views/android/home/android.home.screen.dart';
import 'package:spnk/views/android/menu/android.menu.screen.dart';

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

    // var screenWidth = screenSize.width;
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
        body: menuSelectedCheck
            ? AndroidMenuScreen()
            : screen == "Home"
                ? AndroidHomeScreen()
                : screen == "MyProjects"
                    ? AndroidProjects(screenHeight: screenHeight)
                    : screen == "Experience"
                        ? AndroidExperienceScreen(screenHeight: screenHeight)
                        : AndroidContactMeScreen(screenHeight: screenHeight),
      ),
    );
  }
}
