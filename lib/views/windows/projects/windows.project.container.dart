import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicators/page_view_indicators.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';

class MyPainter extends CustomPainter {
  final BuildContext ctx;
  MyPainter({required this.ctx});
  @override
  void paint(Canvas canvas, Size size) {
    double padding = 0;
    // final theme = Provider.of<ThemeNotifier>(ctx, listen: false);
    final Paint paint = Paint()
      ..color = Colors.teal
      ..style = PaintingStyle.fill
      ..strokeWidth = 5.0;

    final Path path = Path();

    final h = size.height;
    final w = size.width;

    final y = h / 2;
    path.moveTo(0, h - padding);
    path.lineTo(0, h * 0.55);
    path.quadraticBezierTo(w * 0.29, h * 0.55, w * 0.5, h * 0.7);
    path.quadraticBezierTo(w * 0.73, h * 0.84, w, h * 0.74);
    path.lineTo(w - padding, y);
    path.lineTo(w - padding, h - padding);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class WindowsProjectContainer extends StatefulWidget {
  final double screenWidth;
  final double screenHeight;
  const WindowsProjectContainer(
      {required this.screenWidth, required this.screenHeight});

  @override
  _WindowsProjectContainerState createState() =>
      _WindowsProjectContainerState();
}

class _WindowsProjectContainerState extends State<WindowsProjectContainer> {
  final _pageController2 = PageController();
  final _currentPageNotifier2 = ValueNotifier<int>(0);

  int i = 0;

  _buildPageView(
          PageController pageController, ValueNotifier currentPageNotifier) =>
      Container(
        width: widget.screenWidth * 0.9,
        height: widget.screenHeight * 0.6,
        child: PageView.builder(
            itemCount: 2,
            controller: pageController,
            itemBuilder: (BuildContext context, int index) {
              return index == 0
                  ? Padding(
                      padding: EdgeInsets.only(
                        left: widget.screenWidth * 0.2,
                        top: widget.screenHeight * 0.1,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: widget.screenWidth * 0.15,
                            child: Image(
                              height: 250,
                              image: AssetImage(
                                'assets/images/quizApp/screen2.png',
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: widget.screenHeight * 0.1,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Container(
                                  width: widget.screenWidth * 0.15,
                                  child: FittedBox(
                                    child: Text(
                                      "SP Quiz App",
                                      style: TextStyle(
                                        // fontFamily: 'PlayfairDisplay',
                                        fontWeight: FontWeight.bold,
                                        // fontSize: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Container(
                                  // width: screenWidth * 0.15,
                                  child: Text(
                                    "A Simple quiz app \nwith cool animations and effects",
                                    style: TextStyle(
                                      // fontFamily: 'PlayfairDisplay',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              GooglePlayButton(
                                  screenWidth: widget.screenWidth,
                                  url: spQuizLink),
                            ],
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(
                        left: widget.screenWidth * 0.2,
                        top: widget.screenHeight * 0.1,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: widget.screenWidth * 0.15,
                            child: Image(
                              height: 250,
                              image: AssetImage(
                                'assets/images/quotesApp/screen1.png',
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: widget.screenHeight * 0.1,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Container(
                                  width: widget.screenWidth * 0.15,
                                  child: FittedBox(
                                    child: Text(
                                      "SP Quotes App",
                                      style: TextStyle(
                                        // fontFamily: 'PlayfairDisplay',
                                        fontWeight: FontWeight.bold,
                                        // fontSize: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Container(
                                  // width: screenWidth * 0.15,
                                  child: Text(
                                    "A Simple Quotes listing app",
                                    style: TextStyle(
                                      // fontFamily: 'PlayfairDisplay',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              GooglePlayButton(
                                  screenWidth: widget.screenWidth,
                                  url: spQuotesLink),
                            ],
                          ),
                        ],
                      ),
                    );
            },
            onPageChanged: (int index) {
              currentPageNotifier.value = index;
            }),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: widget.screenHeight * 0.1,
              ),
              Padding(
                padding: EdgeInsets.only(left: widget.screenWidth * 0.2),
                child: FadeInDownBig(
                  child: Container(
                    width: widget.screenWidth * 0.2,
                    child: FittedBox(
                      child: Text(
                        "My Projects",
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
              ),
              Padding(
                padding: EdgeInsets.only(left: widget.screenWidth * 0.05),
                child: ArrowPageIndicator(
                  iconPadding: EdgeInsets.symmetric(horizontal: 16.0),
                  isInside: true,
                  leftIcon: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                      ),
                    ),
                  ),
                  rightIcon: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  pageController: _pageController2,
                  currentPageNotifier: _currentPageNotifier2,
                  itemCount: 2,
                  child:
                      _buildPageView(_pageController2, _currentPageNotifier2),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
