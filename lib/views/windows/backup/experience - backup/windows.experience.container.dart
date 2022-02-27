import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:spnk/utils/common_strings.dart';

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
  @override
  Widget build(BuildContext context) {
    double iconSize = 30;
    fbPng = Image.asset(fbPngAssetName, height: iconSize);
    waPng = Image.asset(whatsappPngeAssetName, height: iconSize);
    instaPng = Image.asset(instaPngImageName, height: iconSize);
    linkedInPng = Image.asset(linkedInAssetName,
        height: iconSize, color: Colors.blue[900]);
    return Container(
      child: Stack(
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
                child: FadeInDown(
                  child: Container(
                    width: widget.screenWidth * 0.2,
                    child: FittedBox(
                      child: Text(
                        "Experience",
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
              SizedBox(
                height: 100,
              ),
              Flexible(
                child: FadeInLeftBig(
                  child: Padding(
                    padding: EdgeInsets.only(left: widget.screenWidth * 0.2),
                    child: Container(
                      // height: 200,
                      width: widget.screenWidth * 0.7,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ' Java, Postgres Programmer',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircleAvatar(
                                      radius: 5,
                                      backgroundColor: Colors.white,
                                    ),
                                    Text(
                                      '      Bayasys Infotech Pvt Ltd.',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircleAvatar(
                                      radius: 5,
                                      backgroundColor: Colors.white,
                                    ),
                                    Text(
                                      '      07/2019 - 09/2020',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ListTile(
                            title: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Flutter Developer',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircleAvatar(
                                      radius: 5,
                                      backgroundColor: Colors.white,
                                    ),
                                    Text(
                                      '      Indbytes Technologies',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircleAvatar(
                                      radius: 5,
                                      backgroundColor: Colors.white,
                                    ),
                                    Text(
                                      '      12/2020 - Present',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned.fill(
            right: widget.screenWidth * 0.1,
            child: Align(
              alignment: Alignment.centerRight,
              child: FadeInRightBig(
                child: Image.asset(
                  'assets/images/exp_icon.png',
                  height: 300,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
