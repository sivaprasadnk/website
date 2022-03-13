import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class WindowsLargeExperienceScreen extends StatefulWidget {
  @override
  _WindowsLargeExperienceScreenState createState() =>
      _WindowsLargeExperienceScreenState();
}

class _WindowsLargeExperienceScreenState
    extends State<WindowsLargeExperienceScreen>
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
                      "Experience",
                      style: TextStyle(
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.5,
                  top: screenHeight * .1,
                ),
                child: ListTile(
                  title: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' Java, Postgres Programmer',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.white,
                          ),
                          Text(
                            '      Bayasys Infotech Pvt Ltd.',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.white,
                          ),
                          Text(
                            '      07/2019 - 09/2020',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.5,
                  top: screenHeight * .05,
                ),
                child: ListTile(
                  title: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Flutter Developer',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.white,
                          ),
                          Text(
                            '      Indbytes Technologies',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.white,
                          ),
                          Text(
                            '      12/2020 - Present',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          top: 100,
          left: screenWidth * 0.0,
          child: Align(
            alignment: Alignment.centerLeft,
            child: AnimatedOpacity(
              duration: Duration(seconds: 2),
              opacity: showLottie ? 1 : 0,
              child: Image.asset(
                'assets/images/dash/dash2.png',
                height: 350,
              ),
            ),
          ),
        )
      ],
    );
  }
}
