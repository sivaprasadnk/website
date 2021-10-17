// import 'package:animate_do/animate_do.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:spnk/provider/quotes/quotes.dart';
// import 'package:spnk/provider/theme_provider.dart';
// import 'package:spnk/utils/common_strings.dart';

// class WindowsHomeScreen extends StatefulWidget {
//   static const routeName = '/Home';
//   const WindowsHomeScreen({Key? key}) : super(key: key);

//   @override
//   _WindowsHomeScreenState createState() => _WindowsHomeScreenState();
// }

// class _WindowsHomeScreenState extends State<WindowsHomeScreen> {
//   bool isDarkModeEnabled = false;
//   // DateTime time = DateTime.now();
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
//     // Future.delayed(Duration(seconds: 1)).then((value) {
//     //   setState(() {
//     //     showImage = true;
//     //   });
//     // });
//     // Future.delayed(Duration(seconds: 2)).then((value) {
//     //   setState(() {
//     //     showQuote = true;
//     //   });
//     // });
//   }

//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;
//     var screenWidth = screenSize.width;
//     final themeProvider = Provider.of<DarkThemeProvider>(context);
//     final isDarkTheme = themeProvider.darkTheme;
//     // time = DateTime.now();
//     // var quote = time.second % 2 == 0 ? quote1 : quote2;
//     // var author = time.second % 2 == 0 ? author1 : author2;
//     // print('..second ==${time.second}');
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(7, 17, 26, 1),
//       body: Row(
//         children: [
//           Container(
//             width: screenWidth / 2,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(left: screenWidth * 0.2),
//                   child: FadeInDownBig(
//                     child: Container(
//                       width: screenWidth * 0.5,
//                       child: FittedBox(
//                         child: Text(
//                           "Hi, \nI 'm Sivaprasad NK .",
//                           style: TextStyle(
//                             fontFamily: 'PlayfairDisplay',
//                             fontWeight: FontWeight.bold,
//                             // fontSize: 40,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: screenWidth * 0.2),
//                   child: FadeInLeftBig(
//                     child: Container(
//                       child: FittedBox(
//                         child: Text(
//                           "\nFlutter Developer from Tripunithura, Kerala .",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 23,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             width: screenWidth / 2,
//             // color: Colors.amber,
//             child: Stack(
//               children: [
//                 // Positioned.fill(
//                 //   child: AnimatedOpacity(
//                 //     opacity: 1,
//                 //     duration: Duration(milliseconds: 900),
//                 //     child: Align(
//                 //       child: CustomPaint(
//                 //         painter: MyPainter(ctx: context),
//                 //         child: Container(),
//                 //       ),
//                 //     ),
//                 //   ),
//                 // ),
//                 Align(
//                   alignment: Alignment.center,
//                   child: FadeInUpBig(
//                     child: Container(
//                       child: CircleAvatar(
//                         // radius: screenWidth * 0.1,
//                         radius: 100,
//                         backgroundImage: AssetImage(
//                           'assets/images/propic3.jpg',
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class MyPainter extends CustomPainter {
//   final BuildContext ctx;
//   MyPainter({required this.ctx});
//   @override
//   void paint(Canvas canvas, Size size) {
//     double padding = 0;
//     // final theme = Provider.of<ThemeNotifier>(ctx, listen: false);
//     final Paint paint = Paint()
//       ..color = Colors.teal
//       ..style = PaintingStyle.fill
//       // ..

//       // ..strokeJoin  = Stroke
//       ..strokeWidth = 5.0;

//     final Path path = Path();

//     final h = size.height;
//     final w = size.width;
//     var x = w / 2;
//     x = 0;
//     final y = h / 2;
//     // path.
//     path.moveTo(padding + x, h - padding);
//     path.lineTo(padding + x, h - h * 0.15);
//     path.quadraticBezierTo(w, y - 55, w, y - 5);
//     path.lineTo(w - padding + x, y - y * 0.5);
//     path.lineTo(w - padding + x, h - padding);
//     path.close();
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }
