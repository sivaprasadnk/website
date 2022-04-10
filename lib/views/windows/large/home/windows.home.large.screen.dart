import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/windows/common/dash_image.dart';
import 'package:spnk/views/windows/common/flutter_developer_container.dart';
import 'package:spnk/views/windows/common/hi_name_text.dart';

class WindowsHomeLargeScreen extends StatefulWidget {
  @override
  _WindowsHomeLargeScreenState createState() => _WindowsHomeLargeScreenState();
}

class _WindowsHomeLargeScreenState extends State<WindowsHomeLargeScreen>
    with AutomaticKeepAliveClientMixin {
  bool showName = false;
  bool showProPic = false;
  bool showLottie = false;

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  bool get wantKeepAlive => true;

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
        Future.delayed(const Duration(seconds: 1)).then((value) {
          setState(() {
            showProPic = true;
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedOpacity(
          opacity: showName ? 1 : 0,
          duration: const Duration(milliseconds: 900),
          child: SizedBox(
            width: screenWidth / 1.6,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.12),
                DashImage(
                  showLottie: showLottie,
                  leftPadding: screenWidth * 0.1,
                  size: 250,
                ),
                HiNameContainer(
                  showName: showName,
                  leftPadding: screenWidth * 0.15,
                  screenWidth: screenWidth,
                ),
                const SizedBox(height: 20),
                FlutterDeveloperContainer(
                  showName: showName,
                  screenWidth: screenWidth,
                  leftPadding: screenWidth * 0.15,
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: screenHeight * 0.3,
            ),
            ProPicMediumWithBlob(
              height: screenHeight * 0.4,
              bottomPadding: screenHeight * .02,
              leftPadding: screenWidth * 0.01,
            ),
          ],
        ),
        // ProPic(screenWidth: screenWidth, showPic: showProPic)
      ],
    );
  }
}

class RobotLottie extends StatelessWidget {
  const RobotLottie({
    Key? key,
    required this.screenWidth,
    required this.showLottie,
  }) : super(key: key);

  final double screenWidth;
  final bool showLottie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: screenWidth * .23),
      child: AnimatedOpacity(
        duration: const Duration(seconds: 1),
        opacity: showLottie ? 1 : 0,
        child: Lottie.asset(
          'assets/lotties/robot_hello.json',
          height: 200,
        ),
      ),
    );
  }
}
