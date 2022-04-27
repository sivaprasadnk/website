import 'package:flutter/material.dart';
import 'package:spnk/views/windows/hover_extensions.dart';

class ViewMoreContainerSmall extends StatelessWidget {
  const ViewMoreContainerSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Container(
      margin: const EdgeInsets.only(top: 5, right: 5),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(0, 34, 120, 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: screenWidth > 600
            ? const Text(
                'View More',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              )
            : const Icon(
                Icons.info,
                color: Colors.white,
              ),
      ),
    ).showCursorOnHover;
  }
}
