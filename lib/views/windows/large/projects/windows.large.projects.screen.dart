import "package:flutter/material.dart";
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/windows/hover_extensions.dart';
import 'package:spnk/views/windows/large/common.widgets/section.title.dart';

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
    Future.delayed(const Duration(seconds: 1)).then((value) {
      setState(() {
        showLottie = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.2),
              WindowsLargeSectionTitle(
                title: 'My Projects',
                width: screenWidth,
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
                            duration: const Duration(seconds: 1),
                            curve: Curves.bounceOut,
                          );
                          setState(() {
                            showNextIcon = true;
                          });
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Theme.of(context).splashColor,
                        ).showCursorOnHover,
                      ),
                    SizedBox(width: screenWidth * 0.13),
                    if (showNextIcon)
                      GestureDetector(
                        onTap: () {
                          controller.nextPage(
                            duration: const Duration(seconds: 1),
                            curve: Curves.bounceOut,
                          );
                          setState(() {
                            showNextIcon = false;
                          });
                        },
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Theme.of(context).splashColor,
                        ).showCursorOnHover,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          top: 100,
          left: 400,
          right: -300,
          child: Align(
            child: AnimatedOpacity(
              duration: const Duration(seconds: 2),
              opacity: showLottie ? 1 : 0,
              child: Image.asset(
                'assets/images/dash/dash3.png',
                height: 300,
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
  const ProjectItem({
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
          padding: const EdgeInsets.only(top: 10),
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
              const SizedBox(height: 30),
              Text(
                title,
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(height: 25),
              Flexible(
                child: SizedBox(
                  // color: Colors.amber,
                  width: width * 0.28,
                  child: Text(
                    description,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
  const SpQuizProjectItem({required this.width});
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
  const SpQuotesProjectItem({required this.width});
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
