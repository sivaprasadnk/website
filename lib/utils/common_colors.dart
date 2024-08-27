import 'package:flutter/material.dart';

Color kTransparentColor = Colors.transparent;
Color kWhiteColor = Colors.white;
Color kGreyColor = Colors.grey;
Color kGreyColor2 = const Color.fromRGBO(66, 69, 77, 1);
Color kGreyColor3 = const Color.fromRGBO(26, 27, 30, 1);
Color kPrimaryBlueColor = const Color.fromRGBO(0, 34, 120, 1);
Color kPrimaryWhiteColor = const Color.fromRGBO(239, 239, 239, 1);
Color kPrimaryDarkBlueColor = const Color.fromARGB(255, 2, 24, 79);
Color kPrimaryLightBlueColor = const Color.fromARGB(255, 5, 62, 206);
Color kPrimaryDarkWhiteColor = const Color.fromARGB(255, 138, 132, 132);
// Color kCyanColor = Colors.cyan;
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
