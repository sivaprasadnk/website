import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:spnk/views/provider/data_provider.dart';

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
    final expList = ref.watch(experienceProvider);

    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.13),
          child: SizedBox(
            width: screenWidth * 0.78,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: expList.map((exp) {
                return FadeInRight(
                  child: SizedBox(
                    width: screenWidth * 0.7,
                    child: ListTile(
                      title: Padding(
                        padding: EdgeInsets.only(
                          left: screenWidth * 0.2,
                          top: screenHeight * .05,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ' ${exp.title}',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  radius: 5,
                                  backgroundColor:
                                      Theme.of(context).splashColor,
                                ),
                                Text(
                                  '      ${exp.orgName}',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  radius: 5,
                                  backgroundColor:
                                      Theme.of(context).splashColor,
                                ),
                                Text(
                                  '      ${exp.startDate} - ${exp.endDate}',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        // Positioned.fill(
        //   child: Align(
        //     alignment: Alignment.bottomRight,
        //     child: AnimatedOpacity(
        //       duration: const Duration(seconds: 2),
        //       opacity: showLottie ? 1 : 0,
        //       child: Image.asset(
        //         'assets/images/dash/dash2.png',
        //         height: 280,
        //       ),
        //     ),
        //   ),
        // )
      ],
    );
  }
}
