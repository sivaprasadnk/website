import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:spnk/domain/contact_entity.dart';

class WindowsMediumContactMeScreen extends StatefulWidget {
  const WindowsMediumContactMeScreen({Key? key}) : super(key: key);

  @override
  State<WindowsMediumContactMeScreen> createState() =>
      _WindowsMediumContactMeScreenState();
}

class _WindowsMediumContactMeScreenState
    extends State<WindowsMediumContactMeScreen> {
  bool showIcons = false;

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      setState(() {
        showIcons = true;
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
          child: Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: contactList.map((e) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: FadeInRight(
                    child: SizedBox(
                      width: screenWidth * 0.7,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: screenWidth * 0.15),
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
        ),
        Positioned.fill(
          // top: 50,
          right: -50,
          child: Align(
            alignment: Alignment.bottomRight,
            child: AnimatedOpacity(
              duration: const Duration(seconds: 2),
              opacity: showIcons ? 1 : 0,
              child: Image.asset(
                'assets/images/dash/dash4.png',
                height: 280,
              ),
            ),
          ),
        )
      ],
    );
  }
}
