import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/quotes/quotes.dart';
import 'package:spnk/provider/theme_provider.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/utils/theme.dart';
import 'package:spnk/views/ios/drawer/ios.drawer.screen.dart';
import 'package:spnk/views/ios/projects/ios.projects.screen.dart';
import 'package:url_launcher/url_launcher.dart';

class IosHomeScreen extends StatefulWidget {
  static const routeName = '/IosHome';
  const IosHomeScreen({Key? key}) : super(key: key);

  @override
  _IosHomeScreenState createState() => _IosHomeScreenState();
}

class _IosHomeScreenState extends State<IosHomeScreen> {
  bool isDarkModeEnabled = false;

  List _isHovering = [true, false, false];
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

  @override
  void initState() {
    super.initState();
    showImage = false;
    fbPng = Image.asset(fbPngAssetName, height: iconSize);
    waPng = Image.asset(whatsappPngeAssetName, height: iconSize);
    instaPng = Image.asset(instaPngImageName, height: iconSize);
    linkedInPng = Image.asset(linkedInAssetName,
        height: iconSize, color: Colors.blue[900]);
    Future.delayed(Duration(seconds: 1)).then((value) {
      setState(() {
        showImage = true;
      });
    });
    Future.delayed(Duration(seconds: 2)).then((value) {
      setState(() {
        showQuote = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    // var screenWidth = screenSize.width;
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    final isDarkTheme = themeProvider.darkTheme;
    // var scaffold = Scaffold.of(context);
    return Scaffold(
        backgroundColor: Styles.themeData(isDarkTheme, context).backgroundColor,
        drawer: Drawer(
          child: IosDrawerScreen(),
        ),
        body: homeSelected
            ? SizedBox(
                height: screenSize.height,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: screenSize.height * 0.08,
                    ),
                    Builder(
                      builder: (ctx) => Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                            onTap: () {
                              debugPrint('...@1');
                              Scaffold.of(ctx).openDrawer();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, top: 0),
                              child: Icon(Icons.menu),
                            )),
                      ),
                    ),
                    QuoteWidget(showQuote: true),
                    Spacer(),
                    AnimatedOpacity(
                      opacity: showImage ? 1 : 0,
                      duration: Duration(milliseconds: 900),
                      child: Container(
                        child: CircleAvatar(
                          radius: 100,
                          backgroundImage: AssetImage(
                            'assets/images/propic3.jpg',
                          ),
                        ),
                      ),
                    ),
                    // CircleAvatar(
                    //   radius: screenSize.width * 0.3,
                    //   child: Image(
                    //     image: AssetImage(
                    //       'assets/images/propic3.jpg',
                    //     ),
                    //   ),
                    // ),
                    nameText(textColor: Colors.teal),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeInLeftBig(
                          child: GestureDetector(
                            child: Container(
                              child: fbPng,
                            ),
                            onTap: () {
                              launch(fbLink);
                            },
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        FadeInUpBig(
                          child: GestureDetector(
                            child: instaPng,
                            onTap: () {
                              launch(instaLink);
                            },
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        FadeInUpBig(
                          child: GestureDetector(
                            child: waPng,
                            onTap: () {
                              launch(whatsappWebLink);
                            },
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        FadeInRightBig(
                          child: GestureDetector(
                            child: linkedInPng,
                            onTap: () {
                              launch(linkedInLink);
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              )
            : IosProjectScreen());
  }
}
