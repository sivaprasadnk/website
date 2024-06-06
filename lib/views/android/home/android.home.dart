import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';
import 'package:spnk/utils/screen_type.dart';
import 'package:spnk/views/android/contactme/android.contactme.screen.dart';
import 'package:spnk/views/android/experience/android.experience.screen.dart';
import 'package:spnk/views/android/home/android.home.screen.dart';
import 'package:spnk/views/android/menu/android.menu.screen.dart';
import 'package:spnk/views/android/menu/menu.widgets/menu_icon.dart';
import 'package:spnk/views/android/projects/android.projects.screen.dart';
import 'package:spnk/views/provider/route_controller.dart';

class AndroidHome extends StatelessWidget {
  static const routeName = '/AndroidHome';
  const AndroidHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    return SafeArea(
      bottom: false,
      child: PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(0, 34, 51, 1),
          bottomNavigationBar: GetBuilder<RouteController>(
            builder: (controller) {
              if (controller.selectedScreen.value == Screen.menu) {
                return const AndroidRightFooter();
              }
              return const SizedBox.shrink();
            },
          ),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: const [
              AndroidMenuIcon(),
            ],
          ),
          // endDrawer: const AndroidMenuIcon(),
          body: GetBuilder<RouteController>(
            builder: (controller) {
              final screen = controller.selectedScreen.value;
              return SizedBox(
                width: screenWidth,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (screen == Screen.home) AndroidHomeScreen(),
                    if (screen == Screen.menu) const AndroidMenuScreen(),
                    if (screen == Screen.projects) const AndroidProjects(),
                    if (screen == Screen.experience) AndroidExperienceScreen(),
                    if (screen == Screen.contactMe) AndroidContactMeScreen(),
                    // if (screen == Screen.menu) const s,
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
