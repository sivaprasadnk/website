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
  @override
  Widget build(BuildContext context) {
    double iconSize = 30;
    fbPng = Image.asset(fbPngAssetName, height: iconSize);
    waPng = Image.asset(whatsappPngeAssetName, height: iconSize);
    instaPng = Image.asset(instaPngImageName, height: iconSize);
    linkedInPng = Image.asset(linkedInAssetName,
        height: iconSize, color: Colors.blue[900]);
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
                child: Padding(
                  padding: EdgeInsets.only(left: widget.screenWidth * 0.2),
                  child: Container(
                    // height: 200,
                    width: widget.screenWidth * 0.7,
                    child: ListTile(
                      // leading: Icon(
                      //   Icons.location_on,
                      //   color: Colors.white,
                      // ),
                      title: Text(
                        'Bayasys Infotech Pvt Ltd.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
