import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
    this.isWeb = false,
    required this.imagePath,
  }) : super(key: key);
  final String imagePath;
  final bool isWeb;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    return Container(
      margin: const EdgeInsets.only(
        left: 50,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        // color: Colors.amber,
        // color: Color.fromARGB(255, 129, 144, 157),
      ),
      height: screenHeight * 0.6,
      width: 300,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        child: Image.asset(
          imagePath,
          fit: !isWeb ? BoxFit.cover : BoxFit.fitWidth,
        ),
      ),
    );
  }
}
