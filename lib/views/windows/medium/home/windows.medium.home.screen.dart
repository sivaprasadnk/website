import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spnk/utils/common_widgets.dart';

class WindowsMediumHomeScreen extends StatefulWidget {
  @override
  _WindowsMediumHomeScreenState createState() =>
      _WindowsMediumHomeScreenState();
}

class _WindowsMediumHomeScreenState extends State<WindowsMediumHomeScreen> {
  bool showLottie = false;
  bool showName = false;
  bool showProPic = false;

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500)).then((value) {
      setState(() {
        showLottie = true;
      });
    }).then((value) {
      Future.delayed(Duration(milliseconds: 500)).then((value) {
        setState(() {
          showName = true;
        });
      });
    }).then((value) {
      Future.delayed(Duration(milliseconds: 1500)).then((value) {
        setState(() {
          showProPic = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    var size = screenWidth / 15;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight * 0.1),
          AnimatedOpacity(
            duration: Duration(seconds: 1),
            opacity: showLottie ? 1 : 0,
            child: Container(
              margin: EdgeInsets.only(left: screenWidth * 0.15),
              child: Lottie.asset(
                'assets/lotties/robot_hello.json',
                height: 200,
              ),
            ),
          ),
          AnimatedOpacity(
            duration: Duration(seconds: 1),
            opacity: showName ? 1 : 0,
            child: Container(
              margin: EdgeInsets.only(
                left: screenWidth * 0.1,
              ),
              width: screenWidth * 0.4,
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
          AnimatedOpacity(
            duration: Duration(seconds: 1),
            opacity: showName ? 1 : 0,
            child: Padding(
              padding: EdgeInsets.only(
                top: 10,
                left: screenWidth * 0.1,
              ),
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
          ),
          SizedBox(height: screenHeight * 0.08),
          AnimatedOpacity(
            duration: Duration(seconds: 2),
            opacity: showProPic ? 1 : 0,
            child: Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.25),
              child: ProPicMediumWithBlob(
                height: screenHeight * .32,
                bottomPadding: screenHeight * .02,
                leftPadding: screenWidth * 0.015,
              ),
              // child: Stack(
              //   children: [
              //     Lottie.asset(
              //       blobLottieAssetPath,
              //       height: 280,
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.only(left: 40, top: 40),
              //       child: CircleAvatar(
              //         radius: 100,
              //         backgroundColor: Colors.transparent,
              //         backgroundImage: AssetImage(proPicAssetPath),
              //       ),
              //     ),
              //   ],
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
