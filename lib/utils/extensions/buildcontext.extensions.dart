import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/dialog_provider.dart';
import 'package:spnk/provider/route_provider.dart';

extension BuiltContextExt on BuildContext {
  DialogProvider get dialogProvider =>
      Provider.of<DialogProvider>(this, listen: false);

  void pop() => Navigator.pop(this);

  RouteProvider get routeProvider => Provider.of<RouteProvider>(this);
}
