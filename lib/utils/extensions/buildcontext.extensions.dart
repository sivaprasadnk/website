import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

extension BuiltContextExt on BuildContext {

  void pop() => Navigator.pop(this);

  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  // RouteProvider get routeProvider => Provider.of<RouteProvider>(this);
}
