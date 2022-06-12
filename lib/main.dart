import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/dialog_provider.dart';
import 'package:spnk/provider/page.provider.dart';
// import 'package:spnk/provider/image.provider.dart';
import 'package:spnk/provider/quotes/quotes.dart';
import 'package:spnk/provider/route_provider.dart';
import 'package:spnk/provider/theme_provider.dart';
import 'package:spnk/views/android/home/android.home.dart';
import 'package:spnk/views/min_size_container.dart';
import 'package:spnk/views/windows/large/home/windows.home.large.dart';
import 'package:spnk/views/windows/medium/home/windows.medium.home.dart';
import 'package:spnk/views/windows/small/home/windows.small.home.dart';

// lottie https://assets1.lottiefiles.com/packages/lf20_j1uvfzu5.json

// https://assets8.lottiefiles.com/packages/lf20_zGHcl0.json
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // precacheImage(const AssetImage(proPicAssetPath), context);
    // precacheImage(const AssetImage('assets/images/propiccc'), context);
    precacheImage(const AssetImage('assets/images/mesh1.jpg'), context);
    precacheImage(const AssetImage('assets/images/dash/dash1.png'), context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Quotes>(create: (_) => Quotes()),
        ChangeNotifierProvider<ThemeNotifier>(create: (_) => ThemeNotifier()),
        ChangeNotifierProvider<DialogProvider>(create: (_) => DialogProvider()),
        ChangeNotifierProvider<PageProvider>(
          create: (_) => PageProvider(),
        ),
        ChangeNotifierProvider<RouteProvider>(
          create: (_) => RouteProvider(),
        ),
      ],
      child: Consumer<ThemeNotifier>(
        builder: (_, themeNotifier, __) {
          return MaterialApp(
            scrollBehavior: const MaterialScrollBehavior().copyWith(
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
              '/': (context) => const SplashScreen(),
              // IosHomeScreen.routeName: (context) => IosHomeScreen(),
            },
          );
        },
      ),
    );
  }
}

/// note8 screenWidth : 392.72727272727275
/// note8 screenHeight  : 803.6363636363636

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    // var screenHeight = screenSize.height;
    return defaultTargetPlatform != TargetPlatform.android ||
            defaultTargetPlatform != TargetPlatform.iOS
        ? const AndroidHome()
        : screenWidth > 1121
            ? MinSize(
                minHeight: 734,
                child: WindowsHomeLarge(),
              )
            : screenWidth > 695
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
