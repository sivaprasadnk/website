import 'package:flutter/material.dart';

class AndroidBgCurve extends CustomPainter {
  final BuildContext ctx;
  AndroidBgCurve({required this.ctx});
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 5.0;

    final Path path = Path();

    final h = size.height;
    final w = size.width;

    final y = h / 2;

    path.moveTo(0, h);
    path.lineTo(0, h * 0.3);
    path.quadraticBezierTo(w * 0.25, h * 0.23, w * 0.5, h * 0.3);
    path.quadraticBezierTo(w * 0.75, h * 0.37, w, h * 0.3);
    path.lineTo(w, y);
    path.lineTo(w, h);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
