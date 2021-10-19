import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/quotes/quotes.dart';
import 'package:spnk/provider/route_provider.dart';
import 'package:spnk/provider/theme_provider.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/android/home/android.home.screen.dart';
import 'package:spnk/views/ios/home/ios.home.screen.dart';
import 'package:spnk/views/windows/home/windows.home.screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage(proPicAssetPath), context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Quotes>.value(value: Quotes()),
        ChangeNotifierProvider<DarkThemeProvider>.value(
            value: DarkThemeProvider()),
        ChangeNotifierProvider<RouteProvider>.value(value: RouteProvider())
      ],
      child: MaterialApp(
        title: 'Sivaprasad NK',
        debugShowCheckedModeBanner: false,
        // home: ChangeNotifierProvider(
        //   create: (_) => RouteProvider(),
        //   child: SplashScreen(),
        // ),
        routes: {
          '/': (context) => SplashScreen(),
          AndroidHomeScreen.routeName: (context) => AndroidHomeScreen(),
          WindowsHomeScreen.routeName: (context) => WindowsHomeScreen(),
          IosHomeScreen.routeName: (context) => IosHomeScreen(),
        },
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();

    if (defaultTargetPlatform == TargetPlatform.android) {
      Future.delayed(Duration(seconds: 5)).then((value) {
        Navigator.pushReplacementNamed(context, AndroidHomeScreen.routeName);
      });
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      Future.delayed(Duration(seconds: 5)).then((value) {
        Navigator.pushReplacementNamed(context, AndroidHomeScreen.routeName);
      });
    } else if (defaultTargetPlatform == TargetPlatform.macOS) {
      Future.delayed(Duration(seconds: 5)).then((value) {
        Navigator.pushReplacementNamed(context, WindowsHomeScreen.routeName);
      });
    } else {
      Future.delayed(Duration(seconds: 5)).then((value) {
        Navigator.pushReplacementNamed(context, WindowsHomeScreen.routeName);
      });
    }
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(7, 17, 26, 1),
      body: Align(
        alignment: screenWidth > 500 ? Alignment.center : Alignment.centerLeft,
        child: Padding(
          padding:
              screenWidth < 510 ? const EdgeInsets.all(25.0) : EdgeInsets.zero,
          child: Stack(
            children: [
              Container(
                height: screenSize.height,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: screenWidth,
                  child: screenWidth > 500
                      ? WelcomeText(
                          isMobile: false,
                        )
                      : FittedBox(
                          child: WelcomeText(
                          isMobile: true,
                        )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class NoTransitionsOnWeb extends PageTransitionsTheme {
  @override
  Widget buildTransitions<T>(
    route,
    context,
    animation,
    secondaryAnimation,
    child,
  ) {
    if (kIsWeb) {
      return child;
    }
    return super.buildTransitions(
      route,
      context,
      animation,
      secondaryAnimation,
      child,
    );
  }
}
