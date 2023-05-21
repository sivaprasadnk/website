import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class WindowsMediumFamilyScreen extends StatefulWidget {
  @override
  _WindowsMediumFamilyScreenState createState() =>
      _WindowsMediumFamilyScreenState();
}

class _WindowsMediumFamilyScreenState extends State<WindowsMediumFamilyScreen> {
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
              FadeInRight(
                child: SizedBox(
                  width: screenWidth * 0.7,
                  child: ListTile(
                    title: Padding(
                      padding: EdgeInsets.only(
                        left: screenWidth * 0.1,
                        top: screenHeight * .1,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ' Father',
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
                                '      Kunhiraman P ( LIC Agent ).',
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
                        left: screenWidth * 0.1,
                        top: screenHeight * .1,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mother',
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
                                '      Nirmala NK ( Peon, High Court of Kerala)',
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
                        left: screenWidth * 0.1,
                        top: screenHeight * .1,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Elder Brother',
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
                                '      Vishnuprasad NK (Final year LLB Student)',
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
              child: Image.asset(
                'assets/images/dash/dash2.png',
                height: 280,
              ),
            ),
          ),
        )
      ],
    );
  }
}
