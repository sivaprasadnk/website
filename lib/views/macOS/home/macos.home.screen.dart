// import 'dart:io';

// import 'package:bordered_text/bordered_text.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:spnk/provider/quotes/quotes.dart';
// import 'package:spnk/provider/theme_provider.dart';
// import 'package:spnk/utils/common_strings.dart';
// import 'package:spnk/utils/common_widgets.dart';
// import 'package:spnk/utils/theme.dart';
// import 'package:spnk/views/macOS/projects/macos.projects.screen.dart';
// import 'package:url_launcher/url_launcher.dart';

// class MacOsHomeScreen extends StatefulWidget {
//   const MacOsHomeScreen({Key? key}) : super(key: key);

//   @override
//   _MacOsHomeScreenState createState() => _MacOsHomeScreenState();
// }

// class _MacOsHomeScreenState extends State<MacOsHomeScreen> {
//   bool isDarkModeEnabled = false;

//   List _isHovering = [true, false, false];
//   Quotes? item;
//   bool homeSelected = true, projectSelected = false;
//   late Widget fbPng;
//   late Widget waPng;
//   late Widget instaPng;
//   late Widget linkedInPng;
//   late bool showImage;
//   late bool showQuote = false;
//   double iconSize = 30;
//   bool quoteLoaded = false;

//   @override
//   void initState() {
//     super.initState();
//     showImage = false;
//     fbPng = Image.asset(fbPngAssetName, height: iconSize);
//     waPng = Image.asset(whatsappPngeAssetName, height: iconSize);
//     instaPng = Image.asset(instaPngImageName, height: iconSize);
//     linkedInPng = Image.asset(linkedInAssetName,
//         height: iconSize, color: Colors.blue[900]);
//     Future.delayed(Duration(seconds: 1)).then((value) {
//       setState(() {
//         showImage = true;
//       });
//     });
//     Future.delayed(Duration(seconds: 2)).then((value) {
//       setState(() {
//         showQuote = true;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;
//     // var screenWidth = screenSize.width;
//     // final themeProvider = Provider.of<DarkThemeProvider>(context);
//     final isDarkTheme = themeProvider.darkTheme;

//     return Scaffold(
//         backgroundColor: Styles.themeData(isDarkTheme, context).backgroundColor,
//         appBar: PreferredSize(
//           preferredSize: Size(screenSize.width, 65),
//           child: Container(
//             color: Colors.blue,
//             child: Padding(
//               padding: EdgeInsets.all(20),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   MouseRegion(
//                     cursor: SystemMouseCursors.click,
//                     child: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           homeSelected = true;
//                           projectSelected = false;
//                         });
//                       },
//                       child: nameText(textColor: kWhiteColor),
//                     ),
//                   ),
//                   Expanded(
//                     child: Container(),
//                   ),
//                   // SizedBox(
//                   //   height: 50,
//                   //   child: Switch.adaptive(
//                   //       activeColor: Colors.black,
//                   //       value: themeProvider.darkTheme,
//                   //       onChanged: (value) {
//                   //         themeProvider.darkTheme = value;
//                   //       }),
//                   // ),
//                   InkWell(
//                     // onHover: (value) {
//                     //   setState(() {
//                     //     _isHovering[0] = value;
//                     //     _isHovering[1] = false;
//                     //     _isHovering[2] = false;
//                     //   });
//                     // },
//                     onTap: () {
//                       setState(() {
//                         homeSelected = true;
//                         projectSelected = false;
//                       });
//                     },
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           'Home',
//                           style: TextStyle(
//                             fontFamily: 'PatuaOne',
//                             color: _isHovering[0]
//                                 ? Colors.blue.shade200
//                                 : kWhiteColor,
//                           ),
//                         ),
//                         SizedBox(height: 5),
//                         // For showing an underline on hover
//                         Visibility(
//                           maintainAnimation: true,
//                           maintainState: true,
//                           maintainSize: true,
//                           visible: _isHovering[0] || homeSelected,
//                           child: Container(
//                             height: 2,
//                             width: 40,
//                             color: kWhiteColor,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     width: screenSize.width / 50,
//                   ),
//                   InkWell(
//                     // onHover: (value) {
//                     //   setState(() {
//                     //     _isHovering[0] = false;
//                     //     _isHovering[1] = value;
//                     //     _isHovering[2] = false;
//                     //   });
//                     // },
//                     onTap: () {
//                       setState(() {
//                         projectSelected = true;
//                         homeSelected = false;
//                       });
//                     },
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           'Projects',
//                           style: TextStyle(
//                             fontFamily: 'PatuaOne',
//                             color: _isHovering[1]
//                                 ? Colors.blue.shade200
//                                 : kWhiteColor,
//                           ),
//                         ),
//                         SizedBox(height: 5),
//                         // For showing an underline on hover
//                         Visibility(
//                           maintainAnimation: true,
//                           maintainState: true,
//                           maintainSize: true,
//                           visible: _isHovering[1] || projectSelected,
//                           child: Container(
//                             height: 2,
//                             width: 40,
//                             color: kWhiteColor,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     width: screenSize.width / 50,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         body: Stack(
//           children: [
//             Wave(),
//             homeSelected
//                 ? Container(
//                     height: screenSize.height,
//                     child: Column(
//                       children: [
//                         QuoteWidget(showQuote: true),
//                         Spacer(),
//                         AnimatedOpacity(
//                           opacity: showImage ? 1 : 0,
//                           duration: Duration(milliseconds: 500),
//                           child: Container(
//                             padding: const EdgeInsets.all(38.0),
//                             // height: 1000,
//                             child: Column(
//                               children: [
//                                 ProPic(),
//                                 SizedBox(height: 10),
//                                 Center(
//                                     child: BorderedText(
//                                         strokeWidth: 4.0,
//                                         strokeCap: StrokeCap.round,
//                                         strokeColor: Colors.teal,
//                                         child:
//                                             nameText(textColor: kWhiteColor))),
//                                 SizedBox(height: 20),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     MouseRegion(
//                                       cursor: SystemMouseCursors.click,
//                                       child: GestureDetector(
//                                         child: Container(
//                                           child: fbPng,
//                                         ),
//                                         onTap: () {
//                                           launch(fbLink);
//                                         },
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 15,
//                                     ),
//                                     MouseRegion(
//                                       cursor: SystemMouseCursors.click,
//                                       child: GestureDetector(
//                                         child: instaPng,
//                                         onTap: () {
//                                           launch(instaLink);
//                                         },
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 15,
//                                     ),
//                                     MouseRegion(
//                                       cursor: SystemMouseCursors.click,
//                                       child: GestureDetector(
//                                         child: waPng,
//                                         onTap: () {
//                                           if (kIsWeb) {
//                                             launch(whatsappWebLink);
//                                           } else {
//                                             if (Platform.isAndroid)
//                                               launch(whatsappAndroidLink);
//                                           }
//                                         },
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 15,
//                                     ),
//                                     MouseRegion(
//                                       cursor: SystemMouseCursors.click,
//                                       child: GestureDetector(
//                                         child: linkedInPng,
//                                         onTap: () {
//                                           launch(linkedInLink);
//                                         },
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   )
//                 : MacOsProjectScreen(),
//           ],
//         ));
//   }
// }
