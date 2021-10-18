import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
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

class WindowsProjectContainer extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  const WindowsProjectContainer(
      {required this.screenWidth, required this.screenHeight});

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
                height: screenHeight * 0.1,
              ),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.2),
                child: FadeInDownBig(
                  child: Container(
                    width: screenWidth * 0.2,
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
                padding: EdgeInsets.only(
                  left: screenWidth * 0.2,
                  top: screenHeight * 0.1,
                ),
                child: FadeInLeftBig(
                  child: Container(
                    width: screenWidth * 0.15,
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
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.2,
                  top: screenHeight * 0.1,
                ),
                child: FadeInLeftBig(
                  child: Row(
                    children: [
                      Container(
                        width: screenWidth * 0.15,
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
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                              // width: screenWidth * 0.15,
                              child: Text(
                                "A Simple quiz app \n with cool animations and effects",
                                style: TextStyle(
                                  // fontFamily: 'PlayfairDisplay',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          // Container(
                          //   width: screenWidth * 0.15,
                          //   child: Image(
                          //     height: 150,
                          //     image: AssetImage(
                          //       'assets/images/quizApp/screen2.png',
                          //     ),
                          //   ),
                          // ),
                          GooglePlayButton(
                              screenWidth: screenWidth, url: spQuizLink),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
