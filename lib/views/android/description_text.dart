import 'package:flutter/material.dart';
import 'package:spnk/utils/common_colors.dart';

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
        // 'A Quiz App with various categories ,and cool animations for each element on screen ',
        style: TextStyle(
          // fontFamily: 'PlayfairDisplay',
          color: kGreyColor,
          fontWeight: FontWeight.bold,
          fontSize: 15,
          // color: kWhiteColor
        ),
      ),
    );
  }
}
