import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/quotes/quotes.dart';
import 'package:spnk/provider/route_provider.dart';
import 'package:spnk/provider/theme_provider.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/views/android/home/android.home.dart';
import 'package:spnk/views/min_size_container.dart';
import 'package:spnk/views/windows/large/home/windows.home.large.dart';
import 'package:spnk/views/windows/medium/home/windows.medium.home.dart';
import 'package:spnk/views/windows/small/home/windows.small.home.dart';

void main() {
  // lockOrientation();
  runApp(MyApp());
}

lockOrientation() async {
  // if (defaultTargetPlatform == TargetPlatform.android ||
  //     defaultTargetPlatform == TargetPlatform.iOS) {
  //   await SystemChrome.setPreferredOrientations(
  //       [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage(proPicAssetPath), context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Quotes>(create: (_) => Quotes()),
        ChangeNotifierProvider<ThemeNotifier>(create: (_) => ThemeNotifier()),
        ChangeNotifierProvider<RouteProvider>(
            create: (_) =>
                RouteProvider(menuSelectedCheck: false, screenName: "Home")),
      ],
      child: Consumer<ThemeNotifier>(
        builder: (_, themeNotifier, __) {
          return MaterialApp(
            scrollBehavior: MaterialScrollBehavior().copyWith(
              dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch,
                PointerDeviceKind.stylus,
                PointerDeviceKind.unknown
              },
            ),
            title: 'Sivaprasad NK',
            debugShowCheckedModeBanner: false,
            theme: themeNotifier.darkTheme ? dark : light,
            routes: {
              '/': (context) => SplashScreen(),
              // IosHomeScreen.routeName: (context) => IosHomeScreen(),
            },
          );
        },
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    // var screenHeight = screenSize.height;
    return defaultTargetPlatform == TargetPlatform.android ||
            defaultTargetPlatform == TargetPlatform.iOS
        ? AndroidHome()
        : screenWidth > 1121
            ? MinSize(
                child: WindowsHomeLarge(),
                minHeight: 734,
              )
            : screenWidth > 695
                ? MinSize(
                    child: WindowsMediumHome(),
                    minHeight: 734,
                  )
                : MinSize(
                    child: WindowsSmallHome(),
                    minHeight: 734,
                  );
  }
}
