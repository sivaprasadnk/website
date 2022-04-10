import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/windows/hover_extensions.dart';

class WindowsMediumProjectsScreen extends StatefulWidget {
  const WindowsMediumProjectsScreen({Key? key}) : super(key: key);

  @override
  State<WindowsMediumProjectsScreen> createState() =>
      _WindowsMediumProjectsScreenState();
}

class _WindowsMediumProjectsScreenState
    extends State<WindowsMediumProjectsScreen> {
  PageController controller = PageController();
  bool showLottie = false;
  bool showNextIcon = true;

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

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
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    return Stack(
      children: [
        Container(
          child: Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.18),
                FadeInRight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            // color: Colors.black,
                            height: screenHeight * 0.5,
                            width: screenWidth * 0.7,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: PageView(
                                controller: controller,
                                children: [
                                  SpQuotesProjectItem(width: screenWidth),
                                  SpQuizProjectItem(width: screenWidth),
                                ],
                              ),
                            ),
                          ),
                          if (!showNextIcon)
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: GestureDetector(
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
                              ),
                            ),
                          if (showNextIcon)
                            Positioned.fill(
                              right: 30,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
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
                              ),
                            )
                        ],
                      ),
                    ],
                  ),
                ),
                // Row(
                //   children: [
                //     if (!showNextIcon)
                //       GestureDetector(
                //         onTap: () {
                //           controller.previousPage(
                //             duration: Duration(seconds: 1),
                //             curve: Curves.bounceOut,
                //           );
                //           setState(() {
                //             showNextIcon = true;
                //           });
                //         },
                //         child: Icon(
                //           Icons.arrow_back_ios,
                //           color: Colors.white,
                //         ).showCursorOnHover,
                //       ),
                //     SizedBox(width: screenWidth * 0.13),
                //     if (showNextIcon)
                //       GestureDetector(
                //         onTap: () {
                //           controller.nextPage(
                //             duration: Duration(seconds: 1),
                //             curve: Curves.bounceOut,
                //           );
                //           setState(() {
                //             showNextIcon = false;
                //           });
                //         },
                //         child: Icon(
                //           Icons.arrow_forward_ios,
                //           color: Colors.white,
                //         ).showCursorOnHover,
                //       ),
                //   ],
                // ),
                // Flexible(
                //   child: AnimatedOpacity(
                //     duration: Duration(seconds: 2),
                //     opacity: showLottie ? 1 : 0,
                //     child: Image.asset(
                //       'assets/images/dash/dash3.png',
                //       height: 250,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          // top: 50,
          right: -50,
          child: Align(
            alignment: Alignment.bottomRight,
            child: AnimatedOpacity(
              duration: const Duration(seconds: 2),
              opacity: showLottie ? 1 : 0,
              child: Container(
                // color: Colors.amber,
                child: Image.asset(
                  'assets/images/dash/dash3.png',
                  height: 280,
                ),
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
          padding: EdgeInsets.only(left: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Text(
                title,
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(height: 20),
              Flexible(
                child: SizedBox(
                  // color: Colors.amber,
                  width: width * 0.32,
                  child: Text(
                    description,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: WinddowsGooglePlayButton(
                      screenWidth: width,
                      url: link,
                    ).showCursorOnHover,
                  ),
                  const SizedBox(width: 20),
                  // QrImage(
                  //   backgroundColor: Colors.white,
                  //   data: spQuotesLink,
                  //   version: QrVersions.auto,
                  //   size: 75.0,
                  // ),
                ],
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
