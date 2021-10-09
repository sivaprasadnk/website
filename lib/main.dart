import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/quotes/quotes.dart';
import 'package:spnk/provider/theme_provider.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/android/home/android.home.screen.dart';
import 'package:spnk/views/ios/home/ios.home.screen.dart';
import 'package:spnk/views/macOS/home/macos.home.screen.dart';
import 'package:spnk/views/windows/home/windows.home.screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // precacheImage(AssetImage("assets/images/propic3.jpg"), context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Quotes>.value(value: Quotes()),
        ChangeNotifierProvider<DarkThemeProvider>.value(
            value: DarkThemeProvider())
      ],
      child: MaterialApp(
        title: 'Sivaprasad NK',
        debugShowCheckedModeBanner: false,
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
    debugPrint('...@ hereee1');
    Future.delayed(Duration(seconds: 5)).then((value) {
      if (defaultTargetPlatform == TargetPlatform.android) {
        Navigator.pushReplacementNamed(context, AndroidHomeScreen.routeName);
      } else if (defaultTargetPlatform == TargetPlatform.iOS) {
        Navigator.pushReplacementNamed(context, IosHomeScreen.routeName);
      } else if (defaultTargetPlatform == TargetPlatform.macOS) {
        debugPrint('...@ hereee2');
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (ctx) => MacOsHomeScreen()));
        // Navigator.pushReplacementNamed(context, MacOsHomeScreen.routeName);
      } else {
        // Navigator.pushReplacementNamed(context, WindowsHomeScreen.routeName);
      }
      // defaultTargetPlatform == Targ
    });
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Align(
        alignment: screenWidth > 500 ? Alignment.center : Alignment.centerLeft,
        child: Padding(
          padding:
              screenWidth < 510 ? const EdgeInsets.all(25.0) : EdgeInsets.zero,
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
