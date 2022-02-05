import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spnk/utils/common_widgets.dart';

class WindowsSmallHomeScreen extends StatelessWidget {
  final bool showProPic;
  WindowsSmallHomeScreen({required this.showProPic});
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    var size = screenWidth / 11;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight * 0.15),
          Container(
            margin: EdgeInsets.only(
              left: screenWidth * 0.15,
            ),
            child: Lottie.asset(
              'assets/lotties/robot_hello.json',
              height: 180,
            ),
          ),
          Flexible(
            child: Container(
              margin: EdgeInsets.only(
                left: screenWidth * 0.15,
              ),
              width: screenWidth * 0.52,
              child: FittedBox(
                child: Text(
                  "Hi ,\nI 'm Sivaprasad NK .",
                  style: TextStyle(
                    fontFamily: 'PlayfairDisplay',
                    fontWeight: FontWeight.bold,
                    // fontSize: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.15, top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FlutterLogo(
                  size: size / 1.8,
                  style: FlutterLogoStyle.markOnly,
                ),
                Text(
                  ' Flutter Developer from Tripunithura, Kerala .',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size / 2.8,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.08),
          AnimatedOpacity(
            duration: Duration(seconds: 2),
            opacity: showProPic ? 1 : 0,
            child: Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.2),
              child: ProPicMediumWithBlob(
                height: screenHeight * 0.3,
                bottomPadding: screenHeight * .02,
                leftPadding: screenWidth * 0.02,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
