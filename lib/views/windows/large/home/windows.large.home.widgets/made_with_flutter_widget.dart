import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class MadeWithFlutterWidget extends StatelessWidget {
  const MadeWithFlutterWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          ' Made with ',
          style: TextStyle(
            // fontWeight: FontWeight.bold,
            fontSize: size,
            color: Colors.grey,
            fontFamily: 'Roboto',
          ),
        ),
        const AvatarGlow(
          glowColor: Colors.grey,
          endRadius: 20.0,
          showTwoGlows: false,
          child: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ),
        // CircleAvatar(
        //   child: Icon(
        //     Icons.favorite,
        //     color: Colors.red,
        //   ),
        // ),
        Text(
          ' in ',
          style: TextStyle(
            // fontWeight: FontWeight.bold,
            fontSize: size,
            color: Colors.grey,

            fontFamily: 'Roboto',
          ),
        ),
        FlutterLogo(
          size: size,
        ),
        Text(
          ' Flutter  ',
          style: TextStyle(
            // fontWeight: FontWeight.bold,
            fontSize: size,
            color: Colors.grey,

            fontFamily: 'Roboto',
          ),
        ),
      ],
    );
  }
}
