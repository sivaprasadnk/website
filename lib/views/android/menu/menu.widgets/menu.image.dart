import 'package:flutter/material.dart';

class MenuImage extends StatelessWidget {
  const MenuImage({
    Key? key,
    required this.showLottie,
    required this.screenWidth,
  }) : super(key: key);

  final bool showLottie;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: showLottie ? 1 : 0,
      duration: const Duration(seconds: 2),
      child: Container(
        padding: EdgeInsets.only(left: screenWidth * .2, top: 20),
        child: Image.asset(
          'assets/images/exp_icon.png',
          height: 250,
        ),
      ),
    );
  }
}
