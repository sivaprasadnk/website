import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({Key? key, required this.width}) : super(key: key);
  final double width;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _delayedOpacityChange(),
      builder: (context, snapshot) {
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 900),
          opacity: snapshot.connectionState == ConnectionState.done ? 1 : 0,
          child: Image.asset(
            'assets/images/picWithBlob.png',
            width: width,
          ),
        );
      },
    );
  }

  Future<void> _delayedOpacityChange() async {
    await Future.delayed(
      const Duration(milliseconds: 100),
    ); // Adjust delay as needed
  }
}
