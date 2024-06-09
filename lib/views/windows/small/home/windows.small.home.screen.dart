import 'package:flutter/material.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/windows/common/flutter_developer_container.dart';
import 'package:spnk/views/windows/common/hi_name_text.dart';
import 'package:spnk/views/windows/large/home/windows.large.home.widgets/social.media.icons/social.media.icons.list.dart';

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: screenHeight * 0.05),
        AnimatedOpacity(
          opacity: showLottie ? 1 : 0,
          duration: const Duration(milliseconds: 600),
          child: Container(
            margin: EdgeInsets.only(
              left: screenWidth * 0,
            ),
            child: Image.asset(
              'assets/images/dash/dash1.png',
              height: 220,
            ),
          ),
        ),
        HiNameContainer(
          showName: showName,
          screenWidth: screenWidth,
          leftPadding: 50,
        ),
        const SizedBox(height: 10),
        FlutterDeveloperContainer(
          showName: showName,
          leftPadding: 50,
          screenWidth: screenWidth,
        ),
        SizedBox(height: screenHeight * 0.05),
        Row(
          children: [
            SizedBox(width: screenWidth * 0.05),
            const SocialMediaIconsList(),
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
