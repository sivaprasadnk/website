import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spnk/utils/common_widgets.dart';

class WindowsSmallHomeScreen extends StatefulWidget {
  final bool showProPic;
  WindowsSmallHomeScreen({required this.showProPic});

  @override
  State<WindowsSmallHomeScreen> createState() => _WindowsSmallHomeScreenState();
}

class _WindowsSmallHomeScreenState extends State<WindowsSmallHomeScreen> {
  bool showLottie = false;
  bool showName = false;
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
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    // var size = screenWidth / 11;

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
          HiNameContainer(showName: showName, screenWidth: screenWidth),
          SizedBox(height: 10),
          FlutterDeveloperContainer(
              showName: showName, screenWidth: screenWidth),
          SizedBox(height: screenHeight * 0.04),
          AnimatedOpacity(
            duration: Duration(seconds: 2),
            opacity: widget.showProPic ? 1 : 0,
            child: Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.2),
                child: ProPicWithBlobLottie()

                // child: ProPicMediumWithBlob(
                //   height: screenHeight * 0.3,
                //   bottomPadding: screenHeight * .02,
                //   leftPadding: screenWidth * 0.02,
                // ),
                ),
          ),
        ],
      ),
    );
  }
}
