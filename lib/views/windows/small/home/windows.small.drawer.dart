// import 'package:animate_do/animate_do.dart';
// import 'package:auto_animated/auto_animated.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:spnk/utils/common_colors.dart';
// import 'package:spnk/utils/extensions/buildcontext.extensions.dart';
// import 'package:spnk/utils/extensions/widget_extensions.dart';
// import 'package:spnk/utils/screen_type.dart';
// import 'package:spnk/views/bloc/screen_details/screen_bloc.dart';
// import 'package:spnk/views/bloc/screen_details/screen_event.dart';

// class WindowsSmallDrawer extends StatefulWidget {
//   @override
//   _WindowsHomeSmallDrawerState createState() => _WindowsHomeSmallDrawerState();
// }

// class _WindowsHomeSmallDrawerState extends State<WindowsSmallDrawer> {
  

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           FadeInLeftBig(
//             child: Container(
//               padding: const EdgeInsets.only(top: 30),
//               child: Image.asset(
//                 'assets/images/exp_icon.png',
//                 height: 250,
//               ),
//             ),
//           ),
//           const SizedBox(height: 25),
//           SizedBox(
//             width: 320,
//             child: LiveList(
//               shrinkWrap: true,
//               separatorBuilder: (ctx, _) => const SizedBox(height: 10),
//               padding: const EdgeInsets.all(20),
//               showItemInterval: const Duration(milliseconds: 200),
//               itemCount: 4,
//               itemBuilder: animationItemBuilder((index) {
//                 switch (index) {
//                   case 0:
//                     return HomeListItem();
//                   case 3:
//                     return ContactMeListItem();
//                   case 1:
//                     return ExperienceListItem();
//                   case 2:
//                     return MyProjectsListItem();
//                 }
//                 return Container();
//               }),
//             ),
//           ),
//           // FadeInLeftBig(
//           //   child: Container(
//           //     padding: const EdgeInsets.only(left: 0, top: 50),
//           //     child: Image.asset(
//           //       'assets/images/exp_icon.png',
//           //       height: 250,
//           //     ),
//           //     // child: Lottie.asset(
//           //     //   'assets/lotties/mobile-app-process.json',
//           //     //   height: 250,
//           //     // ),
//           //   ),
//           // ),
//           const SizedBox(
//             height: 20,
//           ),
//         ],
//       ),
//     );
//   }
// }

