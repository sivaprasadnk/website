import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:spnk/domain/experience_entity.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';
import 'package:spnk/views/android/android_bg_curve.dart';
import 'package:spnk/views/android/description_text.dart';

class AndroidExperienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final expList = experienceList;
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
        const AndroidDashImage(dashImage: 'dash2'),
        Padding(
          padding: EdgeInsets.only(
            right: 10,
            top: 20,
            left: context.screenWidth * 0.8,
          ),
          child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                // ref.read(menuNotifierProvider.notifier).menuSelected = false;
                // ref.read(routeNotifierProvider.notifier).selectedScreen =
                //     Screen.home;
              },
            ),
          ),
        ),
        SizedBox(
          height: context.screenHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: context.screenHeight * 0.15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  'Experience',
                  style: TextStyle(
                    fontFamily: kFontFamily2,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
              ),
              // Spacer(),
              SizedBox(
                height: context.screenHeight * 0.12,
              ),
              LiveList(
                shrinkWrap: true,
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 10,
                ),
                physics: const NeverScrollableScrollPhysics(),
                showItemInterval: const Duration(milliseconds: 50),
                itemCount: expList.length,
                itemBuilder: animationItemBuilder((index) {
                  final item =
                      expList.firstWhere((element) => element.order == index);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText(
                        title: item.title,
                      ),
                      DescriptionText(
                        description: item.orgName,
                      ),
                      DescriptionText(
                        description: "${item.startDate} - ${item.endDate}",
                      ),
                    ],
                  );
                }),
              ),
              SizedBox(
                height: context.screenHeight * 0.08,
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
                begin: const Offset(0, -0.1),
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
    const double padding = 0;
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
