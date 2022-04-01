import 'package:flutter/material.dart';

class CopyrightText extends StatelessWidget {
  const CopyrightText({
    Key? key,
    required this.size,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Copyright © 2022 Sivaprasad NK .',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'Roboto',
        fontSize: size,
        color: Colors.grey,
      ),
    );
  }
}
