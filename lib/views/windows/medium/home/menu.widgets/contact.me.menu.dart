import 'package:flutter/material.dart';
import 'package:spnk/utils/screen_type.dart';
import 'package:spnk/views/windows/medium/home/menu.widgets/menu.item.dart';

class ContactmeMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return const CustomMenuItem(
      title: 'Contact Me',
      screen: Screen.contactMe,
    );
  }
}
