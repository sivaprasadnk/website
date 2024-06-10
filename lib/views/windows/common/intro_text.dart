import 'package:flutter/material.dart';

class IntroText extends StatelessWidget {
  const IntroText({
    Key? key,
    required this.leftPadding,
    this.splitText = true,
  }) : super(key: key);
  final double leftPadding;
  final bool splitText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hi,\nI 'm Sivaprasad NK .",
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const FlutterLogo(
                size: 18,
              ),
              const SizedBox(width: 5),
              Text(
                'Flutter Developer',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              if (!splitText)
                Text(
                  ' from Tripunithura, Kerala .',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
            ],
          ),
          if (splitText)
            Text(
              'from Tripunithura, Kerala .',
              style: Theme.of(context).textTheme.displaySmall,
            ),
        ],
      ),
    );
  }
}
