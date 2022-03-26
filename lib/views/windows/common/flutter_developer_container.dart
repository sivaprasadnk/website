import 'package:flutter/material.dart';

class FlutterDeveloperContainer extends StatelessWidget {
  const FlutterDeveloperContainer({
    Key? key,
    required this.showName,
    required this.screenWidth,
  }) : super(key: key);

  final bool showName;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(seconds: 1),
      opacity: showName ? 1 : 0,
      child: Container(
        margin: EdgeInsets.only(
          left: screenWidth * 0.12,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FlutterLogo(
              size: 30,
              style: FlutterLogoStyle.markOnly,
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
      style: Theme.of(context).textTheme.subtitle2,
    );
  }
}
