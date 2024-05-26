import 'package:flutter/material.dart';
import 'package:spnk/provider/route_provider.dart';
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';
import 'package:spnk/views/windows/medium/home/menu.widgets/menu.item.dart';

class HomeMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = context.routeProvider.selectedSCreen;

    return CustomMenuItem(
      title: 'Home',
      isSelected: screen == Screen.home,
    );
  }
}