import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';

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
    // var size = screenWidth / 25;
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
                    DashImage(showLottie: showLottie, screenWidth: screenWidth),

                    // RobotLottie(
                    //     screenWidth: screenWidth, showLottie: showLottie),
                    HiNameContainer(
                        showName: showName, screenWidth: screenWidth),
                    SizedBox(height: 20),
                    FlutterDeveloperWidget(
                        showName: showName, screenWidth: screenWidth),
                  ],
                ),
              ),
            ),
            ProPic(
              screenWidth: screenWidth,
              showPic: showProPic,
            )
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

class HiNameContainer extends StatelessWidget {
  const HiNameContainer({
    Key? key,
    required this.showName,
    required this.screenWidth,
  }) : super(key: key);

  final bool showName;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(seconds: 1),
      opacity: showName ? 1 : 0,
      child: Container(
        margin: EdgeInsets.only(
          left: screenWidth * 0.15,
        ),
        width: screenWidth * 0.3,
        child: HiText(),
      ),
    );
  }
}

class HiText extends StatelessWidget {
  const HiText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Hi , \nI 'm Sivaprasad NK .",
      style: TextStyle(
        fontFamily: 'PlayfairDisplay',
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: Colors.white,
      ),
    );
  }
}

class FlutterDeveloperWidget extends StatelessWidget {
  const FlutterDeveloperWidget({
    Key? key,
    required this.showName,
    required this.screenWidth,
  }) : super(key: key);

  final bool showName;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(seconds: 1),
      opacity: showName ? 1 : 0,
      child: Container(
        margin: EdgeInsets.only(
          left: screenWidth * 0.15,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FlutterLogo(
              size: 30,
              style: FlutterLogoStyle.markOnly,
            ),
            FlutterDeveloperText()
          ],
        ),
      ),
    );
  }
}

class FlutterDeveloperText extends StatelessWidget {
  const FlutterDeveloperText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      ' Flutter Developer from Tripunithura, Kerala .',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white,
      ),
    );
  }
}

class ProPic extends StatelessWidget {
  const ProPic({
    Key? key,
    required this.showPic,
    required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;
  final bool showPic;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: screenWidth / 1.8,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.23,
            ),
            // ProPicMediumWithBlob()
            // ProPicLargeWithBlob()
            AnimatedOpacity(
              opacity: showPic ? 1 : 0,
              duration: Duration(milliseconds: 500),
              child: Stack(
                children: [
                  Lottie.asset(blobLottieAssetPath, height: 350),
                  Padding(
                    padding: const EdgeInsets.all(60.0),
                    child: CircleAvatar(
                      radius: 115,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(proPicAssetPath),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
