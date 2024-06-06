import 'package:flutter/material.dart';
import 'package:spnk/utils/common_colors.dart';

class InvalidDisplayScreen extends StatelessWidget {
  const InvalidDisplayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Please increase the window size to view contents ',
          style: TextStyle(
            color: kWhiteColor,
          ),
        ),
      ),
    );
  }
}
