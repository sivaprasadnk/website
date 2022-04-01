import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spnk/views/windows/common/dash_image.dart';
import 'package:spnk/views/windows/common/flutter_developer_container.dart';
import 'package:spnk/views/windows/common/hi_name_text.dart';
import 'package:spnk/views/windows/large/home/windows.large.home.widgets/pro_pic.dart';

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
        Future.delayed(Duration(seconds: 1)).then((value) {
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
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedOpacity(
              opacity: showName ? 1 : 0,
              duration: Duration(milliseconds: 900),
              child: Container(
                width: screenWidth / 1.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.12),
                    DashImage(
                        showLottie: showLottie,
                        leftPadding: screenWidth * 0.1,
                        size: 250),
                    HiNameContainer(
                        showName: showName,
                        leftPadding: screenWidth * 0.15,
                        screenWidth: screenWidth),
                    SizedBox(height: 20),
                    FlutterDeveloperContainer(
                        showName: showName, screenWidth: screenWidth),
                  ],
                ),
              ),
            ),
            ProPic(screenWidth: screenWidth, showPic: showProPic)
          ],
        ),
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
        duration: Duration(seconds: 1),
        opacity: showLottie ? 1 : 0,
        child: Lottie.asset(
          'assets/lotties/robot_hello.json',
          height: 200,
        ),
      ),
    );
  }
}
