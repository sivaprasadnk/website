import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/views/windows/medium/projects/quizApp/title.text.dart';
import 'package:spnk/views/windows/medium/projects/view.more.container.dart';

class QuotesTitleText extends StatelessWidget {
  const QuotesTitleText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 50,
      width: 360,
    ).blurred(
      overlay: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            const Text(
              'SP Quotes App',
              style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
              ),
            ),
            const SizedBox(
              width: 70,
            ),
            GestureDetector(
              onTap: () {
                // Provider.of<ImageHoverProvider>(context, listen: false)
                //     .toggleHovered();
                showAnimatedDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return Dialog(
                      backgroundColor: Colors.transparent,
                      child: DetailsContainer(
                        desc1: quotesAppStr1,
                        desc2: quotesAppStr2,
                        link: spQuotesLink,
                        title: 'SP Quotes App',
                      ),
                    );
                  },
                  animationType: DialogTransitionType.size,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(seconds: 1),
                );
              },
              child: const ViewMoreContainer(),
            ),
          ],
        ),
      ),
      colorOpacity: 0.3,
      alignment: Alignment.topLeft,
      borderRadius: const BorderRadius.only(
        // topLeft: Radius.circular(10),
        // topRight: Radius.circular(10),
        bottomRight: Radius.circular(10),
        bottomLeft: Radius.circular(10),
      ),
    );
  }
}

// class DetailsContainer extends StatelessWidget {
//   const DetailsContainer({
//     Key? key,
//     required this.desc1,
//     required this.desc2,
//     required this.link,
//     required this.title,
//   }) : super(key: key);
//   final String desc1;
//   final String desc2;
//   final String link;
//   final String title;
//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     final screenWidth = screenSize.width;
//     return Stack(
//       children: [
//         Container(
//           margin: const EdgeInsets.only(top: 30, right: 5),
//           width: 400,
//           height: 330,
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage(
//                 'assets/images/mesh1.jpg',
//               ),
//               fit: BoxFit.cover,
//             ),
//             borderRadius: BorderRadius.only(
//               topRight: Radius.circular(10),
//               topLeft: Radius.circular(10),
//               bottomRight: Radius.circular(10),
//               bottomLeft: Radius.circular(10),
//             ),
//             // color: Color.fromARGB(255, 9, 71, 122),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 30, top: 20),
//                 child: Text(
//                   title,
//                   style: const TextStyle(
//                     fontFamily: 'PlayfairDisplay',
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 28.0,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 20, top: 10),
//                 child: Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(3),
//                           color: Colors.blue,
//                         ),
//                         child: const Padding(
//                           padding: EdgeInsets.symmetric(
//                             horizontal: 5,
//                             vertical: 3,
//                           ),
//                           child: Text(
//                             'Flutter',
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 13,
//                               fontWeight: FontWeight.w800,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(3),
//                           color: Colors.yellow,
//                         ),
//                         child: const Padding(
//                           padding: EdgeInsets.symmetric(
//                             horizontal: 5,
//                             vertical: 3,
//                           ),
//                           child: Text(
//                             'Public api',
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 13,
//                               fontWeight: FontWeight.w800,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
//                 child: Text(
//                   desc1,
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 15,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 20, right: 20),
//                 child: Text(
//                   desc2,
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 15,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
//                 child: WinddowsGooglePlayButton(
//                   screenWidth: screenWidth * 0.4,
//                   url: link,
//                 ).showCursorOnHover,
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//             ],
//           ),
//         ),
//         Positioned.fill(
//           top: 15,
//           child: Align(
//             alignment: Alignment.topRight,
//             child: GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Container(
//                 height: 35,
//                 width: 35,
//                 decoration: const BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.red,
//                 ),
//                 child: const Icon(
//                   Icons.close,
//                   size: 18,
//                   color: Colors.white,
//                 ).showCursorOnHover,
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
