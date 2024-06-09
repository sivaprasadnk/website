import 'package:flutter/material.dart';

class ContactScreenImage extends StatefulWidget {
  const ContactScreenImage({
    Key? key,
    required this.alignment,
    required this.height,
  }) : super(key: key);
  final AlignmentGeometry alignment;
  final double height;
  @override
  State<ContactScreenImage> createState() => _ContactScreenImageState();
}

class _ContactScreenImageState extends State<ContactScreenImage> {
  bool showImage = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then((value) {
      setState(() {
        showImage = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.alignment,
      child: AnimatedOpacity(
        duration: const Duration(seconds: 2),
        opacity: showImage ? 1 : 0,
        child: Image.asset(
          'assets/images/dash/dash4.png',
          height: widget.height,
        ),
      ),
    );
  }
}
