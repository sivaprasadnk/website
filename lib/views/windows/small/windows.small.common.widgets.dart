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
        width: screenWidth * 0.45,
        padding: EdgeInsets.only(left: screenWidth * 0.1),
        child: Text(
          title,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
