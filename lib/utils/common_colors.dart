import 'package:flutter/material.dart';

Color kTransparentColor = Colors.transparent;
Color kWhiteColor = Colors.white;
Color kGreyColor = Colors.grey;
Color kPrimaryBlueColor = const Color.fromRGBO(0, 34, 120, 1);
Color kCyanColor = Colors.cyan;
MaterialColor kMaterialCyanColor =
    MaterialColor(Colors.cyan.value, cyanColorMap);

Map<int, Color> cyanColorMap = {
  50: Colors.cyan.shade50,
  100: Colors.cyan.shade100,
  200: Colors.cyan.shade200,
  300: Colors.cyan.shade300,
  400: Colors.cyan.shade400,
  500: Colors.cyan.shade500,
  600: Colors.cyan.shade600,
  700: Colors.cyan.shade700,
  800: Colors.cyan.shade800,
  900: Colors.cyan.shade900,
};
