import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class WindowsLargeSectionTitle extends StatelessWidget {
  const WindowsLargeSectionTitle({
    Key? key,
    required this.width,
    required this.title,
  }) : super(key: key);

  final String title;
  final double width;
  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      child: Container(
        width: width * 0.25,
        padding: EdgeInsets.only(left: width * 0.1),
        child: FittedBox(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
    );
  }
}
