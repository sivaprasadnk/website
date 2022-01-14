import 'package:flutter/material.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class MyPainter extends CustomPainter {
  final BuildContext ctx;
  MyPainter({required this.ctx});
  @override
  void paint(Canvas canvas, Size size) {
    double padding = 0;
    // final theme = Provider.of<ThemeNotifier>(ctx, listen: false);
    final Paint paint = Paint()
      ..color = Color.fromRGBO(7, 17, 26, 1)
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

class WindowsContactMeContainer extends StatefulWidget {
  final double screenWidth;
  final double screenHeight;
  const WindowsContactMeContainer(
      {required this.screenWidth, required this.screenHeight});

  @override
  _WindowsContactMeContainerState createState() =>
      _WindowsContactMeContainerState();
}

class _WindowsContactMeContainerState extends State<WindowsContactMeContainer> {
  late Widget fbPng;
  late Widget waPng;
  late Widget instaPng;
  late Widget linkedInPng;

  bool showContactMeBoard = false;

  bool showDetails = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500)).then((value) {
      if (mounted)
        setState(() {
          showContactMeBoard = true;
          // ballTopPosition = 0;
        });
    }).then((value) {
      Future.delayed(Duration(milliseconds: 500)).then((value) {
        if (mounted)
          setState(() {
            showDetails = true;
            // ballTopPosition = 0;
          });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double iconSize = 30;
    fbPng = Image.asset(fbPngAssetName, height: iconSize);
    waPng = Image.asset(whatsappPngeAssetName, height: iconSize);
    instaPng = Image.asset(instaPngImageName, height: iconSize);
    linkedInPng = Image.asset(linkedInAssetName,
        height: iconSize, color: Colors.blue[900]);
    return Container(
      width: widget.screenWidth,
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              child: CustomPaint(
                painter: WindowsExpBgCurve(ctx: context),
                child: Container(),
              ),
            ),
          ),
          Positioned.fill(
            left: widget.screenWidth * 0.13,
            bottom: widget.screenHeight * 0.21,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: AnimatedOpacity(
                opacity: 1,
                duration: Duration(milliseconds: 800),
                child: Image.asset(
                  'assets/images/contact_me_board.png',
                  height: widget.screenHeight * 0.6,
                ),
              ),
            ),
          ),
          Positioned.fill(
            right: widget.screenWidth * 0.35,
            bottom: widget.screenHeight * 0.19,
            child: Align(
              alignment: Alignment.bottomRight,
              child: AnimatedOpacity(
                opacity: 1,
                duration: Duration(milliseconds: 800),
                child: Image.asset(
                  'assets/images/xmas_tree.png',
                  height: widget.screenHeight * 0.42,
                ),
              ),
            ),
          ),
          Positioned.fill(
            right: widget.screenWidth * 0.03,
            bottom: widget.screenHeight * 0.14,
            child: Align(
              alignment: Alignment.bottomRight,
              child: AnimatedOpacity(
                opacity: 1,
                duration: Duration(milliseconds: 800),
                child: Image.asset(
                  'assets/images/xmas_tree.png',
                  height: widget.screenHeight * 0.55,
                ),
              ),
            ),
          ),
          Positioned.fill(
            right: widget.screenWidth * 0.2,
            bottom: widget.screenHeight * 0.15,
            child: Align(
              alignment: Alignment.bottomRight,
              child: AnimatedOpacity(
                opacity: 1,
                duration: Duration(milliseconds: 800),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/board.png',
                      height: widget.screenHeight * 0.4,
                    ),
                    Positioned.fill(
                      top: 40,
                      left: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.black,
                            ),
                            Text(
                              '  Prasadam, Nadama, Tripunithura, \n  Ernakulam, Kerala, India',
                              style: TextStyle(
                                // fontFamily: 'PlayfairDisplay',
                                fontWeight: FontWeight.bold,
                                // fontSize: 40,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned.fill(
                      top: 90,
                      left: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.call,
                              color: Colors.black,
                            ),
                            Text(
                              '   +91 8086028340',
                              style: TextStyle(
                                // fontFamily: 'PlayfairDisplay',
                                fontWeight: FontWeight.bold,
                                // fontSize: 40,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned.fill(
                      top: 140,
                      left: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.email,
                              color: Colors.black,
                            ),
                            Text(
                              '  sivaprasadnk.official@gmail.com',
                              style: TextStyle(
                                // fontFamily: 'PlayfairDisplay',
                                fontWeight: FontWeight.bold,
                                // fontSize: 40,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned.fill(
                      top: 113,
                      left: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              child: Container(
                                child: fbPng,
                              ),
                              onTap: () {
                                launch(fbLink);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              child: instaPng,
                              onTap: () {
                                launch(instaLink);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              child: waPng,
                              onTap: () {
                                launch(whatsappWebLink);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              child: linkedInPng,
                              onTap: () {
                                launch(linkedInLink);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
