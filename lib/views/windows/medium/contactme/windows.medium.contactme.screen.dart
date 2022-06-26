import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';

class WindowsMediumContactMeScreen extends StatefulWidget {
  const WindowsMediumContactMeScreen({Key? key}) : super(key: key);

  @override
  State<WindowsMediumContactMeScreen> createState() =>
      _WindowsMediumContactMeScreenState();
}

class _WindowsMediumContactMeScreenState
    extends State<WindowsMediumContactMeScreen> {
  bool showIcons = false;

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      setState(() {
        showIcons = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    return Stack(
      children: [
        SizedBox(
          width: screenWidth * 0.78,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.3),
              FadeInRight(
                child: SizedBox(
                  width: screenWidth * 0.7,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: screenWidth * 0.15),
                      Icon(
                        Icons.location_on,
                        color: Theme.of(context).splashColor,
                      ),
                      const SizedBox(width: 20),
                      Text(
                        addressText,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              FadeInRight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: screenWidth * 0.15),
                    Icon(
                      Icons.call,
                      color: Theme.of(context).splashColor,
                    ),
                    const SizedBox(width: 20),
                    Text(
                      mobileNumberText,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    // Spacer(),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              FadeInRight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: screenWidth * 0.15),
                    Icon(
                      Icons.email,
                      color: Theme.of(context).splashColor,
                    ),
                    const SizedBox(width: 20),
                    Text(
                      emailText,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    // Spacer(),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.07),
              // FadeInDown(
              //   child:
              //       SocialMedia(showIcons: showIcons, screenWidth: screenWidth),
              // ),
              // 
            ],
          ),
        ),
        Positioned.fill(
          // top: 50,
          right: -50,
          child: Align(
            alignment: Alignment.bottomRight,
            child: AnimatedOpacity(
              duration: const Duration(seconds: 2),
              opacity: showIcons ? 1 : 0,
              child: Container(
                // color: Colors.amber,
                child: Image.asset(
                  'assets/images/dash/dash4.png',
                  height: 280,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
