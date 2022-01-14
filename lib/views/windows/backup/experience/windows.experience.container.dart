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

class WindowsExperienceContainer extends StatefulWidget {
  final double screenWidth;
  final double screenHeight;
  const WindowsExperienceContainer(
      {required this.screenWidth, required this.screenHeight});

  @override
  _WindowsExperienceContainerState createState() =>
      _WindowsExperienceContainerState();
}

class _WindowsExperienceContainerState
    extends State<WindowsExperienceContainer> {
  late Widget fbPng;
  late Widget waPng;
  late Widget instaPng;
  late Widget linkedInPng;
  bool showSnowman = false;
  double ballTopPosition = -250;
  bool showBoard = false;

  // late AnimationController controller;
  // late Animation animation;
  @override
  void initState() {
    super.initState();
    // controller =
    //     AnimationController(duration: Duration(seconds: 8), vsync: this)
    //       ..repeat();
    // animation = CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    // animation = Tween<double>(begin: 1000, end: -300).animate(controller);
    Future.delayed(Duration(milliseconds: 500)).then((value) {
      if (mounted)
        setState(() {
          showBoard = true;
          ballTopPosition = 0;
        });
    });

    // controller.addListener(() {
    //   setState(() {});
    // });
    // controller.forward();
  }

  @override
  void dispose() {
    super.dispose();

    // controller.dispose();
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
      width: double.infinity,
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
            left: widget.screenWidth * 0.08,
            bottom: widget.screenHeight * 0.21,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: AnimatedOpacity(
                opacity: 1,
                duration: Duration(milliseconds: 800),
                child: Image.asset(
                  'assets/images/board2.png',
                  height: widget.screenHeight * 0.6,
                ),
              ),
            ),
          ),
          Positioned.fill(
            left: widget.screenWidth * 0.08,
            bottom: widget.screenHeight * 0.21,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: AnimatedOpacity(
                opacity: 1,
                duration: Duration(milliseconds: 800),
                child: Image.asset(
                  'assets/images/snow_man.png',
                  height: widget.screenHeight * 0.3,
                ),
              ),
            ),
          ),
          Positioned.fill(
            right: widget.screenWidth * 0.45,
            bottom: widget.screenHeight * 0.35,
            child: Align(
              alignment: Alignment.bottomRight,
              child: AnimatedOpacity(
                opacity: 1,
                duration: Duration(milliseconds: 800),
                child: Image.asset(
                  'assets/images/java_board.png',
                  height: widget.screenHeight * 0.4,
                ),
              ),
            ),
          ),
          Positioned.fill(
            right: widget.screenWidth * 0.41,
            bottom: widget.screenHeight * 0.15,
            child: Align(
              alignment: Alignment.bottomRight,
              child: AnimatedOpacity(
                opacity: 1,
                duration: Duration(milliseconds: 800),
                child: Image.asset(
                  'assets/images/board3.png',
                  height: widget.screenHeight * 0.4,
                ),
              ),
            ),
          ),
          Positioned.fill(
            right: widget.screenWidth * 0.15,
            bottom: widget.screenHeight * 0.3,
            child: Align(
              alignment: Alignment.bottomRight,
              child: AnimatedOpacity(
                opacity: 1,
                duration: Duration(milliseconds: 800),
                child: Image.asset(
                  'assets/images/flutter_board.png',
                  height: widget.screenHeight * 0.4,
                ),
              ),
            ),
          ),
          Positioned.fill(
            right: widget.screenWidth * 0.13,
            bottom: widget.screenHeight * 0.12,
            child: Align(
              alignment: Alignment.bottomRight,
              child: AnimatedOpacity(
                opacity: 1,
                duration: Duration(milliseconds: 800),
                child: Image.asset(
                  'assets/images/board4.png',
                  height: widget.screenHeight * 0.4,
                ),
              ),
            ),
          ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     SizedBox(
          //       height: widget.screenHeight * 0.1,
          //     ),
          //     Padding(
          //       padding: EdgeInsets.only(left: widget.screenWidth * 0.2),
          //       child: FadeInDownBig(
          //         child: Container(
          //           width: widget.screenWidth * 0.2,
          //           child: FittedBox(
          //             child: Text(
          //               "Experience",
          //               style: TextStyle(
          //                 fontFamily: 'PlayfairDisplay',
          //                 fontWeight: FontWeight.bold,
          //                 // fontSize: 40,
          //                 color: Colors.white,
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //     SizedBox(
          //       height: 100,
          //     ),
          //     Flexible(
          //       child: FadeInLeftBig(
          //         child: Padding(
          //           padding: EdgeInsets.only(left: widget.screenWidth * 0.2),
          //           child: Container(
          //             // height: 200,
          //             width: widget.screenWidth * 0.7,
          //             child: Column(
          //               mainAxisSize: MainAxisSize.min,
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 ListTile(
          //                   title: Column(
          //                     mainAxisSize: MainAxisSize.min,
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Text(
          //                         ' Java, Postgres Programmer',
          //                         style: TextStyle(
          //                           fontWeight: FontWeight.bold,
          //                           color: Colors.white,
          //                         ),
          //                       ),
          //                       SizedBox(height: 20),
          //                       Row(
          //                         mainAxisSize: MainAxisSize.min,
          //                         children: [
          //                           CircleAvatar(
          //                             radius: 5,
          //                             backgroundColor: Colors.white,
          //                           ),
          //                           Text(
          //                             '      Bayasys Infotech Pvt Ltd.',
          //                             style: TextStyle(
          //                               fontWeight: FontWeight.bold,
          //                               color: Colors.grey,
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                       Row(
          //                         mainAxisSize: MainAxisSize.min,
          //                         children: [
          //                           CircleAvatar(
          //                             radius: 5,
          //                             backgroundColor: Colors.white,
          //                           ),
          //                           Text(
          //                             '      07/2019 - 09/2020',
          //                             style: TextStyle(
          //                               fontWeight: FontWeight.bold,
          //                               color: Colors.grey,
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   height: 30,
          //                 ),
          //                 ListTile(
          //                   title: Column(
          //                     mainAxisSize: MainAxisSize.min,
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Text(
          //                         'Flutter Developer',
          //                         style: TextStyle(
          //                           fontWeight: FontWeight.bold,
          //                           color: Colors.white,
          //                         ),
          //                       ),
          //                       SizedBox(height: 20),
          //                       Row(
          //                         mainAxisSize: MainAxisSize.min,
          //                         children: [
          //                           CircleAvatar(
          //                             radius: 5,
          //                             backgroundColor: Colors.white,
          //                           ),
          //                           Text(
          //                             '      Indbytes Technologies',
          //                             style: TextStyle(
          //                               fontWeight: FontWeight.bold,
          //                               color: Colors.grey,
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                       Row(
          //                         mainAxisSize: MainAxisSize.min,
          //                         children: [
          //                           CircleAvatar(
          //                             radius: 5,
          //                             backgroundColor: Colors.white,
          //                           ),
          //                           Text(
          //                             '      12/2020 - Present',
          //                             style: TextStyle(
          //                               fontWeight: FontWeight.bold,
          //                               color: Colors.grey,
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // Positioned.fill(
          //   right: widget.screenWidth * 0.1,
          //   child: Align(
          //     alignment: Alignment.centerRight,
          //     child: FadeInRightBig(
          //       child: Image.asset(
          //         'assets/images/exp_icon.png',
          //         height: 300,
          //       ),
          //     ),
          //   ),
          // ),
          // Positioned.fill(
          //   child: Align(
          //     child: CustomPaint(
          //       painter: WindowsHomeBgCurve(ctx: context),
          //       child: Container(),
          //     ),
          //   ),
          // ),
          Positioned.fill(
            right: 300,
            bottom: 80,
            child: Align(
              alignment: Alignment.bottomRight,
              child: AnimatedOpacity(
                opacity: showSnowman ? 1 : 0,
                duration: Duration(milliseconds: 900),
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.25,
                  child: Image(
                    // height: 60,
                    image: AssetImage('assets/images/snowwman.png'),
                  ),
                ),
              ),
            ),
          ),
          // Positioned(
          //   left: animation.value,
          //   bottom: 0,
          //   child: Lottie.asset(
          //     'assets/lotties/reindeer.json',
          //     delegates: LottieDelegates(values: [
          //       ValueDelegate.opacity(
          //         const ['Shape Layer 1', 'Rectangle'],
          //         callback: (frameInfo) =>
          //             (frameInfo.overallProgress * 100).round(),
          //       ),
          //       ValueDelegate.position(
          //         const ['Shape Layer 1', 'Rectangle', '**'],
          //         relative: const Offset(100, 200),
          //       ),
          //       ValueDelegate.color(
          //         const ['Shape Layer 1', 'Rectangle', 'Fill 1'],
          //         value: Colors.transparent,
          //       ),
          //     ]),
          //     height: 200,
          //   ),
          //   // duration: Duration(milliseconds: 500),
          // ),
          // AnimatedPositioned(
          //   right: 365,
          //   top: ballTopPosition,
          //   duration: Duration(seconds: 2),
          //   child: Container(
          //     height: MediaQuery.of(context).size.width * 0.1,
          //     child: Lottie.network(
          //         'https://assets2.lottiefiles.com/packages/lf20_a5P1NS.json'),
          //   ),
          // ),
        ],
      ),
    );
  }
}
