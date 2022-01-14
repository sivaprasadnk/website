import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/route_provider.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class AndroidContactMeScreen extends StatefulWidget {
  final double screenHeight;
  const AndroidContactMeScreen({required this.screenHeight});
  @override
  _AndroidContactMeScreenState createState() => _AndroidContactMeScreenState();
}

class _AndroidContactMeScreenState extends State<AndroidContactMeScreen> {
  late Widget fbPng;
  late Widget waPng;
  late Widget instaPng;
  late Widget linkedInPng;

  @override
  Widget build(BuildContext context) {
    double iconSize = 30;
    var menuSelectedCheck =
        Provider.of<RouteProvider>(context, listen: true).menuSelected as bool;
    debugPrint('...@@456 @menu menuSelectedCheck..$menuSelectedCheck');
    fbPng = Image.asset(fbPngAssetName, height: iconSize);
    waPng = Image.asset(whatsappPngeAssetName, height: iconSize);
    instaPng = Image.asset(instaPngImageName, height: iconSize);
    linkedInPng = Image.asset(linkedInAssetName,
        height: iconSize, color: Colors.blue[900]);
    return Stack(
      // mainAxisSize: MainAxisSize.min,
      children: [
        Positioned.fill(
          child: Align(
            child: CustomPaint(
              painter: AndroidBgCurve(ctx: context),
              child: Container(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10, top: 20),
          child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Provider.of<RouteProvider>(context, listen: false)
                    .setMenuSelected(check: true);
              },
            ),
          ),
        ),
        Container(
          height: widget.screenHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: widget.screenHeight * 0.18,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  'Contact Me',
                  style: TextStyle(
                    fontFamily: 'PlayfairDisplay',
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: widget.screenHeight * 0.12,
              ),
              SingleChildScrollView(
                child: LiveList(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, bottom: 5, top: 0),
                  // physics: NeverScrollableScrollPhysics(),
                  showItemInterval: const Duration(milliseconds: 50),
                  showItemDuration: const Duration(milliseconds: 150),
                  itemCount: 8,
                  itemBuilder: animationItemBuilder((index) {
                    switch (index) {
                      case 0:
                        return TitleText(title: 'Address');
                      case 1:
                        return DescriptionText(
                            description:
                                'Prasadam, Nadama, \nTripunithura, Ernakulam, Kerala .');
                      case 2:
                        return TitleText(title: 'Mobile');
                      case 3:
                        return DescriptionText(description: '+91 8086028340');
                      case 4:
                        return TitleText(title: 'E-mail');
                      case 5:
                        return DescriptionText(
                            description: 'sivaprasadnk.official@gmail.com');
                      case 6:
                        return TitleText(title: 'Social Media');
                      case 7:
                        return Padding(
                          padding: const EdgeInsets.only(top: 15, left: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                child: fbPng,
                                onTap: () {
                                  launch(fbLink);
                                },
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              GestureDetector(
                                child: instaPng,
                                onTap: () {
                                  launch(instaLink);
                                },
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              GestureDetector(
                                child: waPng,
                                onTap: () {
                                  if (defaultTargetPlatform ==
                                      TargetPlatform.iOS) {
                                    launch(whatsappWebLink);
                                  } else {
                                    launch(whatsappAndroidLink);
                                  }
                                },
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              GestureDetector(
                                child: linkedInPng,
                                onTap: () {
                                  launch(linkedInLink);
                                },
                              ),
                            ],
                          ),
                        );
                      case 8:
                        return SizedBox(
                          height: 300,
                        );
                      //  case 7: return DescriptionText(description: description)
                    }

                    return Container();
                  }),
                ),
              ),
              SizedBox(
                height: widget.screenHeight * 0.08,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget Function(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) animationItemBuilder(
    Widget Function(int index) child, {
    EdgeInsets padding = EdgeInsets.zero,
  }) =>
      (
        BuildContext context,
        int index,
        Animation<double> animation,
      ) =>
          FadeTransition(
            opacity: Tween<double>(
              begin: 0,
              end: 1,
            ).animate(animation),
            child: SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0, -0.1),
                end: Offset.zero,
              ).animate(animation),
              child: Padding(
                padding: padding,
                child: child(index),
              ),
            ),
          );
}

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
    // final x = w / 2;

    // path.moveTo(0, h - padding);
    // path.moveTo(0, h * 0.23);
    // path.quadraticBezierTo(w * 0.25, h * 0.16, w * 0.5, h * 0.23);
    // path.quadraticBezierTo(w * 0.75, h * 0.3, w, h * 0.23);
    // path.lineTo(w - padding, y);
    // path.lineTo(w - padding, 0);
    // path.lineTo(0, 0);
    // path.close();
    // canvas.drawPath(path, paint);
    path.moveTo(0, h - padding);
    path.lineTo(0, h * 0.23);
    path.quadraticBezierTo(w * 0.25, h * 0.16, w * 0.5, h * 0.23);
    path.quadraticBezierTo(w * 0.75, h * 0.3, w, h * 0.23);
    path.lineTo(w - padding, y);
    path.lineTo(w - padding, h - padding);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}