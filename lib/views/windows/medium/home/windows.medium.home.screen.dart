import 'package:flutter/material.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/windows/common/dash_image.dart';
import 'package:spnk/views/windows/common/flutter_developer_container.dart';
import 'package:spnk/views/windows/common/hi_name_text.dart';
import 'package:spnk/views/windows/large/home/windows.large.home.widgets/social.media.icons/social.media.icons.list.dart';

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
    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      setState(() {
        showLottie = true;
      });
    }).then((value) {
      Future.delayed(const Duration(milliseconds: 500)).then((value) {
        setState(() {
          showName = true;
        });
      });
    }).then((value) {
      Future.delayed(const Duration(milliseconds: 1500)).then((value) {
        setState(() {
          showProPic = true;
        });
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
        SizedBox(height: screenHeight * 0.06),
        DashImage(
          showLottie: showLottie,
          leftPadding: leftPadding,
          size: 221,
        ),
        // DashImageMedium(showLottie: showLottie, screenWidth: screenWidth),
        HiNameContainer(
          showName: showName,
          leftPadding: leftPadding,
          screenWidth: screenWidth,
        ),
        SizedBox(height: heightFactor * 11),
        FlutterDeveloperContainer(
          showName: showName,
          leftPadding: leftPadding,
          screenWidth: screenWidth,
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
                  const SocialMediaIconsList(),
                  const SizedBox(width: 50),
                  ProPicMediumWithBlob(
                    height: heightFactor * 302,
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
