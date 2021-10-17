// import 'dart:io';

// import 'package:animate_do/animate_do.dart';
// import 'package:bordered_text/bordered_text.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:spnk/provider/quotes/quotes.dart';
// import 'package:spnk/provider/theme_provider.dart';
// import 'package:spnk/utils/common_strings.dart';
// import 'package:spnk/utils/common_widgets.dart';
// import 'package:spnk/utils/theme.dart';
// import 'package:spnk/views/android/drawer/android.drawer.screen.dart';
// import 'package:url_launcher/url_launcher.dart';

// class AndroidHomeScreen extends StatefulWidget {
//   static const routeName = '/AndroidHome';
//   const AndroidHomeScreen({Key? key}) : super(key: key);

//   @override
//   _AndroidHomeScreenState createState() => _AndroidHomeScreenState();
// }

// class _AndroidHomeScreenState extends State<AndroidHomeScreen> {
//   bool isDarkModeEnabled = false;

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
//     Future.delayed(Duration(seconds: 3)).then((value) {
//       setState(() {
//         showQuote = true;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;
//     final themeProvider = Provider.of<DarkThemeProvider>(context);
//     final isDarkTheme = themeProvider.darkTheme;
//     //  var screenSize = MediaQuery.of(context).size;
//     var screenWidth = screenSize.width;
//     // var scaffold = Scaffold.of(context);
//     return Scaffold(
//         backgroundColor: Styles.themeData(isDarkTheme, context).backgroundColor,
//         drawer: Drawer(
//           child: AndroidDrawerScreen(),
//         ),
//         body: Stack(
//           children: [
//             Wave(),
//             Builder(
//               builder: (ctx) => Positioned.fill(
//                 top: 50,
//                 left: 20,
//                 child: Align(
//                   alignment: Alignment.topLeft,
//                   child: GestureDetector(
//                       onTap: () {
//                         debugPrint('...@1');
//                         Scaffold.of(ctx).openDrawer();
//                       },
//                       child: Icon(Icons.menu)),
//                 ),
//               ),
//             ),
//             homeSelected
//                 ? Container(
//                     height: screenSize.height,
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: 80,
//                         ),
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
//                                 Container(
//                                   child: CircleAvatar(
//                                     radius: 100,
//                                     backgroundImage: AssetImage(
//                                       'assets/images/propic3.jpg',
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Center(
//                                   child: nameText(textColor: Colors.white),
//                                 ),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     FadeInLeftBig(
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
//                                     FadeInUpBig(
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
//                                     FadeInUpBig(
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
//                                     FadeInRightBig(
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
//                 : Container(
//                     height: screenSize.height,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           height: 100,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: screenWidth > 500
//                               ? BorderedText(
//                                   strokeWidth: 4.0,
//                                   strokeCap: StrokeCap.round,
//                                   strokeColor: Colors.teal,
//                                   child: Text(
//                                     'My Projects',
//                                     style: TextStyle(
//                                       fontFamily: 'PatuaOne',
//                                       color: Colors.white,
//                                       fontSize: 21.0,
//                                     ),
//                                   ),
//                                 )
//                               : Text(
//                                   'My Projects',
//                                   style: TextStyle(
//                                     fontFamily: 'PatuaOne',
//                                     color: Colors.teal,
//                                     fontSize: 21.0,
//                                   ),
//                                 ),
//                         ),
//                         SizedBox(
//                           height: 25,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: ListView.separated(
//                             separatorBuilder: (ctx, i) {
//                               return SizedBox(
//                                 height: 10,
//                               );
//                             },
//                             shrinkWrap: true,
//                             itemCount: 2,
//                             padding: EdgeInsets.zero,
//                             itemBuilder: (ctx, i) {
//                               return GestureDetector(
//                                 onTap: () {
//                                   i == 0
//                                       ? launch(spQuotesLink)
//                                       : launch(spQuizLink);
//                                 },
//                                 child: Row(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Container(
//                                       height: 180,
//                                       width: 180,
//                                       decoration: BoxDecoration(
//                                         color: Colors.teal,
//                                         borderRadius: BorderRadius.circular(15),
//                                       ),
//                                       child: Align(
//                                         alignment: Alignment.center,
//                                         child: Text(
//                                           i == 0
//                                               ? ' SP \n Quotes '
//                                               : ' SP \n Quiz ',
//                                           style: TextStyle(
//                                             fontSize: i == 0 ? 40 : 55,
//                                             fontFamily: 'Gugi',
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     i == 0
//                                         ? Flexible(
//                                             child: Padding(
//                                               padding: const EdgeInsets.only(
//                                                   top: 25, left: 15),
//                                               child: Text(
//                                                 ' A simple Quotes \n Listing App',
//                                                 style: TextStyle(
//                                                   fontSize: 20,
//                                                   // fontFamily: 'Gugi',
//                                                   color: Colors.teal,
//                                                   fontWeight: FontWeight.bold,
//                                                 ),
//                                               ),
//                                             ),
//                                           )
//                                         : Flexible(
//                                             child: Padding(
//                                               padding: const EdgeInsets.only(
//                                                   top: 25, left: 15),
//                                               child: Text(
//                                                 'A simple quiz app',
//                                                 style: TextStyle(
//                                                   fontSize: 20,
//                                                   fontWeight: FontWeight.bold,
//                                                   // fontFamily: 'Gugi',
//                                                   color: Colors.teal,
//                                                 ),
//                                               ),
//                                             ),
//                                           )
//                                   ],
//                                 ),
//                               );
//                             },
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//           ],
//         ));
//   }
// }
