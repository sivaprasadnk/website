import 'package:flutter/material.dart';

class HiNameContainer extends StatelessWidget {
  const HiNameContainer({
    Key? key,
    required this.showName,
    required this.screenWidth,
    required this.leftPadding,
  }) : super(key: key);

  final bool showName;
  final double screenWidth;
  final double leftPadding;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(seconds: 1),
      opacity: showName ? 1 : 0,
      child: Container(
        margin: EdgeInsets.only(
          left: leftPadding,
        ),
        width: screenWidth * 0.6,
        child: const HiText(),
      ),
    );
  }
}

class HiText extends StatelessWidget {
  const HiText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Hi,\nI'm Sivaprasad NK .",
      style: Theme.of(context).textTheme.displayMedium,
    );
  }
}
