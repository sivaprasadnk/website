import 'package:flutter/material.dart';
import 'package:spnk/views/windows/large/common.widgets/section.title.dart';

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
    Future.delayed(const Duration(seconds: 1)).then((value) {
      setState(() {
        showLottie = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: screenWidth * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.2),
              WindowsLargeSectionTitle(title: 'Experience', width: screenWidth),
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
                        style: Theme.of(context).textTheme.bodyText1,
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
                            style: Theme.of(context).textTheme.bodyText1,
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
                            style: Theme.of(context).textTheme.bodyText1,
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
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .backgroundColor,
                          ),
                          Text(
                            '      Indbytes Technologies',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .backgroundColor,

                            // backgroundColor: Colors.white,
                          ),
                          Text(
                            '      12/2020 - Present',
                            style: Theme.of(context).textTheme.bodyText1,
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
              duration: const Duration(seconds: 2),
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
