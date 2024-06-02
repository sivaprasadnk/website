import 'package:flutter/material.dart';
import 'package:spnk/views/windows/hover_extensions.dart';

class ViewMoreContainer extends StatelessWidget {
  const ViewMoreContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, right: 10),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(0, 34, 120, 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'View',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
    ).showCursorOnHover;
  }
}
