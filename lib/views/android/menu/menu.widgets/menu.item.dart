import 'package:flutter/material.dart';
import 'package:spnk/utils/common_strings.dart';

class AndroidMenuItem extends StatelessWidget {
  const AndroidMenuItem({Key? key, required this.title, required this.icon}) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    final double menuFontSize = screenWidth * 0.07;

    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: ListTile(
        leading: Icon(
         icon,
          color: Colors.white,
          size: menuFontSize,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: kFontFamily2,
            fontWeight: FontWeight.bold,
            fontSize: menuFontSize,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
