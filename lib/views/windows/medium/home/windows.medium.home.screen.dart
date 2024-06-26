import 'package:flutter/material.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/windows/common/intro_text.dart';

class WindowsMediumHomeScreen extends StatefulWidget {
  @override
  _WindowsMediumHomeScreenState createState() =>
      _WindowsMediumHomeScreenState();
}

class _WindowsMediumHomeScreenState extends State<WindowsMediumHomeScreen> {
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
    Future.delayed(const Duration(milliseconds: 1500)).then((value) {
        setState(() {
        showProPic = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    // const mobileWidth = 392;
    const mobileHeigth = 804;
    // final widthFactor = screenWidth / mobileWidth;
    final heightFactor = screenHeight / mobileHeigth;
    // var size = screenWidth / 15;
    final leftPadding = screenWidth * 0.09;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        IntroText(
          leftPadding: leftPadding,
          topPadding: screenHeight * .06,
          imageHeight: 221,
          showImage: false,
        ),
        SizedBox(height: screenHeight * 0.025),
        Row(
          children: [
            SizedBox(width: leftPadding),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 600),
              opacity: showProPic ? 1 : 0,
              child: Row(
                children: [
                  // const SocialMediaIconsList(),
                  // const SizedBox(width: 50),
                  ProPicMediumWithBlob(
                    width: heightFactor * 302,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
