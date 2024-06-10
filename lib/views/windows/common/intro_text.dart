import 'package:flutter/material.dart';

class IntroText extends StatelessWidget {
  const IntroText({
    Key? key,
    required this.leftPadding,
    required this.topPadding,
    required this.imageHeight,
    this.splitText = true,
  }) : super(key: key);
  final double leftPadding;
  final double topPadding;
  final double imageHeight;
  final bool splitText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding, top: topPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder(
            future: Future.delayed(const Duration(milliseconds: 100)),
            builder: (context, snapshot) {
              return AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity:
                    snapshot.connectionState == ConnectionState.done ? 1 : 0,
                child: Image.asset(
                  'assets/images/dash/dash1.png',
                  height: imageHeight,
                ),
              );
            },
          ),
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
