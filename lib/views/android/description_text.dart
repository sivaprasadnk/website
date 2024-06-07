import 'package:flutter/material.dart';
import 'package:spnk/utils/common_colors.dart';
import 'package:spnk/utils/common_strings.dart';

class DescriptionText extends StatelessWidget {
  final String description;
  const DescriptionText({required this.description});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 40,
        top: 5,
        right: 30,
      ),
      child: Text(
        description,
        style: TextStyle(
          fontFamily: kRajdhaniFontFamily,
          color: kGreyColor,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    );
  }
}
