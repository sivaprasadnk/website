import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class RobotLottie extends StatelessWidget {
  const RobotLottie({
    Key? key,
    required this.screenWidth,
    required this.showLottie,
  }) : super(key: key);

  final double screenWidth;
  final bool showLottie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: screenWidth * .23),
      child: AnimatedOpacity(
        duration: const Duration(seconds: 1),
        opacity: showLottie ? 1 : 0,
        child: Lottie.asset(
          'assets/lotties/robot_hello.json',
          height: 200,
        ),
      ),
    );
  }
}
