import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/views/windows/hover_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

class WindowsSmallContactMeScreen extends StatefulWidget {
  @override
  State<WindowsSmallContactMeScreen> createState() =>
      _WindowsSmallContactMeScreenState();
}

class _WindowsSmallContactMeScreenState
    extends State<WindowsSmallContactMeScreen> {
  var _formKey = GlobalKey<FormState>();
  late Widget fbPng;
  late Widget waPng;
  late Widget instaPng;
  late Widget linkedInPng;

  bool showLottie = false;
  bool showIcons = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1)).then((value) {
      setState(() {
        showLottie = true;
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
    return Form(
      key: _formKey,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.13),
            FadeInDownBig(
              child: Container(
                width: screenWidth * 0.45,
                padding: EdgeInsets.only(left: screenWidth * 0.1),
                child: FittedBox(
                  child: Text(
                    "Contact Me",
                    style: TextStyle(
                      fontFamily: 'PlayfairDisplay',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.13),
            // Padding(
            //   padding: EdgeInsets.only(left: screenWidth * 0.22, bottom: 30),
            //   child: Container(
            //     height: 45,
            //     width: 250,
            //     decoration: BoxDecoration(
            //       border: Border.all(
            //         color: Colors.cyanAccent,
            //       ),
            //       borderRadius: BorderRadius.circular(25),
            //     ),
            //     child: Padding(
            //       padding:
            //           const EdgeInsets.only(left: 11, bottom: 0, right: 11),
            //       child: Center(
            //         child: TextFormField(
            //           style: TextStyle(
            //             color: Colors.white,
            //           ),
            //           decoration: InputDecoration(
            //             isDense: true,
            //             border: InputBorder.none,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(left: screenWidth * 0.22, bottom: 10),
            //   child: Container(
            //     height: 45,
            //     width: 250,
            //     decoration: BoxDecoration(
            //       border: Border.all(
            //         color: Colors.cyanAccent,
            //       ),
            //       borderRadius: BorderRadius.circular(25),
            //     ),
            //     child: Padding(
            //       padding:
            //           const EdgeInsets.only(left: 11, bottom: 0, right: 11),
            //       child: Center(
            //         child: TextFormField(
            //           style: TextStyle(
            //             color: Colors.white,
            //           ),
            //           decoration: InputDecoration(
            //             isDense: true,
            //             border: InputBorder.none,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(left: screenWidth * 0.22, bottom: 10),
            //   child: Container(
            //     height: 145,
            //     width: 250,
            //     decoration: BoxDecoration(
            //       border: Border.all(
            //         color: Colors.cyanAccent,
            //       ),
            //       borderRadius: BorderRadius.circular(25),
            //     ),
            //     child: Padding(
            //       padding:
            //           const EdgeInsets.only(left: 11, bottom: 0, right: 11),
            //       child: Center(
            //         child: TextFormField(
            //           style: TextStyle(
            //             color: Colors.white,
            //           ),
            //           decoration: InputDecoration(
            //             isDense: true,
            //             border: InputBorder.none,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            Row(
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
                Spacer(),
              ],
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
                Spacer(),
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
                Spacer(),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),

            AnimatedOpacity(
              duration: Duration(milliseconds: 900),
              opacity: showIcons ? 1 : 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: screenWidth * 0.22),
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
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.22, top: 80),
              child: AnimatedOpacity(
                duration: Duration(seconds: 2),
                opacity: showLottie ? 1 : 0,
                child: Lottie.asset(
                  // 'assets/lotties/astronaut-laptop.json',
                  // 'assets/lotties/online-work.json',
                  // 'assets/lotties/dev5.json',
                  'assets/lotties/contact1.json',
                  // 'assets/lotties/dev1.json',
                  height: 200,
                ),
              ),
            ),
            // Lottie.asset(
            //   'assets/lotties/contact.json',
            //   height: 200,
            // )
          ],
        ),
      ),
    );
  }
}
