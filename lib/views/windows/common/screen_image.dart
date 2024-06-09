import 'package:flutter/material.dart';

class ScreenImage extends StatefulWidget {
  const ScreenImage({
    Key? key,
    required this.alignment,
    required this.height,
    required this.imagePath,
  }) : super(key: key);

  final AlignmentGeometry alignment;
  final double height;
  final String imagePath;

  @override
  State<ScreenImage> createState() => _ScreenImageState();
}

class _ScreenImageState extends State<ScreenImage> {
  bool showLottie = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then((value) {
      setState(() {
        showLottie = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.alignment,
      child: AnimatedOpacity(
        duration: const Duration(seconds: 2),
        opacity: showLottie ? 1 : 0,
        child: Image.asset(
          widget.imagePath,
          // 'assets/images/dash/dash2.png',
          height: widget.height,
        ),
      ),
    );
  }
}
