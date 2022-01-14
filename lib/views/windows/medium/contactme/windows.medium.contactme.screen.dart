import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/views/windows/hover_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

class WindowsMediumContactMeScreen extends StatefulWidget {
  const WindowsMediumContactMeScreen({Key? key}) : super(key: key);

  @override
  State<WindowsMediumContactMeScreen> createState() =>
      _WindowsMediumContactMeScreenState();
}

class _WindowsMediumContactMeScreenState
    extends State<WindowsMediumContactMeScreen> {
  late Widget fbPng;
  late Widget waPng;
  late Widget instaPng;
  late Widget linkedInPng;

  bool showIcons = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 500)).then((value) {
      setState(() {
        showIcons = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    double iconSize = 30;
    fbPng = Image.asset(fbPngAssetName, height: iconSize);
    waPng = Image.asset(whatsappPngeAssetName, height: iconSize);
    instaPng = Image.asset(instaPngImageName, height: iconSize);
    linkedInPng = Image.asset(linkedInAssetName,
        height: iconSize, color: Colors.blue[900]);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight * 0.13),
          FadeInDownBig(
            child: Container(
              padding: EdgeInsets.only(left: screenWidth * 0.1),
              child: Text(
                "Contact Me",
                style: TextStyle(
                  fontFamily: 'PlayfairDisplay',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.25),
          SizedBox(
            width: screenWidth * 0.7,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: screenWidth * 0.22),
                Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
                SizedBox(width: 20),
                Text(
                  addressText,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                // Spacer(),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: screenWidth * 0.22),
              Icon(
                Icons.call,
                color: Colors.white,
              ),
              SizedBox(width: 20),
              Text(
                mobileNumberText,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              // Spacer(),
            ],
          ),
          SizedBox(height: screenHeight * 0.03),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: screenWidth * 0.22),
              Icon(
                Icons.email,
                color: Colors.white,
              ),
              SizedBox(width: 20),
              Text(
                emailText,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              // Spacer(),
            ],
          ),
          SizedBox(height: screenHeight * 0.13),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.22),
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 900),
              opacity: showIcons ? 1 : 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Container(
                      child: fbPng,
                    ),
                    onTap: () {
                      launch(fbLink);
                    },
                  ).showCursorOnHover,
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    child: instaPng,
                    onTap: () {
                      launch(instaLink);
                    },
                  ).showCursorOnHover,
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    child: waPng,
                    onTap: () {
                      launch(whatsappWebLink);
                    },
                  ).showCursorOnHover,
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    child: linkedInPng,
                    onTap: () {
                      launch(linkedInLink);
                    },
                  ).showCursorOnHover,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
