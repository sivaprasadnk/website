import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/windows/large/common.widgets/section.title.dart';

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
              WindowsLargeSectionTitle(title: 'Contact Me', width: screenWidth),
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.5,
                  top: screenHeight * .1,
                ),
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
                              color: Theme.of(context).splashColor,
                            ),
                            const SizedBox(width: 20),
                            Text(
                              addressText,
                              style: Theme.of(context).textTheme.bodyText1,
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
                            color: Theme.of(context).splashColor,
                          ),
                          const SizedBox(width: 20),
                          Text(
                            mobileNumberText,
                            style: Theme.of(context).textTheme.bodyText1,
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
                            color: Theme.of(context).splashColor,
                          ),
                          const SizedBox(width: 20),
                          Text(
                            emailText,
                            style: Theme.of(context).textTheme.bodyText1,
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
                'assets/images/dash/dash4.png',
                height: 350,
              ),
            ),
          ),
        )
      ],
    );
  }
}
