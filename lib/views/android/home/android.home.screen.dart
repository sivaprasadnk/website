import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/route_provider.dart';
import 'package:spnk/utils/common_widgets.dart';

class AndroidHomeScreen extends StatefulWidget {
  const AndroidHomeScreen({Key? key}) : super(key: key);

  @override
  _AndroidHomeScreenState createState() => _AndroidHomeScreenState();
}

class _AndroidHomeScreenState extends State<AndroidHomeScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    return Stack(
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    right: 10, top: 20, left: screenWidth * 0.8),
                child: IconButton(
                  icon: Icon(Icons.menu, color: Colors.white),
                  onPressed: () {
                    Provider.of<RouteProvider>(context, listen: false)
                        .setMenuSelected(check: true);
                  },
                ),
              ),
              SizedBox(height: screenHeight * 0.23),
              // Container(
              //   margin: EdgeInsets.only(
              //     left: screenWidth * 0.15,
              //   ),
              //   child: Lottie.asset(
              //     'assets/lotties/robot_hello.json',
              //     height: 200,
              //   ),
              // ),
              // Image.asset(
              //   'assets/images/bot.png',
              //   height: screenHeight * 0.2,
              // ),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.1),
                child: FadeInDown(
                  child: Container(
                    width: screenWidth * 0.7,
                    child: FittedBox(
                      child: Text(
                        "Hi , \nI 'm Sivaprasad NK .",
                        style: TextStyle(
                            fontFamily: 'PlayfairDisplay',
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.1, top: 15),
                child: FadeInLeft(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            FlutterLogo(
                              size: 30,
                              // size: size / 1.8,
                              style: FlutterLogoStyle.markOnly,
                            ),
                            Text(
                              ' Flutter Developer from',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                // fontSize: size / 2.8,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 5),
                        Text(
                          ' Tripunithura, Kerala .',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            // fontSize: size / 2.8,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    // width: screenWidth * 0.8,
                    // child: Text(
                    //   "\nFlutter Developer from \nTripunithura, Kerala .",
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.white,
                    //     fontSize: 23,
                    //   ),
                    // ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),

              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.15),
                  child: ProPicMediumWithBlob(
                    height: screenHeight * 0.3,
                    bottomPadding: screenHeight * .02,
                    leftPadding: screenWidth * 0.02,
                  ),
                  // child: Stack(
                  //   children: [
                  //     Image.asset(
                  //       'assets/images/blob1.png',
                  //       height: screenHeight * 0.4,
                  //     ),
                  //     Positioned.fill(
                  //       bottom: 10,
                  //       right: 15,
                  //       child: Align(
                  //         alignment: Alignment.center,
                  //         child: ProPicWidget(
                  //           radius: screenWidth * 0.25,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ),
              )
            ],
          ),
        ),
        Positioned.fill(
          top: screenHeight * 0.05,
          child: Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/images/dash/dash1.png',
              height: 230,
            ),
            // child: Lottie.asset(
            //   'assets/lotties/robot_hello.json',
            //   height: 200,
            // ),
          ),
        )
      ],
    );
  }
}
