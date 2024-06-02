import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:spnk/domain/contact_entity.dart';
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
              const WindowsLargeSectionTitle(
                title: 'Contact Me',
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.5,
                  top: screenHeight * .15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: contactList.map((e) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                      child: FadeInRight(
                        child: SizedBox(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                e.icon,
                                color: Theme.of(context).splashColor,
                              ),
                              const SizedBox(width: 20),
                              Text(
                                e.details,
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),

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
