import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:spnk/domain/experience_entity.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/android/description_text.dart';

class AndroidExperienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final expList = experienceList;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'Experience',
            style: TextStyle(
              fontFamily: kRajdhaniFontFamily,
              fontWeight: FontWeight.bold,
              fontSize: 35,
              color: Colors.white,
            ),
          ),
        ),
        // Align(
        //   child: CustomPaint(
        //     painter: AndroidBgCurve(ctx: context),
        //     size: const Size(300, 300),
        //     child: Container(),
        //   ),
        // ),
        const AndroidDashImage(dashImage: 'dash2'),
        //
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
