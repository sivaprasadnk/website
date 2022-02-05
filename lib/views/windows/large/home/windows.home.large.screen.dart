import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spnk/utils/common_widgets.dart';

class WindowsHomeLargeScreen extends StatefulWidget {
  @override
  _WindowsHomeLargeScreenState createState() => _WindowsHomeLargeScreenState();
}

class _WindowsHomeLargeScreenState extends State<WindowsHomeLargeScreen> {
  bool showName = false;
  bool showProPic = false;
  bool showLottie = false;
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 500)).then((value) {
      setState(() {
        showLottie = true;
      });
    }).then((value) {
      Future.delayed(Duration(milliseconds: 500)).then((value) {
        if (mounted)
          setState(() {
            showName = true;
          });
      }).then((value) {
        Future.delayed(Duration(seconds: 1)).then((value) {
          if (mounted)
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
    var size = screenWidth / 25;
    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedOpacity(
              opacity: showName ? 1 : 0,
              duration: Duration(milliseconds: 900),
              child: Container(
                // color: Colors.amber,
                width: screenWidth / 1.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.15,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * .23),
                      child: AnimatedOpacity(
                        duration: Duration(seconds: 1),
                        opacity: showLottie ? 1 : 0,
                        child: Lottie.asset(
                          'assets/lotties/robot_hello.json',
                          height: 200,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      duration: Duration(seconds: 1),
                      opacity: showName ? 1 : 0,
                      child: Container(
                        margin: EdgeInsets.only(left: screenWidth * 0.23),
                        width: screenWidth * 0.2,
                        child: FittedBox(
                          child: Text(
                            "Hi , \nI 'm Sivaprasad NK .",
                            style: TextStyle(
                              fontFamily: 'PlayfairDisplay',
                              fontWeight: FontWeight.bold,
                              // fontSize: 40,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    AnimatedOpacity(
                      duration: Duration(seconds: 1),
                      opacity: showName ? 1 : 0,
                      child: Container(
                        margin: EdgeInsets.only(left: screenWidth * 0.23),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            FlutterLogo(
                              size: size / 1.8,
                              style: FlutterLogoStyle.markOnly,
                            ),
                            Text(
                              ' Flutter Developer from Tripunithura, Kerala .',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: size / 2.8,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Container(
                width: screenWidth / 1.8,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.23,
                    ),
                    // ProPicMediumWithBlob()
                    ProPicLargeWithBlob()
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
