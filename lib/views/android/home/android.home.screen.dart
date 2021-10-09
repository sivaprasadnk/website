import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/quotes/quotes.dart';
import 'package:spnk/provider/theme_provider.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/utils/theme.dart';
import 'package:spnk/views/android/drawer/android.drawer.screen.dart';
import 'package:spnk/views/android/projects/android.projects.screen.dart';
import 'package:url_launcher/url_launcher.dart';

class AndroidHomeScreen extends StatefulWidget {
  static const routeName = '/AndroidHome';
  const AndroidHomeScreen({Key? key}) : super(key: key);

  @override
  _AndroidHomeScreenState createState() => _AndroidHomeScreenState();
}

class _AndroidHomeScreenState extends State<AndroidHomeScreen> {
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
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    final isDarkTheme = themeProvider.darkTheme;
    // var scaffold = Scaffold.of(context);
    return Scaffold(
        backgroundColor: Styles.themeData(isDarkTheme, context).backgroundColor,
        // appBar: PreferredSize(
        //   preferredSize: Size(screenSize.width, 65),
        //   child: Container(
        //     color: Colors.blue,
        //     child: Padding(
        //       padding: EdgeInsets.only(top: 70),
        //       child: Row(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           MouseRegion(
        //             cursor: SystemMouseCursors.click,
        //             child: GestureDetector(
        //               onTap: () {
        //                 setState(() {
        //                   homeSelected = true;
        //                 });
        //               },
        //               child: nameText(),
        //             ),
        //           ),
        //           Expanded(
        //             child: Container(),
        //           ),
        //           SizedBox(
        //             height: 50,
        //             child: Switch.adaptive(
        //                 activeColor: Colors.black,
        //                 value: themeProvider.darkTheme,
        //                 onChanged: (value) {
        //                   themeProvider.darkTheme = value;
        //                 }),
        //           ),
        //           InkWell(
        //             onHover: (value) {
        //               setState(() {
        //                 _isHovering[0] = value;
        //                 _isHovering[1] = false;
        //                 _isHovering[2] = false;
        //               });
        //             },
        //             onTap: () {
        //               setState(() {
        //                 homeSelected = true;
        //                 projectSelected = false;
        //               });
        //             },
        //             child: Column(
        //               mainAxisSize: MainAxisSize.min,
        //               children: [
        //                 Text(
        //                   'Home',
        //                   style: TextStyle(
        //                     fontFamily: 'PatuaOne',
        //                     color: _isHovering[0]
        //                         ? Colors.blue.shade200
        //                         : Colors.white,
        //                   ),
        //                 ),
        //                 SizedBox(height: 5),
        //                 // For showing an underline on hover
        //                 Visibility(
        //                   maintainAnimation: true,
        //                   maintainState: true,
        //                   maintainSize: true,
        //                   visible: screenWidth > 500
        //                       ? _isHovering[0] || homeSelected
        //                       : homeSelected,
        //                   child: Container(
        //                     height: 2,
        //                     width: 40,
        //                     color: Colors.white,
        //                   ),
        //                 )
        //               ],
        //             ),
        //           ),
        //           SizedBox(
        //             width: screenSize.width / 50,
        //           ),
        //           InkWell(
        //             onHover: (value) {
        //               setState(() {
        //                 _isHovering[0] = false;
        //                 _isHovering[1] = value;
        //                 _isHovering[2] = false;
        //               });
        //             },
        //             onTap: () {
        //               setState(() {
        //                 projectSelected = true;
        //                 homeSelected = false;
        //                 // projectSelected = false;
        //               });
        //             },
        //             child: Column(
        //               mainAxisSize: MainAxisSize.min,
        //               children: [
        //                 Text(
        //                   'Projects',
        //                   style: TextStyle(
        //                     fontFamily: 'PatuaOne',
        //                     color: _isHovering[1]
        //                         ? Colors.blue.shade200
        //                         : Colors.white,
        //                   ),
        //                 ),
        //                 SizedBox(height: 5),
        //                 // For showing an underline on hover
        //                 Visibility(
        //                   maintainAnimation: true,
        //                   maintainState: true,
        //                   maintainSize: true,
        //                   visible: screenWidth > 500
        //                       ? _isHovering[1] || projectSelected
        //                       : projectSelected,
        //                   child: Container(
        //                     height: 2,
        //                     width: 40,
        //                     color: Colors.white,
        //                   ),
        //                 )
        //               ],
        //             ),
        //           ),
        //           SizedBox(
        //             width: screenSize.width / 50,
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        drawer: Drawer(
          child: AndroidDrawerScreen(),
        ),
        body: homeSelected
            ? Stack(
                children: [
                  Wave(),
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
                          height: 80,
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
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        AnimatedOpacity(
                          opacity: showImage ? 1 : 0,
                          duration: Duration(milliseconds: 500),
                          child: Container(
                            padding: const EdgeInsets.all(38.0),
                            // height: 1000,
                            child: Column(
                              children: [
                                Container(
                                  child: CircleAvatar(
                                    radius: 100,
                                    backgroundImage: AssetImage(
                                      'assets/images/propic3.jpg',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: nameText(textColor: Colors.white),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
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
            : AndroidProjectScreen());
  }
}