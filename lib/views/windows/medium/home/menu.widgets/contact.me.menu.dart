import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/route_provider.dart';
import 'package:spnk/views/windows/medium/home/menu.widgets/menu.item.dart';


class ContactmeMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = Provider.of<RouteProvider>(context).selectedSCreen;

    return  MenuItem(
      title: 'Contact Me',
      isSelected: screen == Screen.contactMe,
    );
  }
}
