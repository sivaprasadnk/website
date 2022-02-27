import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;
  final String title;
  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      child: Container(
        padding: EdgeInsets.only(left: screenWidth * 0.1),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'PlayfairDisplay',
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
