import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/route_provider.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/android/backup/contact_me/android.contactme.screen.dart';
import 'package:spnk/views/android/backup/experience/android.experience.screen.dart';
import 'package:spnk/views/android/backup/menu/android.menu.screen.dart';
import 'package:spnk/views/android/backup/projects/android.projects.screen.dart';

class AndroidHomeScreen extends StatefulWidget {
  static const routeName = '/AndroidHome';
  const AndroidHomeScreen({Key? key}) : super(key: key);

  @override
  _AndroidHomeScreenState createState() => _AndroidHomeScreenState();
}

class _AndroidHomeScreenState extends State<AndroidHomeScreen>
    with SingleTickerProviderStateMixin {
  bool isDarkModeEnabled = false;
  late AnimationController _animationController;
  late Animation _animation;
  bool homeSelected = true, projectSelected = false;
  late bool showImage;

  bool menuSelected = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..repeat();
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.forward();
    _animation.addListener(() {
      setState(() {
        // rightPos = _animation.value - 360;
      });
    });

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
    showImage = false;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    var screenWidth = screenSize.width;
    var screen = Provider.of<RouteProvider>(context).screen.toString();
    var menuSelectedCheck =
        Provider.of<RouteProvider>(context, listen: true).menuSelected as bool;
    // debugPrint('...@@123 menuSelectedCheck..$menuSelectedCheck');
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: ((screen == "MyProjects") ||
                    (screen == "ContactMe") ||
                    (screen == "Experience")) &&
                !menuSelectedCheck
            ? Color.fromRGBO(206, 45, 1, 1)
            : Color.fromRGBO(206, 45, 1, 1),
        body: Stack(
          children: [
            if (screen == "Home")
              Positioned.fill(
                child: AnimatedOpacity(
                  opacity: !menuSelectedCheck ? 1 : 0,
                  duration: Duration(milliseconds: 900),
                  child: Align(
                    child: CustomPaint(
                      painter: AndroidHomeBgCurve(ctx: context),
                      child: Container(),
                    ),
                  ),
                ),
              ),
            if ((screen == "Home") && (!menuSelectedCheck))
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 20),
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(Icons.menu, color: Colors.white),
                    onPressed: () {
                      Provider.of<RouteProvider>(context, listen: false)
                          .setMenuSelected(check: true);
                    },
                  ),
                ),
              ),
            // if ((screen == "Home") && (!menuSelectedCheck))
            //   Positioned.fill(
            //     top: screenSize.height * 0.05,
            //     right: 50,
            //     child: Align(
            //       alignment: Alignment.topCenter,
            //       child: Image(
            //         height: 100,
            //         image: AssetImage(
            //           'assets/images/wishText.png',
            //         ),
            //       ),
            //     ),
            //   ),
            if ((screen == "Home") && (!menuSelectedCheck))
              Positioned.fill(
                bottom: screenSize.height * 0.05,
                right: 50,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FadeInUpBig(
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 70),
                          child: ProPicWidget(
                            radius: screenWidth * 0.23,
                          ),
                        ),
                        Positioned.fill(
                          top: -15,
                          right: -30,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Image.asset('assets/images/cap.png'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            if ((screen == "Home") && (!menuSelectedCheck))
              Positioned.fill(
                left: -10,
                bottom: MediaQuery.of(context).size.height * 0.15,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: AnimatedOpacity(
                    opacity: 1,
                    duration: Duration(milliseconds: 900),
                    child: Container(
                      height: MediaQuery.of(context).size.width * 0.5,
                      child: Image(
                        // height: MediaQuery.of(context).size.height * 0.3,
                        image: AssetImage('assets/images/xmas_tree.png'),
                      ),
                    ),
                  ),
                ),
              ),
            !menuSelectedCheck
                ? screen == "Home"
                    ? Container(
                        height: screenSize.height,
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: screenSize.height * 0.1,
                                ),
                                Center(
                                  child: Opacity(
                                    opacity: _animation.value,
                                    child: Image(
                                      height: screenSize.height * 0.18,
                                      image: AssetImage(
                                        'assets/images/wishText.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: screenWidth * 0.1),
                                  child: FadeInDownBig(
                                    child: Container(
                                      width: screenWidth * 0.7,
                                      child: FittedBox(
                                        child: Text(
                                          "Hi, \nI 'm Sivaprasad NK .",
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
                                  padding:
                                      EdgeInsets.only(left: screenWidth * 0.1),
                                  child: FadeInLeftBig(
                                    child: Container(
                                      // width: screenWidth * 0.8,
                                      child: Text(
                                        "\nFlutter Developer from \nTripunithura, Kerala .",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 23,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ],
                        ),
                      )
                    : screen == "ContactMe"
                        ? AndroidContactMeScreen(
                            screenHeight: MediaQuery.of(context).size.height,
                          )
                        : screen == "MyProjects"
                            ? AndroidProjects(
                                screenHeight:
                                    MediaQuery.of(context).size.height,
                              )
                            : screen == "Experience"
                                ? AndroidExperienceScreen(
                                    screenHeight:
                                        MediaQuery.of(context).size.height)
                                : Container()
                : AndroidMenuScreen()
          ],
        ),
      ),
    );
  }
}