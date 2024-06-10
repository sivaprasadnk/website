import 'package:flutter/material.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/windows/common/intro_text.dart';

class WindowsSmallHomeScreen extends StatefulWidget {
  final bool showProPic;
  const WindowsSmallHomeScreen({required this.showProPic});

  @override
  State<WindowsSmallHomeScreen> createState() => _WindowsSmallHomeScreenState();
}

class _WindowsSmallHomeScreenState extends State<WindowsSmallHomeScreen> {
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
    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      setState(() {
        showLottie = true;
      });
    }).then((value) {
      Future.delayed(const Duration(milliseconds: 500)).then((value) {
        setState(() {
          showName = true;
        });
      }).then((value) {

        Future.delayed(const Duration(milliseconds: 500)).then((value) {
          setState(() {
            showProPic = true;
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Column(
      children: [
        IntroText(
          leftPadding: screenWidth * .2,
          topPadding: screenHeight * 0.08,
          imageHeight: 190,
        ),
        SizedBox(height: screenHeight * 0.05),
        Row(
          children: [
            SizedBox(width: screenWidth * 0.05),
            // const SocialMediaIconsList(),
            SizedBox(width: screenWidth * 0.12),
            AnimatedOpacity(
              duration: const Duration(seconds: 2),
              opacity: showProPic ? 1 : 0,
              child: ProPicMediumWithBlob(
                height: screenHeight * 0.35,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
