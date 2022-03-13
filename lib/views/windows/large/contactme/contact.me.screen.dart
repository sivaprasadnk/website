import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';

class WindowsLargeContactMeScreen extends StatefulWidget {
  @override
  _WindowsLargeContactMeScreenState createState() =>
      _WindowsLargeContactMeScreenState();
}

class _WindowsLargeContactMeScreenState
    extends State<WindowsLargeContactMeScreen>
    with AutomaticKeepAliveClientMixin {
  bool showLottie = false;

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  bool get wantKeepAlive => true;

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
    super.build(context);

    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: screenWidth * 0.02),
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
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  AnimatedOpacity(
                    duration: Duration(seconds: 2),
                    opacity: showLottie ? 1 : 0,
                    child: Image.asset(
                      'assets/images/dash/dash4.png',
                      height: 350,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInRight(
                          child: SizedBox(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
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
                            mainAxisSize: MainAxisSize.min,
                            children: [
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
                            mainAxisSize: MainAxisSize.min,
                            children: [
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
                            padding: EdgeInsets.only(left: screenWidth * 0.0),
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
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
