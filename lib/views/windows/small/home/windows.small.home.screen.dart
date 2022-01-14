import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spnk/utils/common_strings.dart';

class WindowsSmallHomeScreen extends StatelessWidget {
  final bool showProPic;
  WindowsSmallHomeScreen({required this.showProPic});
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight * 0.13),
          Container(
            margin: EdgeInsets.only(
              left: screenWidth * 0.15,
            ),
            child: Lottie.asset(
              'assets/lotties/robot_hello.json',
              height: 200,
            ),
          ),
          Flexible(
            child: Container(
              margin: EdgeInsets.only(
                left: screenWidth * 0.15,
              ),
              width: screenWidth * 0.7,
              child: FittedBox(
                child: Text(
                  "I 'm Sivaprasad NK .",
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
            padding: EdgeInsets.only(left: screenWidth * 0.15),
            child: AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  "\nFlutter Developer from Tripunithura, Kerala .",
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  colors: [
                    Colors.cyan,
                    Colors.blue,
                    Colors.yellow,
                    Colors.red,
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.05),
          AnimatedOpacity(
            duration: Duration(seconds: 2),
            opacity: showProPic ? 1 : 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.2),
                  child: Stack(
                    children: [
                      Lottie.asset(
                        blobLottieAssetPath,
                        height: 280,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, top: 40),
                        child: CircleAvatar(
                          radius: 100,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(proPicAssetPath),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}