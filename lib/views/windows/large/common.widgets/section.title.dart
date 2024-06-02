import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class WindowsLargeSectionTitle extends StatelessWidget {
  const WindowsLargeSectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      child: Container(
        // width: width * 0.5,
        padding: const EdgeInsets.only(left: 150),
        child: AutoSizeText(
          title,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
