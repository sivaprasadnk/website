import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';

class WindowsLargeContactMeScreen extends StatefulWidget {
  @override
  _WindowsLargeContactMeScreenState createState() =>
      _WindowsLargeContactMeScreenState();
}

class _WindowsLargeContactMeScreenState
    extends State<WindowsLargeContactMeScreen> {
  bool showLottie = false;

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1)).then((value) {
      setState(() {
        showLottie = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.2),
              FadeInDown(
                child: Container(
                  width: screenWidth * 0.25,
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
              SizedBox(height: screenHeight * 0.2),
              // Padding(
              //   padding: EdgeInsets.only(left: screenWidth * 0.1, bottom: 30),
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
              //   padding: EdgeInsets.only(left: screenWidth * 0.1, bottom: 10),
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
              //   padding: EdgeInsets.only(left: screenWidth * 0.1, bottom: 10),
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
              //       child: TextFormField(
              //         style: TextStyle(
              //           color: Colors.white,
              //         ),
              //         decoration: InputDecoration(
              //           isDense: true,
              //           border: InputBorder.none,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              //-------------------------------------

              FadeInRight(
                child: SizedBox(
                  width: screenWidth * 0.7,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: screenWidth * 0.1),
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
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              FadeInRight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: screenWidth * 0.1),
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
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              FadeInRight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: screenWidth * 0.1),
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
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.07),

              FadeInDown(
                child: Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.1),
                  child: SocialMedia(
                    screenWidth: screenWidth,
                    showIcons: true,
                    isLarge: true,
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned.fill(
          top: 100,
          right: 50,
          child: Align(
            alignment: Alignment.centerRight,
            child: AnimatedOpacity(
              duration: Duration(seconds: 2),
              opacity: showLottie ? 1 : 0,
              child: Lottie.asset(
                // 'assets/lotties/astronaut-laptop.json',
                // 'assets/lotties/online-work.json',
                // 'assets/lotties/dev5.json',
                'assets/lotties/contact1.json',
                // 'assets/lotties/contactme.json',
                // 'assets/lotties/dev1.json',
                height: 200,
              ),
            ),
          ),
        )
      ],
    );
  }
}
