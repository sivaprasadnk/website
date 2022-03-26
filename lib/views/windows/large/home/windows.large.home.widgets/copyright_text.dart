import 'package:flutter/material.dart';

class CopyrightText extends StatelessWidget {
  const CopyrightText({
    Key? key,
    required this.size,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 10),
      child: Text(
        'Copyright © 2022 Sivaprasad NK .',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto',
          fontSize: size,
          color: Colors.black54,
        ),
      ),
    );
  }
}
