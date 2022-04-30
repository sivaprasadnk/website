import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
    required this.imagePath,
    this.isWeb = false,
    this.imageFit = BoxFit.cover,
  }) : super(key: key);
  final String imagePath;
  final BoxFit imageFit;
  final bool isWeb;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    return Container(
      margin: const EdgeInsets.only(left: 50),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        color:
            isWeb ? const Color.fromRGBO(155, 101, 101, 1) : Colors.transparent,
      ),
      height: screenHeight * 0.71,
      width: 360,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        child: Image.asset(
          imagePath,
          fit: imageFit,
        ),
      ),
    );
  }
}
