import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/windows/hover_extensions.dart';
import 'package:spnk/views/windows/small/windows.small.common.widgets.dart';

class WindowsSmallProjectsScreen extends StatefulWidget {
  @override
  State<WindowsSmallProjectsScreen> createState() =>
      _WindowsSmallProjectsScreenState();
}

class _WindowsSmallProjectsScreenState
    extends State<WindowsSmallProjectsScreen> {
  PageController controller = PageController();

  bool viewingProj1 = true;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight * 0.13),
          SectionTitle(screenWidth: screenWidth, title: 'My Projects'),
          SizedBox(height: screenHeight * 0.13),
          FadeInRight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: screenWidth * 0.1),
                SizedBox(
                  height: screenHeight * 0.5,
                  width: screenWidth * 0.9,
                  child: PageView(
                    controller: controller,
                    children: [
                      ProjectItem1(
                        width: screenWidth,
                      ),
                      ProjectItem2(
                        width: screenWidth,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(width: screenWidth * 0.13),
              if (!viewingProj1)
                GestureDetector(
                  onTap: () {
                    controller.previousPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.bounceOut,
                    );
                    setState(() {
                      viewingProj1 = true;
                    });
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Theme.of(context).splashColor,
                  ).showCursorOnHover,
                ),
              SizedBox(width: screenWidth * 0.13),
              if (viewingProj1)
                GestureDetector(
                  onTap: () {
                    controller.nextPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.bounceOut,
                    );

                    setState(() {
                      viewingProj1 = false;
                    });
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).splashColor,
                  ).showCursorOnHover,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProjectItem1 extends StatelessWidget {
  final double width;
  const ProjectItem1({required this.width});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10),
          child: const Image(
            width: 150,
            image: AssetImage(
              'assets/images/quotesApp/screen1.png',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Flexible(
                child: SizedBox(height: 50),
              ),
              Text(
                'SP Quotes App',
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: width * 0.5,
                child: Text(
                  quoteStr1 + quoteStr2 + quoteStr3 + quoteStr4,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: WinddowsGooglePlayButton(
                      screenWidth: width,
                      url: spQuotesLink,
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

class ProjectItem2 extends StatelessWidget {
  final double width;
  const ProjectItem2({required this.width});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10),
          child: const Image(
            width: 150,
            image: AssetImage(
              'assets/images/quizApp/screen2.png',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Flexible(
                child: SizedBox(height: 50),
              ),
              Text(
                'SP Quiz',
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: width * 0.5,
                child: Text(
                  quizStr1 + quizStr2 + quizStr3 + quizStr4 + quizStr5,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: WinddowsGooglePlayButton(
                      screenWidth: width,
                      url: spQuizLink,
                    ).showCursorOnHover,
                  ),
                  const SizedBox(width: 40),
                  // QrImage(
                  //   backgroundColor: Colors.white,
                  //   data: spQuizLink,
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
