import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/android/contactme/android.contactme.screen.dart';
import 'package:spnk/views/android/experience/android.experience.screen.dart';
import 'package:spnk/views/android/home/android.home.screen.dart';
import 'package:spnk/views/android/menu/android.menu.screen.dart';
import 'package:spnk/views/android/projects/android.projects.screen.dart';
import 'package:spnk/views/provider/menu_provider.dart';
import 'package:spnk/views/provider/route_provider.dart';

class AndroidHome extends ConsumerWidget {
  static const routeName = '/AndroidHome';
  const AndroidHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;
    const double size = 15;

    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    // final screen = Provider.of<RouteProvider>(context).selectedSCreen;
    final screen = ref.watch(routeNotifierProvider);
    // final menuSelectedCheck = Provider.of<RouteProvider>(context).menuSelected;
    final menuSelectedCheck = ref.watch(menuNotifierProvider);
    debugPrint('.. @@screen => $screen ');
    debugPrint('.. @@menuSelectedCheck =>$menuSelectedCheck');
    return PopScope(
      canPop: false,
      // onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(0, 34, 51, 1),
        body: SizedBox(
          width: screenWidth,
          child: Stack(
            children: [
              if (!menuSelectedCheck && screen == Screen.home)
                Positioned.fill(
                  top: screenHeight * 0.05,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      'assets/images/dash/dash1.png',
                      height: 230,
                    ),
                  ),
                ),
              if (menuSelectedCheck)
                const AndroidMenuScreen()
              else
                screen == Screen.home
                    ? AndroidHomeScreen()
                    : screen == Screen.projects
                        ? const AndroidProjects()
                        : screen == Screen.experience
                            ? AndroidExperienceScreen()
                            : AndroidContactMeScreen(),
              if (menuSelectedCheck) const AndroidRightFooter(size: size),
            ],
          ),
        ),
      ),
    );
  }
}
