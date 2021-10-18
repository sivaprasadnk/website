// import 'package:bordered_text/bordered_text.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class WindowsProjectScreen extends StatefulWidget {
//   const WindowsProjectScreen({Key? key}) : super(key: key);

//   @override
//   _WindowsProjectScreenState createState() => _WindowsProjectScreenState();
// }

// class _WindowsProjectScreenState extends State<WindowsProjectScreen> {
//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;
//     var screenWidth = screenSize.width;
//     return Container(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: 100,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: screenWidth > 500
//                 ? BorderedText(
//                     strokeWidth: 4.0,
//                     strokeCap: StrokeCap.round,
//                     strokeColor: Colors.teal,
//                     child: Text(
//                       'My Projects',
//                       style: TextStyle(
//                         fontFamily: 'PatuaOne',
//                         color: Colors.white,
//                         fontSize: 21.0,
//                       ),
//                     ),
//                   )
//                 : Text(
//                     'My Projects',
//                     style: TextStyle(
//                       fontFamily: 'PatuaOne',
//                       color: Colors.teal,
//                       fontSize: 21.0,
//                     ),
//                   ),
//           ),
//           SizedBox(
//             height: 25,
//           ),
//           SizedBox(
//             height: 300,
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Padding(
//                       padding:
//                           const EdgeInsets.only(left: 50.0, top: 8, right: 20),
//                       child: MouseRegion(
//                         cursor: SystemMouseCursors.click,
//                         child: GestureDetector(
//                           onTap: () {
//                             launch(
//                                 'https://play.google.com/store/apps/details?id=com.sptpra.spquotes');
//                           },
//                           child: Container(
//                             height: 150,
//                             width: 150,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: Colors.teal,
//                             ),
//                             child: Align(
//                               alignment: Alignment.center,
//                               child: Text(
//                                 'SP \nQuotes',
//                                 style: TextStyle(
//                                     fontSize: 40,
//                                     fontFamily: 'Gugi',
//                                     color: Colors.white),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 50.0, top: 8),
//                       child: Text(
//                         'A simple quotes listing app',
//                         style: TextStyle(
//                           fontFamily: 'PatuaOne',
//                           color: Colors.teal,
//                           fontSize: 15,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 50.0, top: 8),
//                       child: MouseRegion(
//                         cursor: SystemMouseCursors.click,
//                         child: GestureDetector(
//                           onTap: () {
//                             launch(
//                                 'https://play.google.com/store/apps/details?id=com.sptpra.spquiz');
//                           },
//                           child: Container(
//                             height: 150,
//                             width: 150,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: Colors.teal,
//                             ),
//                             child: Align(
//                               alignment: Alignment.center,
//                               child: Text(
//                                 'SP \nQuiz',
//                                 style: TextStyle(
//                                     fontSize: 50,
//                                     fontFamily: 'Gugi',
//                                     color: Colors.white),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 50.0, top: 8),
//                       child: Text(
//                         'A simple Quiz app',
//                         style: TextStyle(
//                           fontFamily: 'PatuaOne',
//                           color: Colors.teal,
//                           fontSize: 15,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   width: 20,
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
