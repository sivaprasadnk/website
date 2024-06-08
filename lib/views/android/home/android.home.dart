import 'package:flutter/material.dart';
import 'package:spnk/utils/common_colors.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/utils/screen_type.dart';
import 'package:spnk/views/android/contactme/android.contactme.screen.dart';
import 'package:spnk/views/android/experience/android.experience.screen.dart';
import 'package:spnk/views/android/home/android.home.screen.dart';
import 'package:spnk/views/android/menu/android.menu.screen.dart';
import 'package:spnk/views/android/projects/android.projects.screen.dart';
import 'package:spnk/views/provider/menu_provider.dart';
import 'package:spnk/views/provider/route_provider.dart';

class AndroidHome extends StatelessWidget {
  static const routeName = '/AndroidHome';
  const AndroidHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final screenWidth = screenSize.width;
    final screen = ref.watch(routeNotifierProvider);
    final menuSelectedCheck = ref.watch(menuNotifierProvider);
    debugPrint('.. @@screen => $screen ');
    debugPrint('.. @@menuSelectedCheck =>$menuSelectedCheck');
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(0, 34, 51, 1),
        bottomNavigationBar: const AndroidRightFooter(),
        extendBody: true,
        appBar: AppBar(
          backgroundColor: kTransparentColor,
          actions: [
            Padding(
              padding: EdgeInsets.only(
                right: 10,
                top: 20,
                left: screenWidth * 0.8,
              ),
              child: screen == Screen.menu
                  ? IconButton(
                      icon: Icon(Icons.close, color: kWhiteColor),
                      onPressed: () {
                        ref.read(menuNotifierProvider.notifier).menuSelected =
                            false;
                        ref
                            .read(routeNotifierProvider.notifier)
                            .selectedScreen = Screen.home;
                      },
                    )
                  : IconButton(
                      icon: Icon(Icons.menu, color: kWhiteColor),
                      onPressed: () {
                        ref.read(menuNotifierProvider.notifier).menuSelected =
                            true;
                        ref
                            .read(routeNotifierProvider.notifier)
                            .selectedScreen = Screen.menu;
                      },
                    ),
            ),
          ],
        ),
        body: SizedBox(
          width: screenWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (screen == Screen.home) AndroidHomeScreen(),
              if (screen == Screen.menu) const AndroidMenuScreen(),
              if (screen == Screen.projects) const AndroidProjects(),
              if (screen == Screen.experience) AndroidExperienceScreen(),
              if (screen == Screen.contactMe) AndroidContactMeScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
