import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spnk/utils/common_colors.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/android/description_text.dart';
import 'package:spnk/views/provider/data_provider.dart';

class AndroidContactMeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactList = ref.watch(contactProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'Contact Me',
            style: TextStyle(
              fontFamily: kRajdhaniFontFamily,
              fontWeight: FontWeight.bold,
              fontSize: 35,
              color: kWhiteColor,
            ),
          ),
        ),
        const AndroidDashImage(dashImage: 'dash4'),
        SingleChildScrollView(
          child: LiveList(
            shrinkWrap: true,
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 5,
            ),
            showItemInterval: const Duration(milliseconds: 50),
            itemCount: contactList.length,
            itemBuilder: animationItemBuilder((index) {
              final item =
                  contactList.firstWhere((element) => element.index == index);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleText(title: item.title),
                  DescriptionText(
                    description: item.details,
                  ),
                ],
              );
            }),
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
      ..color = const Color.fromRGBO(7, 17, 26, 1)
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
