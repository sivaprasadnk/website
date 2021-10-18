import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/quotes/quotes.dart';
import 'package:spnk/provider/route_provider.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/android/contact_me/android.contactme.screen.dart';
import 'package:spnk/views/android/menu/android.menu.screen.dart';
import 'package:spnk/views/android/projects/android.projects.screen.dart';

class AndroidHomeScreen extends StatefulWidget {
  static const routeName = '/AndroidHome';
  const AndroidHomeScreen({Key? key}) : super(key: key);

  @override
  _AndroidHomeScreenState createState() => _AndroidHomeScreenState();
}

class _AndroidHomeScreenState extends State<AndroidHomeScreen> {
  bool isDarkModeEnabled = false;

  Quotes? item;
  bool homeSelected = true, projectSelected = false;
  late Widget fbPng;
  late Widget waPng;
  late Widget instaPng;
  late Widget linkedInPng;
  late bool showImage;
  late bool showQuote = false;
  double iconSize = 30;
  bool quoteLoaded = false;

  bool menuSelected = false;

  @override
  void initState() {
    super.initState();
    showImage = false;
    fbPng = Image.asset(fbPngAssetName, height: iconSize);
    waPng = Image.asset(whatsappPngeAssetName, height: iconSize);
    instaPng = Image.asset(instaPngImageName, height: iconSize);
    linkedInPng = Image.asset(linkedInAssetName,
        height: iconSize, color: Colors.blue[900]);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    // final themeProvider = Provider.of<DarkThemeProvider>(context);
    // final isDarkTheme = themeProvider.darkTheme;
    // var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    var screen = Provider.of<RouteProvider>(context).screen.toString();
    var menuSelectedCheck =
        Provider.of<RouteProvider>(context, listen: true).menuSelected as bool;
    // debugPrint('...@@123 menuSelectedCheck..$menuSelectedCheck');
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          backgroundColor:
              ((screen == "MyProjects") || (screen == "ContactMe")) &&
                      !menuSelectedCheck
                  ? Colors.teal
                  : Color.fromRGBO(7, 17, 26, 1),
          body: Stack(
            children: [
              if (screen == "Home")
                Positioned.fill(
                  child: AnimatedOpacity(
                    opacity: !menuSelectedCheck ? 1 : 0,
                    duration: Duration(milliseconds: 900),
                    child: Align(
                      child: CustomPaint(
                        painter: AndroidHomeBgCurve(ctx: context),
                        child: Container(),
                      ),
                    ),
                  ),
                ),
              if ((screen == "Home") && (!menuSelectedCheck))
                Positioned.fill(
                  bottom: screenSize.height * 0.1,
                  // left: 60,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ProPicWidget(
                      radius: screenWidth * 0.3,
                    ),
                  ),
                ),
              !menuSelectedCheck
                  ? screen == "Home"
                      ? Container(
                          height: screenSize.height,
                          child: Stack(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    // height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 20, right: 20),
                                          child: IconButton(
                                            icon: Icon(Icons.menu,
                                                color: Colors.white),
                                            onPressed: () {
                                              Provider.of<RouteProvider>(
                                                      context,
                                                      listen: false)
                                                  .setMenuSelected(check: true);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenSize.height * 0.05,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: screenWidth * 0.1),
                                    child: FadeInDownBig(
                                      child: Container(
                                        width: screenWidth * 0.7,
                                        child: FittedBox(
                                          child: Text(
                                            "Hi, \nI 'm Sivaprasad NK .",
                                            style: TextStyle(
                                                fontFamily: 'PlayfairDisplay',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 40,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: screenWidth * 0.1),
                                    child: FadeInLeftBig(
                                      child: Container(
                                        // width: screenWidth * 0.8,
                                        child: Text(
                                          "\nFlutter Developer from \nTripunithura, Kerala .",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 23,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ],
                          ),
                        )
                      : screen == "ContactMe"
                          ? AndroidContactMeScreen(
                              screenHeight: MediaQuery.of(context).size.height,
                            )
                          : screen == "MyProjects"
                              ? AndroidProjects(
                                  screenHeight:
                                      MediaQuery.of(context).size.height,
                                )
                              : Container()
                  : AndroidMenuScreen()
            ],
          )),
    );
  }
}
