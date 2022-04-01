import 'package:flutter/material.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/windows/common/flutter_developer_container.dart';
import 'package:spnk/views/windows/common/hi_name_text.dart';

class WindowsSmallHomeScreen extends StatefulWidget {
  final bool showProPic;
  WindowsSmallHomeScreen({required this.showProPic});

  @override
  State<WindowsSmallHomeScreen> createState() => _WindowsSmallHomeScreenState();
}

class _WindowsSmallHomeScreenState extends State<WindowsSmallHomeScreen> {
  bool showLottie = false;
  bool showName = false;
  bool showProPic = false;
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
      }).then((value) {
        Future.delayed(Duration(milliseconds: 500)).then((value) {
          setState(() {
            showProPic = true;
          });
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
          SizedBox(height: screenHeight * 0.05),
          AnimatedOpacity(
            opacity: showLottie ? 1 : 0,
            duration: Duration(milliseconds: 600),
            child: Container(
              margin: EdgeInsets.only(
                left: screenWidth * 0.12,
              ),
              child: Image.asset(
                'assets/images/dash/dash1.png',
                height: 220,
              ),
              // child: Lottie.asset(
              //   'assets/lotties/robot_hello.json',
              //   height: 180,
              // ),
            ),
          ),
          HiNameContainer(
            showName: showName,
            screenWidth: screenWidth,
            leftPadding: 0,
          ),
          SizedBox(height: 10),
          FlutterDeveloperContainer(
              showName: showName, screenWidth: screenWidth),
          SizedBox(height: screenHeight * 0.01),
          AnimatedOpacity(
            duration: Duration(seconds: 2),
            opacity: showProPic ? 1 : 0,
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
