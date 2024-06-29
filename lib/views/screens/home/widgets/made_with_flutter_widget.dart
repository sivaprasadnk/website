import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:spnk/utils/common_colors.dart';

class MadeWithFlutterWidget extends StatelessWidget {
  const MadeWithFlutterWidget({
    Key? key,
    this.mainAxisAlignment = MainAxisAlignment.end,
    required this.size,
  }) : super(key: key);
  final MainAxisAlignment mainAxisAlignment;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Text(
          ' Made with ',
          style: TextStyle(
            // fontWeight: FontWeight.bold,
            fontSize: size,
            color: kGreyColor,
            fontFamily: 'Roboto',
          ),
        ),
        AvatarGlow(
          glowColor: kGreyColor,
          endRadius: 20.0,
          showTwoGlows: false,
          child: const Icon(
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
            color: kGreyColor,

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
            color: kGreyColor,

            fontFamily: 'Roboto',
          ),
        ),
      ],
    );
  }
}
