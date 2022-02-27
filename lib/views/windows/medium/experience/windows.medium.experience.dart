import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WindowsMediumExperienceScreen extends StatefulWidget {
  @override
  _WindowsMediumExperienceScreenState createState() =>
      _WindowsMediumExperienceScreenState();
}

class _WindowsMediumExperienceScreenState
    extends State<WindowsMediumExperienceScreen> {
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
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight * 0.13),
          // SectionTitle(
          //   screenWidth: screenWidth,
          //   title: 'Experience',
          // ),
          FadeInRight(
            child: Container(
              width: screenWidth * 0.7,
              child: ListTile(
                title: Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.2,
                    top: screenHeight * .1,
                  ),
                  child: Column(
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
            ),
          ),
          FadeInRight(
            child: SizedBox(
              width: screenWidth * 0.7,
              child: ListTile(
                title: Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.2,
                    top: screenHeight * .1,
                  ),
                  child: Column(
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
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.25, top: 50),
            child: AnimatedOpacity(
              duration: Duration(seconds: 2),
              opacity: showLottie ? 1 : 0,
              child: Lottie.asset(
                'assets/lotties/work.json',
                height: screenHeight * 0.22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
