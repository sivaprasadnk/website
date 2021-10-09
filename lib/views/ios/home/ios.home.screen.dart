import 'dart:io';

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
    Future.delayed(Duration(seconds: 3)).then((value) {
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
            ? Stack(
                children: [
                  Builder(
                    builder: (ctx) => Positioned.fill(
                      top: 50,
                      left: 20,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                            onTap: () {
                              debugPrint('...@1');
                              Scaffold.of(ctx).openDrawer();
                            },
                            child: Icon(Icons.menu)),
                      ),
                    ),
                  ),
                  Container(
                    height: screenSize.height,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 75,
                        ),
                        AnimatedOpacity(
                          opacity: showQuote ? 1 : 0,
                          duration: Duration(seconds: 3),
                          child: Container(
                            padding: EdgeInsets.all(30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SelectableText(
                                  '" ' + quote1 + ' "',
                                  toolbarOptions: ToolbarOptions(
                                      copy: true, selectAll: true),
                                  textAlign: TextAlign.center,
                                  style: quoteStyle,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  ' - $author1',
                                  maxLines: 2,
                                  textAlign: TextAlign.right,
                                  style: authorStyle,
                                ),
                                // SizedBox(
                                //   height: 20,
                                // ),
                              ],
                            ),
                          ),
                        ),
                        // Spacer(),
                        AnimatedOpacity(
                          opacity: showImage ? 1 : 0,
                          duration: Duration(milliseconds: 500),
                          child: Container(
                            padding: const EdgeInsets.all(38.0),
                            // height: 1000,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Container(
                                  child: CircleAvatar(
                                    radius: 80,
                                    backgroundImage: AssetImage(
                                      'assets/images/propic3.jpg',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: nameText(textColor: Colors.teal),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MouseRegion(
                                      cursor: SystemMouseCursors.click,
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
                                    MouseRegion(
                                      cursor: SystemMouseCursors.click,
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
                                    MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: GestureDetector(
                                        child: waPng,
                                        onTap: () {
                                          if (kIsWeb) {
                                            launch(whatsappWebLink);
                                          } else {
                                            if (Platform.isAndroid)
                                              launch(whatsappAndroidLink);
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: GestureDetector(
                                        child: linkedInPng,
                                        onTap: () {
                                          launch(linkedInLink);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            : IosProjectScreen());
  }
}
