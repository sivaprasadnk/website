import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/route_provider.dart';
import 'package:spnk/utils/common_widgets.dart';

class AndroidExperienceScreen extends StatefulWidget {
  final double screenHeight;
  const AndroidExperienceScreen({required this.screenHeight});
  @override
  _AndroidExperienceScreenState createState() =>
      _AndroidExperienceScreenState();
}

class _AndroidExperienceScreenState extends State<AndroidExperienceScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Align(
            child: CustomPaint(
              painter: AndroidBgCurve(ctx: context),
              child: Container(),
            ),
          ),
        ),
        AndroidDashImage(dashImage: 'dash2'),
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
                height: widget.screenHeight * 0.15,
              ),
              Padding(
                padding: EdgeInsets.only(top: 0, left: 30),
                child: Text(
                  'Experience',
                  style: TextStyle(
                    fontFamily: 'PlayfairDisplay',
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
              ),
              // Spacer(),
              SizedBox(
                height: widget.screenHeight * 0.12,
              ),
              LiveList(
                shrinkWrap: true,
                padding: const EdgeInsets.only(
                    left: 16, right: 16, bottom: 10, top: 0),
                physics: NeverScrollableScrollPhysics(),
                showItemInterval: const Duration(milliseconds: 50),
                showItemDuration: const Duration(milliseconds: 150),
                itemCount: 6,
                itemBuilder: animationItemBuilder((index) {
                  switch (index) {
                    case 0:
                      return TitleText(title: '\Java , Postgres Programmer');
                    case 1:
                      return DescriptionText(
                          description: '\nBayasys Infotech Pvt Ltd.');
                    case 2:
                      return DescriptionText(description: '07/2019 - 09/2020');
                    case 3:
                      return TitleText(title: '\Senior Flutter Developer');
                    case 4:
                      return DescriptionText(
                          description: '\nIndbytes Technologies');
                    case 5:
                      return DescriptionText(description: '12/2020 - Present');
                  }

                  return Container();
                }),
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
      // ..color = Color.fromRGBO(7, 17, 26, 1)
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 5.0;

    final Path path = Path();

    final h = size.height;
    final w = size.width;

    final y = h / 2;
    // final x = w / 2;

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
