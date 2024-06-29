import 'dart:async';

import 'package:flutter/material.dart';

class FooterText extends StatefulWidget {
  const FooterText({Key? key}) : super(key: key);

  @override
  State<FooterText> createState() => _FooterTextState();
}

class _FooterTextState extends State<FooterText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat();

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0, -1),
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String txt1 = "Copyright @Sivaprasad";
  String txt2 = "Made in love";
  String curntText = 'Copyright @Sivaprasad';
  @override
  void initState() {
    // Timer(const Duration(milliseconds: 200), () => _controller.forward());
    Timer.periodic(const Duration(milliseconds: 2400), (_) {
      setState(() {
        curntText = _offsetAnimation.value.dx == 0
            ? curntText == txt1
                ? txt2
                : txt1
            : curntText == txt1
                ? txt2
                : txt1;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      // offset: const Offset(0, -1),
      // duration: const Duration(seconds: 1),
      child: FadeTransition(
        opacity: _controller,
        child: Text(curntText),
      ),
    );
  }
}
