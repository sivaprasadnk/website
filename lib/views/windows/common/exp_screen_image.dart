import 'package:flutter/material.dart';

class ExpScreenImage extends StatefulWidget {
  const ExpScreenImage({Key? key}) : super(key: key);

  @override
  State<ExpScreenImage> createState() => _ExpScreenImageState();
}

class _ExpScreenImageState extends State<ExpScreenImage> {
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
      alignment: Alignment.centerLeft,
      child: AnimatedOpacity(
        duration: const Duration(seconds: 2),
        opacity: showLottie ? 1 : 0,
        child: Image.asset(
          'assets/images/dash/dash2.png',
          height: 350,
        ),
      ),
    );
  }
}
