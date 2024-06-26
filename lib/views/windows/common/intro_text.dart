import 'package:flutter/material.dart';
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';

class IntroText extends StatelessWidget {
  const IntroText({
    Key? key,
    required this.leftPadding,
    required this.topPadding,
    required this.imageHeight,
    required this.imageWidth,
    this.showImage = true,
  }) : super(key: key);
  final double leftPadding;
  final double topPadding;
  final double imageHeight;
  final double imageWidth;
  final bool showImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding, top: topPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showImage)
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: imageWidth,
                minWidth: imageWidth * 0.1,
              ),
              // color: Colors.amber,
              child: Image.asset(
                'assets/images/dash/dash1.png',
                // height: imageHeight,
                width: imageWidth,
              ),
            )
          else
            SizedBox(
              height: imageHeight,
            ),
          Text(
            "Hi,\nI 'm Sivaprasad NK .",
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // const FlutterLogo(
              //   size: 18,
              // ),
              // const SizedBox(width: 5),
              Flexible(
                child: SizedBox(
                  width: context.screenWidth * 0.4,
                  child: Text(
                    'Flutter Developer and Fitness Enthusiast from Tripunithura, Kerala .',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
