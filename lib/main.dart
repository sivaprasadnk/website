import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';
import 'package:spnk/utils/themes.dart';
import 'package:spnk/views/android/home/android.home.dart';
import 'package:spnk/views/min_size_container.dart';
import 'package:spnk/views/provider/data_provider.dart';
import 'package:spnk/views/provider/page_index_controller.dart';
import 'package:spnk/views/provider/route_controller.dart';
import 'package:spnk/views/provider/theme_provider.dart';
import 'package:spnk/views/windows/large/home/windows.home.large.dart';
import 'package:spnk/views/windows/medium/home/windows.medium.home.dart';
import 'package:spnk/views/windows/small/home/windows.small.home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());

    precacheImage(const AssetImage('assets/images/mesh1.jpg'), context);
    precacheImage(const AssetImage('assets/images/dash/dash1.png'), context);
    // final darktheme = ref.watch(themeNotifierProvider);
    return GetMaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown,
        },
      ),
      title: 'Sivaprasad NK',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode:
          themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
      routes: {
        '/': (context) => const SplashScreen(),
        // IosHomeScreen.routeName: (context) => IosHomeScreen(),
      },
    );
  }
}

/// note8 screenWidth : 392.72727272727275
/// note8 screenHeight  : 803.6363636363636

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(RouteController());
    Get.put(PageController());
    Get.put(PageIndexController());
    Get.put(DataController());
    // Get.put(HomeController());
    return defaultTargetPlatform == TargetPlatform.android ||
            defaultTargetPlatform == TargetPlatform.iOS
        ? const AndroidHome()
        : context.screenWidth > 1121
            ? MinSize(
                minHeight: 734,
                child: WindowsHomeLarge(),
              )
            : context.screenWidth > 695
                ? MinSize(
                    minHeight: 734,
                    child: WindowsMediumHome(),
                  )
                : MinSize(
                    minHeight: 734,
                    child: WindowsSmallHome(),
                  );
  }
}
