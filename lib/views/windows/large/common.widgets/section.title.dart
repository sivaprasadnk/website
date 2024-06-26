import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class WindowsLargeSectionTitle extends StatelessWidget {
  const WindowsLargeSectionTitle({
    Key? key,
    required this.title,
    // required this.leftPadding,
  }) : super(key: key);
  // final double leftPadding;
  final String title;
  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      child: Container(
        padding: const EdgeInsets.only(left: 150),
        child: AutoSizeText(
          title,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
