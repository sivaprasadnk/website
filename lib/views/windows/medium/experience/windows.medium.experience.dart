import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

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
    Future.delayed(const Duration(seconds: 1)).then((value) {
      setState(() {
        showLottie = true;
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
              SizedBox(height: screenHeight * 0.13),
              // SectionTitle(
              //   screenWidth: screenWidth,
              //   title: 'Experience',
              // ),
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
                            ' Java, Postgres Programmer',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                radius: 5,
                                backgroundColor: Theme.of(context).splashColor,
                              ),
                              Text(
                                '      Bayasys Infotech Pvt Ltd.',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                radius: 5,
                                backgroundColor: Theme.of(context).splashColor,
                              ),
                              Text(
                                '      07/2019 - 09/2020',
                                style: Theme.of(context).textTheme.bodyLarge,
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
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                radius: 5,
                                backgroundColor: Theme.of(context).splashColor,
                              ),
                              Text(
                                '      Indbytes Technologies',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                radius: 5,
                                backgroundColor: Theme.of(context).splashColor,
                              ),
                              Text(
                                '      12/2020 - 05/2023',
                                style: Theme.of(context).textTheme.bodyLarge,
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
                            'Senior Mobile app Developer',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                radius: 5,
                                backgroundColor: Theme.of(context).splashColor,
                              ),
                              Text(
                                '      Invenics Services India Pvt Ltd',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                radius: 5,
                                backgroundColor: Theme.of(context).splashColor,
                              ),
                              Text(
                                '      05/2023 - Present',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Flexible(
              //   child: AnimatedOpacity(
              //     duration: Duration(seconds: 2),
              //     opacity: showLottie ? 1 : 0,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.end,
              //       children: [
              //         Spacer(),
              //         // SizedBox(width: 500),
              //         Image.asset(
              //           'assets/images/dash/dash2.png',
              //           height: 280,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        Positioned.fill(
          right: -50,
          child: Align(
            alignment: Alignment.bottomRight,
            child: AnimatedOpacity(
              duration: const Duration(seconds: 2),
              opacity: showLottie ? 1 : 0,
              child: Container(
                // color: Colors.amber,
                child: Image.asset(
                  'assets/images/dash/dash2.png',
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
