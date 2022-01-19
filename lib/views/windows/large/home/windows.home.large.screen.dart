import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import "package:hovering/hovering.dart";
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

    return Stack(
      children: [
        // Positioned.fill(
        //   child: AnimatedOpacity(
        //     opacity: 1,
        //     duration: Duration(milliseconds: 900),
        //     child: Align(
        //       child: ClipRRect(
        //         borderRadius: BorderRadius.circular(12),
        //         child: CustomPaint(
        //           painter: WindowsHomeBgCurve(ctx: context),
        //           child: Container(
        //             decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(12),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedOpacity(
              opacity: showName ? 1 : 0,
              duration: Duration(milliseconds: 900),
              child: Container(
                width: screenWidth / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.15,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * .15),
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
                        margin: EdgeInsets.only(left: screenWidth * 0.15),
                        width: screenWidth * 0.3,
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
                    Flexible(
                      child: AnimatedOpacity(
                        duration: Duration(seconds: 1),
                        opacity: showName ? 1 : 0,
                        child: Container(
                          margin: EdgeInsets.only(left: screenWidth * 0.15),
                          child: FittedBox(
                            child: HoverWidget(
                              onHover: (event) {},
                              hoverChild: AnimatedTextKit(
                                animatedTexts: [
                                  ColorizeAnimatedText(
                                    "\nFlutter Developer from Tripunithura, Kerala .",
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23,
                                      color: Colors.white,
                                    ),
                                    colors: [
                                      Colors.purple,
                                      Colors.blue,
                                      Colors.yellow,
                                      Colors.red,
                                    ],
                                  ),
                                ],
                              ),
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  ColorizeAnimatedText(
                                    "\nFlutter Developer from Tripunithura, Kerala .",
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23,
                                      color: Colors.white,
                                    ),
                                    colors: [
                                      Colors.purple,
                                      Colors.blue,
                                      Colors.yellow,
                                      Colors.red,
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: screenWidth / 2,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.23,
                  ),
                  // ProPicMediumWithBlob()
                  ProPicLargeWithBlob()
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
