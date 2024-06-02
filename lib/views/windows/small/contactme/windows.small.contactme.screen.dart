import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/views/windows/small/windows.small.common.widgets.dart';

class WindowsSmallContactMeScreen extends StatefulWidget {
  @override
  State<WindowsSmallContactMeScreen> createState() =>
      _WindowsSmallContactMeScreenState();
}

class _WindowsSmallContactMeScreenState
    extends State<WindowsSmallContactMeScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  bool showLottie = false;
  bool showIcons = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then((value) {
      setState(() {
        showLottie = true;
        showIcons = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    return Form(
      key: _formKey,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.13),
            SectionTitle(screenWidth: screenWidth, title: 'Contact Me'),
            SizedBox(height: screenHeight * 0.13),
            // Padding(
            //   padding: EdgeInsets.only(left: screenWidth * 0.22, bottom: 30),
            //   child: Container(
            //     height: 45,
            //     width: 250,
            //     decoration: BoxDecoration(
            //       border: Border.all(
            //         color: Colors.cyanAccent,
            //       ),
            //       borderRadius: BorderRadius.circular(25),
            //     ),
            //     child: Padding(
            //       padding:
            //           const EdgeInsets.only(left: 11, bottom: 0, right: 11),
            //       child: Center(
            //         child: TextFormField(
            //           style: TextStyle(
            //             color: Colors.white,
            //           ),
            //           decoration: InputDecoration(
            //             isDense: true,
            //             border: InputBorder.none,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(left: screenWidth * 0.22, bottom: 10),
            //   child: Container(
            //     height: 45,
            //     width: 250,
            //     decoration: BoxDecoration(
            //       border: Border.all(
            //         color: Colors.cyanAccent,
            //       ),
            //       borderRadius: BorderRadius.circular(25),
            //     ),
            //     child: Padding(
            //       padding:
            //           const EdgeInsets.only(left: 11, bottom: 0, right: 11),
            //       child: Center(
            //         child: TextFormField(
            //           style: TextStyle(
            //             color: Colors.white,
            //           ),
            //           decoration: InputDecoration(
            //             isDense: true,
            //             border: InputBorder.none,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(left: screenWidth * 0.22, bottom: 10),
            //   child: Container(
            //     height: 145,
            //     width: 250,
            //     decoration: BoxDecoration(
            //       border: Border.all(
            //         color: Colors.cyanAccent,
            //       ),
            //       borderRadius: BorderRadius.circular(25),
            //     ),
            //     child: Padding(
            //       padding:
            //           const EdgeInsets.only(left: 11, bottom: 0, right: 11),
            //       child: Center(
            //         child: TextFormField(
            //           style: TextStyle(
            //             color: Colors.white,
            //           ),
            //           decoration: InputDecoration(
            //             isDense: true,
            //             border: InputBorder.none,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            ContactDetailsItem(
              screenWidth: screenWidth,
              icon: Icons.location_on,
              details: addressText,
            ),
            SizedBox(height: screenHeight * 0.03),
            ContactDetailsItem(
              screenWidth: screenWidth,
              icon: Icons.call,
              details: mobileNumberText,
            ),
            SizedBox(height: screenHeight * 0.03),
            ContactDetailsItem(
              screenWidth: screenWidth,
              icon: Icons.email,
              details: emailText,
            ),
            SizedBox(height: screenHeight * 0.03),

            // SocialMedia(
            //   showIcons: showIcons,
            //   screenWidth: screenWidth,
            // ),
            const SizedBox(height: 50),
            Flexible(
              child: AnimatedOpacity(
                duration: const Duration(seconds: 2),
                opacity: showIcons ? 1 : 0,
                child: Image.asset(
                  'assets/images/dash/dash4.png',
                  height: 250,
                ),
              ),
            ),
            // Lottie.asset(
            //   'assets/lotties/contact.json',
            //   height: 200,
            // )
          ],
        ),
      ),
    );
  }
}

class ContactDetailsItem extends StatelessWidget {
  const ContactDetailsItem({
    required this.screenWidth,
    required this.icon,
    required this.details,
  });
  final double screenWidth;
  final String details;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: screenWidth * 0.15),
          Icon(
            icon,
            color: Theme.of(context).splashColor,
          ),
          const SizedBox(width: 20),
          Text(
            details,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
