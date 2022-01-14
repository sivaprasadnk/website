import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import "package:hovering/hovering.dart";
import 'package:lottie/lottie.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/views/windows/hover_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

class WindowsHomeLargeScreen extends StatefulWidget {
  @override
  _WindowsHomeLargeScreenState createState() => _WindowsHomeLargeScreenState();
}

class _WindowsHomeLargeScreenState extends State<WindowsHomeLargeScreen> {
  late Widget fbPng;
  late Widget waPng;
  late Widget instaPng;
  late Widget linkedInPng;

  bool showName = false;
  bool showProPic = false;
  bool showLottie = false;
  double nameTopPosition = -150;
  double leftPosition = -150;
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
            nameTopPosition = MediaQuery.of(context).size.height * 0.08;
            leftPosition = MediaQuery.of(context).size.width * 0.05;
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
    double iconSize = 30;
    fbPng = Image.asset(fbPngAssetName, height: iconSize);
    waPng = Image.asset(whatsappPngeAssetName, height: iconSize);
    instaPng = Image.asset(instaPngImageName, height: iconSize);
    linkedInPng = Image.asset(linkedInAssetName,
        height: iconSize, color: Colors.blue[900]);
    return Stack(
      children: [
        // Positioned.fill(
        //   child: AnimatedOpacity(
        //     opacity: 1,
        //     duration: Duration(milliseconds: 900),
        //     child: Align(
        //       child: CustomPaint(
        //         painter: WindowsHomeBgCurve(ctx: context),
        //         child: Container(),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.25,
                    ),
                    AnimatedOpacity(
                      duration: Duration(seconds: 1),
                      opacity: showLottie ? 1 : 0,
                      child: Lottie.asset(
                        'assets/lotties/robot_hello.json',
                        height: 200,
                      ),
                    ),
                    AnimatedOpacity(
                      duration: Duration(seconds: 1),
                      opacity: showName ? 1 : 0,
                      child: Container(
                        margin: EdgeInsets.only(
                          left: screenWidth * 0.2,
                        ),
                        width: screenWidth * 0.5,
                        child: FittedBox(
                          child: Text(
                            "I 'm Sivaprasad NK .",
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
                          margin: EdgeInsets.only(left: screenWidth * 0.2),
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
                              // child: Text(
                              //   "\nFlutter Developer from Tripunithura, Kerala .",
                              //   style: TextStyle(
                              //     fontWeight: FontWeight.bold,
                              //     fontSize: 23,
                              //     color: Colors.white,
                              //   ),
                              // ),
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
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 900),
                    opacity: showProPic ? 1 : 0,
                    child: Stack(
                      children: [
                        Lottie.asset(blobLottieAssetPath),
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: CircleAvatar(
                            radius: 115,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage(proPicAssetPath),
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 900),
                    opacity: showProPic ? 1 : 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Container(
                            child: fbPng,
                          ),
                          onTap: () {
                            launch(fbLink);
                          },
                        ).showCursorOnHover,
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          child: instaPng,
                          onTap: () {
                            launch(instaLink);
                          },
                        ).showCursorOnHover,
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          child: waPng,
                          onTap: () {
                            launch(whatsappWebLink);
                          },
                        ).showCursorOnHover,
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          child: linkedInPng,
                          onTap: () {
                            launch(linkedInLink);
                          },
                        ).showCursorOnHover,
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
