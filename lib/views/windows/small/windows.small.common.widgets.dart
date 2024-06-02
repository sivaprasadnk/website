import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    required this.screenWidth,
    required this.title,
  });
  final double screenWidth;
  final String title;

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      child: Container(
        width: screenWidth * 0.35,
        // width: 180,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            width: 2,
            color: Colors.cyan,
          ),
        ),
        margin: EdgeInsets.only(left: screenWidth * 0.1, top: 50),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
      ),
    );
  }
}
