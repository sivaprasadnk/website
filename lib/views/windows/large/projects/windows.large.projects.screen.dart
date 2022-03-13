import 'package:animate_do/animate_do.dart';
import "package:flutter/material.dart";
import 'package:lottie/lottie.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/windows/hover_extensions.dart';

class WindowsLargeProjectScreen extends StatefulWidget {
  @override
  _WindowsLargeProjectScreenState createState() =>
      _WindowsLargeProjectScreenState();
}

class _WindowsLargeProjectScreenState extends State<WindowsLargeProjectScreen>
    with AutomaticKeepAliveClientMixin {
  PageController controller = PageController();

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  bool get wantKeepAlive => true;

  bool showNextIcon = true;
  bool showLottie = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1)).then((value) {
      setState(() {
        showLottie = true;
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
        Container(
          child: Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.2),
                FadeInDown(
                  child: Container(
                    width: screenWidth * 0.25,
                    padding: EdgeInsets.only(left: screenWidth * 0.1),
                    child: FittedBox(
                      child: Text(
                        "My Projects",
                        style: TextStyle(
                          fontFamily: 'PlayfairDisplay',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.1),
                // Stack(
                //   children: [
                //     Container(
                //       // color: Colors.black,
                //       height: screenHeight * 0.5,
                //       width: screenWidth * 0.9,
                //       padding: EdgeInsets.only(left: screenWidth * 0.1),
                //       child: PageView(
                //         controller: controller,
                //         children: [
                //           SpQuotesProjectItem(width: screenWidth),
                //           SpQuizProjectItem(width: screenWidth),
                //         ],
                //       ),
                //     ),
                //     if (showNextIcon)
                //       Positioned.fill(
                //         right: screenWidth * 0.05,
                //         child: Align(
                //           alignment: Alignment.bottomCenter,
                //           child: GestureDetector(
                //             onTap: () {
                //               controller.nextPage(
                //                 duration: Duration(seconds: 1),
                //                 curve: Curves.bounceOut,
                //               );
                //               setState(() {
                //                 showNextIcon = false;
                //               });
                //             },
                //             child: CircleAvatar(
                //               backgroundColor: Colors.grey,
                //               child: Icon(
                //                 Icons.arrow_forward_ios,
                //                 color: Colors.black,
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     if (!showNextIcon)
                //       Positioned.fill(
                //         child: Align(
                //           alignment: Alignment.centerLeft,
                //           child: GestureDetector(
                //             onTap: () {
                //               controller.previousPage(
                //                 duration: Duration(seconds: 1),
                //                 curve: Curves.bounceOut,
                //               );
                //               setState(() {
                //                 showNextIcon = true;
                //               });
                //             },
                //             child: CircleAvatar(
                //               backgroundColor: Colors.grey,
                //               child: Icon(
                //                 Icons.arrow_back_ios_new,
                //                 color: Colors.black,
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //   ],
                // ),

                Row(
                  children: [
                    Container(
                      // color: Colors.black,
                      height: screenHeight * 0.5,
                      width: screenWidth * 0.6,
                      padding: EdgeInsets.only(left: screenWidth * 0.1),
                      child: PageView(
                        controller: controller,
                        children: [
                          SpQuotesProjectItem(width: screenWidth),
                          SpQuizProjectItem(width: screenWidth),
                        ],
                      ),
                    ),
                    // Container(
                    //   color: Colors.black,
                    //   child: Lottie.asset(
                    //     'assets/lotties/astronaut-laptop.json',
                    //     height: 280,
                    //   ),
                    // )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.1),
                  child: Row(
                    children: [
                      if (!showNextIcon)
                        GestureDetector(
                          onTap: () {
                            controller.previousPage(
                              duration: Duration(seconds: 1),
                              curve: Curves.bounceOut,
                            );
                            setState(() {
                              showNextIcon = true;
                            });
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ).showCursorOnHover,
                        ),
                      SizedBox(width: screenWidth * 0.13),
                      if (showNextIcon)
                        GestureDetector(
                          onTap: () {
                            controller.nextPage(
                              duration: Duration(seconds: 1),
                              curve: Curves.bounceOut,
                            );
                            setState(() {
                              showNextIcon = false;
                            });
                          },
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ).showCursorOnHover,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          top: 100,
          right: 50,
          child: Align(
            alignment: Alignment.centerRight,
            child: AnimatedOpacity(
              duration: Duration(seconds: 2),
              opacity: showLottie ? 1 : 0,
              child: Lottie.asset(
                // 'assets/lotties/astronaut-laptop.json',
                // 'assets/lotties/online-work.json',
                // 'assets/lotties/dev5.json',
                'assets/lotties/dev8.json',
                // 'assets/lotties/dev1.json',
                height: screenHeight * 0.22,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class ProjectItem extends StatelessWidget {
  final String title;
  final String link;
  final String assetPath;
  final String description;
  final double width;
  ProjectItem({
    required this.link,
    required this.title,
    required this.assetPath,
    required this.description,
    required this.width,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.only(top: 10),
          child: Image(
            width: 150,
            image: AssetImage(
              assetPath,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: width * 0.041),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 25),
              Flexible(
                child: Container(
                  // color: Colors.amber,
                  width: width * 0.28,
                  child: Text(
                    description,
                    style: TextStyle(
                      color: Colors.grey,
                      // fontSize: 15,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: WinddowsGooglePlayButton(
                  screenWidth: width,
                  url: link,
                ).showCursorOnHover,
              )
            ],
          ),
        )
      ],
    );
  }
}

class SpQuizProjectItem extends StatelessWidget {
  final double width;
  SpQuizProjectItem({required this.width});
  @override
  Widget build(BuildContext context) {
    return ProjectItem(
      link: spQuizLink,
      title: 'SP Quiz App',
      assetPath: 'assets/images/quizApp/screen2.png',
      description: quizStr1 + quizStr2 + quizStr3 + quizStr4 + quizStr5,
      width: width,
    );
  }
}

class SpQuotesProjectItem extends StatelessWidget {
  final double width;
  SpQuotesProjectItem({required this.width});
  @override
  Widget build(BuildContext context) {
    return ProjectItem(
      link: spQuotesLink,
      title: 'SP Quotes App',
      assetPath: 'assets/images/quotesApp/screen1.png',
      description: quoteStr1 + quoteStr2 + quoteStr3 + quoteStr4,
      width: width,
    );
  }
}
