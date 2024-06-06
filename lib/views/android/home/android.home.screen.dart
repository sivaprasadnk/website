import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';
import 'package:spnk/views/windows/large/home/windows.large.home.widgets/social.media.icons/social.media.icons.list.dart';

class AndroidHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/images/dash/dash1.png',
          height: 190,
        ),
        Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.1),
          child: FadeInDown(
            child: SizedBox(
              width: screenWidth * 0.7,
              child: FittedBox(
                child: Text(
                  "Hi , \nI 'm Sivaprasad NK .",
                  style: TextStyle(
                    fontFamily: kRajdhaniFontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.1, top: 15),
          child: FadeInLeft(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const FlutterLogo(
                      size: 30,
                    ),
                    Text(
                      ' Flutter Developer from',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: kRajdhaniFontFamily,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  ' Tripunithura, Kerala .',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: kRajdhaniFontFamily,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.05),
        Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.1),
          child: Row(
            children: [
              const SocialMediaIconsList(
                isMobile: true,
              ),
              SizedBox(
                width: screenWidth * 0.1,
              ),
              ProPicMediumWithBlob(
                height: screenHeight * 0.3,
              ),
            ],
          ),
        ),
        SizedBox(height: screenHeight * 0.05),
      ],
    );
  }
}
// class AndroidHomeScreen extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final screenSize = MediaQuery.of(context).size;

//     final screenWidth = screenSize.width;
//     final screenHeight = screenSize.height;
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(height: screenHeight * 0.23),
//         Positioned.fill(
//           top: screenHeight * 0.05,
//           child: Align(
//             alignment: Alignment.topCenter,
//             child: Image.asset(
//               'assets/images/dash/dash1.png',
//               height: 230,
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(left: screenWidth * 0.1),
//           child: FadeInDown(
//             child: SizedBox(
//               width: screenWidth * 0.7,
//               child: FittedBox(
//                 child: Text(
//                   "Hi , \nI 'm Sivaprasad NK .",
//                   style: TextStyle(
//                     fontFamily: kRajdhaniFontFamily,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 40,
//                     color: kWhiteColor,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(left: screenWidth * 0.1, top: 15),
//           child: FadeInLeft(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     const FlutterLogo(
//                       size: 30,
//                     ),
//                     Text(
//                       ' Flutter Developer from',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                         fontFamily: kRajdhaniFontFamily,
//                         color: kWhiteColor,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 5),
//                 Text(
//                   ' Tripunithura, Kerala .',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,
//                     fontFamily: kRajdhaniFontFamily,
//                     color: kWhiteColor,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(height: screenHeight * 0.05),
//         Flexible(
//           child: Padding(
//             padding: EdgeInsets.only(left: screenWidth * 0.1),
//             child: Row(
//               children: [
//                 const SocialMediaIconsList(
//                   isMobile: true,
//                 ),
//                 SizedBox(
//                   width: screenWidth * 0.1,
//                 ),
//                 ProPicMediumWithBlob(
//                   height: screenHeight * 0.3,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(height: screenHeight * 0.05),
//       ],
//     );
//   }
// }
