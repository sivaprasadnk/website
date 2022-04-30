import 'package:flutter/material.dart';
import 'package:spnk/views/windows/hover_extensions.dart';

class ViewMoreContainerSmall extends StatelessWidget {
  const ViewMoreContainerSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Container(
      margin: const EdgeInsets.only(top: 5, right: 5, bottom: 8),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(0, 34, 120, 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: screenWidth > 600
            ? const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'View More',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              )
            : const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Icon(
                  Icons.info,
                  color: Colors.white,
                ),
              ),
      ),
    ).showCursorOnHover;
  }
}
