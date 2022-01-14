import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import "package:hovering/hovering.dart";
import 'package:lottie/lottie.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';

class WindowsHomeContainer extends StatefulWidget {
  final double screenWidth;
  final double screenHeight;
  const WindowsHomeContainer(
      {required this.screenWidth, required this.screenHeight});

  @override
  _WindowsHomeContainerState createState() => _WindowsHomeContainerState();
}

class _WindowsHomeContainerState extends State<WindowsHomeContainer> {
  bool showTree1 = false;
  bool showTree2 = false;
  bool showSanta = false;
  bool showName = false;
  bool showProPic = false;
  double ball1TopPosition = -150;
  double ball2TopPosition = 0;
  double nameTopPosition = -150;
  double leftPosition = -150;
  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration())
    Future.delayed(Duration(milliseconds: 500)).then((value) {
      if (mounted)
        setState(() {
          showName = true;
          ball1TopPosition = -10;
          ball2TopPosition = -30;
          nameTopPosition = MediaQuery.of(context).size.height * 0.08;
          leftPosition = MediaQuery.of(context).size.width * 0.05;
        });
    }).then((value) {
      Future.delayed(Duration(seconds: 1)).then((value) {
        if (mounted)
          setState(() {
            showProPic = true;
          });
      }).then((value) {
        Future.delayed(Duration(seconds: 1)).then((value) {
          if (mounted)
            setState(() {
              showTree1 = true;
            });
        }).then((value) {
          Future.delayed(Duration(seconds: 1)).then((value) {
            if (mounted)
              setState(() {
                showTree2 = true;
              });
          }).then((value) {
            Future.delayed(Duration(seconds: 1)).then((value) {
              if (mounted)
                setState(() {
                  showSanta = true;
                });
            });
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: AnimatedOpacity(
            opacity: 1,
            duration: Duration(milliseconds: 900),
            child: Align(
              child: CustomPaint(
                painter: WindowsHomeBgCurve(ctx: context),
                child: Container(),
              ),
            ),
          ),
        ),
        Positioned.fill(
          left: 50,
          bottom: 100,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: AnimatedOpacity(
              opacity: showTree1 ? 1 : 0,
              duration: Duration(milliseconds: 900),
              child: Container(
                height: MediaQuery.of(context).size.width * 0.2,
                child: Image(
                  height: 100,
                  image: AssetImage('assets/images/xmas_tree.png'),
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          right: MediaQuery.of(context).size.width * 0.1,
          bottom: 100,
          child: Align(
            alignment: Alignment.bottomRight,
            child: AnimatedOpacity(
              opacity: showSanta ? 1 : 0,
              duration: Duration(milliseconds: 900),
              child: Container(
                height: MediaQuery.of(context).size.width * 0.15,
                child: Lottie.network(
                    'https://assets4.lottiefiles.com/packages/lf20_ydn9vde0.json'),
              ),
            ),
          ),
        ),
        Positioned.fill(
          left: 350,
          bottom: 120,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: AnimatedOpacity(
              opacity: showTree2 ? 1 : 0,
              duration: Duration(milliseconds: 900),
              child: Container(
                height: MediaQuery.of(context).size.width * 0.15,
                child: Image(
                  height: 100,
                  image: AssetImage('assets/images/xmas_tree.png'),
                ),
              ),
            ),
          ),
        ),

        if (widget.screenWidth <= 600)
          Positioned.fill(
            top: widget.screenHeight * 0.1,
            left: widget.screenWidth * 0.2,
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Hi, \nI 'm Sivaprasad NK .",
                style: TextStyle(
                  fontFamily: 'PlayfairDisplay',
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        if (widget.screenWidth <= 600)
          Positioned.fill(
            top: widget.screenHeight * 0.2,
            left: widget.screenWidth * 0.2,
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "\nFlutter Developer from Tripunithura, Kerala .",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        // Container(
        //   margin: EdgeInsets.only(left: widget.screenWidth * 0.2),
        //   child: FittedBox(
        //     child: HoverWidget(
        //       onHover: (event) {},
        //       hoverChild: AnimatedTextKit(
        //         animatedTexts: [
        //           ColorizeAnimatedText(
        //             "\nFlutter Developer from Tripunithura, Kerala .",
        //             textStyle: TextStyle(
        //               fontWeight: FontWeight.bold,
        //               fontSize: 23,
        //               color: Colors.white,
        //             ),
        //             colors: [
        //               Colors.purple,
        //               Colors.blue,
        //               Colors.yellow,
        //               Colors.red,
        //             ],
        //           ),
        //         ],
        //       ),
        //       child: Text(
        //         "\nFlutter Developer from Tripunithura, Kerala .",
        //         style: TextStyle(
        //           fontWeight: FontWeight.bold,
        //           fontSize: 23,
        //           color: Colors.white,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        // AnimatedPositioned(
        //   duration: Duration(milliseconds: 500),
        //   left: leftPosition,
        //   top: MediaQuery.of(context).size.height * 0.5,
        //   child: widget.screenWidth > 600
        //       ? Container(
        //           margin: EdgeInsets.only(left: widget.screenWidth * 0.2),
        //           child: FittedBox(
        //             child: HoverWidget(
        //               onHover: (event) {},
        //               hoverChild: AnimatedTextKit(
        //                 animatedTexts: [
        //                   ColorizeAnimatedText(
        //                     "\nFlutter Developer from Tripunithura, Kerala .",
        //                     textStyle: TextStyle(
        //                       fontWeight: FontWeight.bold,
        //                       fontSize: 23,
        //                       color: Colors.white,
        //                     ),
        //                     colors: [
        //                       Colors.purple,
        //                       Colors.blue,
        //                       Colors.yellow,
        //                       Colors.red,
        //                     ],
        //                   ),
        //                 ],
        //               ),
        //               child: Text(
        //                 "\nFlutter Developer from Tripunithura, Kerala .",
        //                 style: TextStyle(
        //                   fontWeight: FontWeight.bold,
        //                   fontSize: 23,
        //                   color: Colors.white,
        //                 ),
        //               ),
        //             ),
        //           ),
        //         )
        //       : Container(),
        // ),
        // Container(
        //   margin: EdgeInsets.only(
        //     left: widget.screenWidth * 0.2,
        //     top: widget.screenHeight * 0.25,
        //   ),
        //   width: widget.screenWidth * 0.25,
        //   child: FittedBox(
        //     child: Text(
        //       "Hi, \nI 'm Sivaprasad NK .",
        //       style: TextStyle(
        //         fontFamily: 'PlayfairDisplay',
        //         fontWeight: FontWeight.bold,
        //         // fontSize: 40,
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        // ),
        // AnimatedPositioned(
        //   duration: Duration(milliseconds: 500),
        //   top: nameTopPosition,
        //   child: Container(
        //     margin: EdgeInsets.only(
        //       left: widget.screenWidth * 0.2,
        //       top: widget.screenHeight * 0.25,
        //     ),
        //     width: widget.screenWidth * 0.25,
        //     child: FittedBox(
        //       child: Text(
        //         "Hi, \nI 'm Sivaprasad NK .",
        //         style: TextStyle(
        //           fontFamily: 'PlayfairDisplay',
        //           fontWeight: FontWeight.bold,
        //           // fontSize: 40,
        //           color: Colors.white,
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
                width: widget.screenWidth / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    widget.screenWidth > 600
                        ? Container(
                            margin: EdgeInsets.only(
                              left: widget.screenWidth * 0.2,
                              top: widget.screenHeight * 0.25,
                            ),
                            width: widget.screenWidth * 0.5,
                            child: FittedBox(
                              child: Text(
                                "Hi, \nI 'm Sivaprasad NK .",
                                style: TextStyle(
                                  fontFamily: 'PlayfairDisplay',
                                  fontWeight: FontWeight.bold,
                                  // fontSize: 40,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    Container(
                      margin: EdgeInsets.only(left: widget.screenWidth * 0.2),
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
                          child: Text(
                            "\nFlutter Developer from Tripunithura, Kerala .",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              color: Colors.white,
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
              width: widget.screenWidth / 2,
              child: Stack(
                children: [
                  Positioned.fill(
                    bottom: widget.screenHeight * 0.45,
                    right: MediaQuery.of(context).size.width * 0.2,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 900),
                        opacity: showProPic ? 1 : 0,
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(50.0),
                              child: CircleAvatar(
                                radius: 100,
                                backgroundImage: AssetImage(proPicAssetPath),
                              ),
                            ),
                            Positioned.fill(
                              top: 10,
                              right: 20,
                              child: Align(
                                alignment: Alignment.topRight,
                                child: RotationTransition(
                                  turns: new AlwaysStoppedAnimation(330 / 360),
                                  child: SizedBox(
                                    height: 330,
                                    child: Lottie.network(
                                      'https://assets4.lottiefiles.com/packages/lf20_zmIJEx.json',
                                      // height: 50,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        //     Positioned.fill(
                        //   bottom: widget.screenHeight * 0.35,
                        //   right: MediaQuery.of(context).size.width * 0.01,
                        //   child: Align(
                        //     alignment: Alignment.bottomCenter,
                        //     child: AnimatedOpacity(
                        //       duration: Duration(milliseconds: 900),
                        //       opacity: showProPic ? 1 : 0,
                        //       child: Stack(
                        //         children: [
                        //           Padding(
                        //             padding: const EdgeInsets.all(50.0),
                        //             // child: CircleAvatar(
                        //             //   radius: 100,
                        //             //   backgroundImage: AssetImage(proPicAssetPath),
                        //             // ),
                        //             child: HoverWidget(
                        //               onHover: (event) {},
                        //               child: Stack(
                        //                 children: [
                        //                   Padding(
                        //                     padding: const EdgeInsets.all(50.0),
                        //                     child: CircleAvatar(
                        //                       radius: 100,
                        //                       backgroundImage:
                        //                           AssetImage(proPicAssetPath),
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //               hoverChild: CircleAvatar(
                        //                 radius: 125,
                        //                 backgroundImage: AssetImage(proPicAssetPath),
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // )
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
