import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:spnk/views/windows/small/windows.small.common.widgets.dart';

class WindowsSmallExperienceScreen extends StatefulWidget {
  @override
  State<WindowsSmallExperienceScreen> createState() =>
      _WindowsSmallExperienceScreenState();
}

class _WindowsSmallExperienceScreenState
    extends State<WindowsSmallExperienceScreen> {
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
          SectionTitle(screenWidth: screenWidth, title: 'Experience'),
          SizedBox(height: screenHeight * 0.13),
          FadeInRight(
            child: Container(
              width: screenWidth * 0.7,
              child: ListTile(
                title: Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.2,
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
          Flexible(
            child: AnimatedOpacity(
              duration: Duration(seconds: 2),
              opacity: showLottie ? 1 : 0,
              child: Image.asset(
                'assets/images/dash/dash2.png',
                height: 280,
              ),
              // child: Lottie.asset(
              //   'assets/lotties/work.json',
              //   height: screenHeight * 0.22,
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
