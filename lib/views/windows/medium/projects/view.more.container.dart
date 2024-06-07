import 'package:flutter/material.dart';
import 'package:spnk/utils/common_colors.dart';
import 'package:spnk/views/windows/hover_extensions.dart';

class ViewMoreContainer extends StatelessWidget {
  const ViewMoreContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, right: 10),
      decoration: BoxDecoration(
        color: kPrimaryBlueColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'View',
          style: TextStyle(
            color: kWhiteColor,
            fontSize: 12,
          ),
        ),
      ),
    ).showCursorOnHover;
  }
}
