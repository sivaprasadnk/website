import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/windows/hover_extensions.dart';

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
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight * 0.13),
          FadeInDownBig(
            child: Container(
              width: screenWidth * 0.45,
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
          SizedBox(height: screenHeight * 0.13),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: screenWidth * 0.1),
              Container(
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
          Row(
            children: [
              SizedBox(width: screenWidth * 0.13),
              GestureDetector(
                onTap: () {
                  controller.previousPage(
                    duration: Duration(seconds: 1),
                    curve: Curves.bounceOut,
                  );
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ).showCursorOnHover,
              ),
              SizedBox(width: screenWidth * 0.13),
              GestureDetector(
                onTap: () {
                  controller.nextPage(
                    duration: Duration(seconds: 1),
                    curve: Curves.bounceOut,
                  );
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
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
  ProjectItem1({required this.width});
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
              'assets/images/quotesApp/screen1.png',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Text(
                'SP Quotes App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 25),
              Container(
                width: width * 0.5,
                child: Text(
                  quoteStr1 + quoteStr2 + quoteStr3 + quoteStr4,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: WinddowsGooglePlayButton(
                      screenWidth: width,
                      url: spQuotesLink,
                    ).showCursorOnHover,
                  ),
                  SizedBox(width: 20),
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
  ProjectItem2({required this.width});
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
              'assets/images/quizApp/screen2.png',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Text(
                'SP Quiz',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 25),
              Container(
                width: width * 0.5,
                child: Text(
                  quizStr1 + quizStr2 + quizStr3 + quizStr4 + quizStr5,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: WinddowsGooglePlayButton(
                      screenWidth: width,
                      url: spQuizLink,
                    ).showCursorOnHover,
                  ),
                  SizedBox(width: 40),
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
