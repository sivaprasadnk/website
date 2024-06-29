import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:spnk/utils/extensions/context_extension.dart';

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
        padding: EdgeInsets.only(top: context.screenHeight * 0.15),
        child: AutoSizeText(
          title,
          style: context.displayMedium,
        ),
      ),
    );
  }
}
