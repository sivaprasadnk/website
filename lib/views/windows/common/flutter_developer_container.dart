import 'package:flutter/material.dart';

class FlutterDeveloperContainer extends StatelessWidget {
  const FlutterDeveloperContainer({
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
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FlutterLogo(
              size: 30,
            ),
            FlutterDeveloperText()
          ],
        ),
      ),
    );
  }
}

class FlutterDeveloperText extends StatelessWidget {
  const FlutterDeveloperText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      ' Flutter Developer from Tripunithura, Kerala .',
      style: Theme.of(context).textTheme.displaySmall,
    );
  }
}
