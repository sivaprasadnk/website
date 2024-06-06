import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spnk/utils/screen_type.dart';
import 'package:spnk/views/provider/route_controller.dart';

class AndroidMenuIcon extends StatelessWidget {
  const AndroidMenuIcon({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RouteController>(
      builder: (controller) {
        return Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, right: 20),
            child: GestureDetector(
              child: controller.selectedScreen.value == Screen.home
                  ? const Icon(Icons.menu, color: Colors.white)
                  : const Icon(Icons.close, color: Colors.white),
              onTap: () {
                if (controller.selectedScreen.value == Screen.home) {
                  controller.updateScreen(Screen.menu);
                } else {
                  controller.updateScreen(Screen.home);
                }
              },
            ),
          ),
        );
      },
    );
  }
}
