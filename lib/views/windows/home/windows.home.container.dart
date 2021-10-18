import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class WindowsHomeContainer extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  const WindowsHomeContainer(
      {required this.screenWidth, required this.screenHeight});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: screenWidth / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.2),
                child: FadeInDownBig(
                  child: Container(
                    width: screenWidth * 0.5,
                    child: FittedBox(
                      child: Text(
                        "Hi, \nI 'm Sivaprasad NK .",
                        style: TextStyle(
                          fontFamily: 'PlayfairDisplay',
                          fontWeight: FontWeight.bold,
                          // fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.2),
                child: FadeInLeftBig(
                  child: Container(
                    child: FittedBox(
                      child: Text(
                        "\nFlutter Developer from Tripunithura, Kerala .",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: screenWidth / 2,
          child: Stack(
            children: [
              Positioned.fill(
                bottom: screenHeight * 0.1,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: FadeInUpBig(
                    child: Container(
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage(
                          'assets/images/propic3.jpg',
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
