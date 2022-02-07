import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/quotes/quotes.dart';
import 'package:spnk/provider/route_provider.dart';
import 'package:spnk/provider/theme_provider.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/views/android/home/android.home.dart';
import 'package:spnk/views/ios/home/ios.home.screen.dart';
import 'package:spnk/views/windows/large/home/windows.home.large.dart';
import 'package:spnk/views/windows/medium/home/windows.medium.home.dart';
import 'package:spnk/views/windows/small/home/windows.small.home.dart';

void main() {
  lockOrientation();
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
        ChangeNotifierProvider<Quotes>.value(value: Quotes()),
        ChangeNotifierProvider<DarkThemeProvider>.value(
            value: DarkThemeProvider()),
        ChangeNotifierProvider<RouteProvider>.value(
            value: RouteProvider(menuSelectedCheck: false, screenName: "Home"))
      ],
      child: MaterialApp(
        title: 'Sivaprasad NK',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashScreen(),
          IosHomeScreen.routeName: (context) => IosHomeScreen(),
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
        : screenWidth > 1091
            ? WindowsHomeLarge()
            : screenWidth > 695
                ? WindowsMediumHome()
                : WindowsSmallHome();
  }
}
