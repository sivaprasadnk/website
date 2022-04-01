import 'package:flutter/material.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/windows/common/dash_image.dart';
import 'package:spnk/views/windows/common/flutter_developer_container.dart';
import 'package:spnk/views/windows/common/hi_name_text.dart';

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
    // var size = screenWidth / 15;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: screenHeight * 0.06),
        DashImage(
          showLottie: showLottie,
          leftPadding: screenWidth * 0.1,
          size: 221,
        ),
        // DashImageMedium(showLottie: showLottie, screenWidth: screenWidth),
        HiNameContainer(
            showName: showName,
            leftPadding: screenWidth * 0.15,
            screenWidth: screenWidth),
        SizedBox(height: 15),
        FlutterDeveloperContainer(showName: showName, screenWidth: screenWidth),
        SizedBox(height: screenHeight * 0.013),
        AnimatedOpacity(
          duration: Duration(seconds: 2),
          opacity: showProPic ? 1 : 0,
          child: Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.2),
            child: ProPicWithBlobLottie(),
          ),
        ),
      ],
    );
  }
}
