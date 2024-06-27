import 'package:flutter/material.dart';
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';

class IntroText extends StatefulWidget {
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
  State<IntroText> createState() => _IntroTextState();
}

class _IntroTextState extends State<IntroText> {
  bool show = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        show = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: widget.leftPadding, top: widget.topPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.showImage)
            AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              child: show
                  ? AnimatedOpacity(
                      duration: const Duration(seconds: 1),
                      opacity: show ? 1 : 0,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: widget.imageWidth,
                          minWidth: widget.imageWidth * 0.1,
                        ),
                        // color: Colors.amber,
                        child: Image.asset(
                          'assets/images/dash/dash1.png',
                          frameBuilder:
                              (context, child, frame, wasSynchronouslyLoaded) {
                            return child;
                          },
                          height: widget.imageHeight,
                          width: widget.imageWidth,
                        ),
                      ),
                    )
                  : SizedBox(
                      height: widget.imageHeight,
                    ),
            )
          else
            SizedBox(
              height: widget.imageHeight,
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
