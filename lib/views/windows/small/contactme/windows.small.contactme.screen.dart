import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/windows/small/windows.small.common.widgets.dart';

class WindowsSmallContactMeScreen extends StatefulWidget {
  @override
  State<WindowsSmallContactMeScreen> createState() =>
      _WindowsSmallContactMeScreenState();
}

class _WindowsSmallContactMeScreenState
    extends State<WindowsSmallContactMeScreen> {
  var _formKey = GlobalKey<FormState>();

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
    Future.delayed(Duration(seconds: 1)).then((value) {
      setState(() {
        showLottie = true;
        showIcons = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
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
                details: addressText),
            SizedBox(height: screenHeight * 0.03),
            ContactDetailsItem(
                screenWidth: screenWidth,
                icon: Icons.call,
                details: mobileNumberText),
            SizedBox(height: screenHeight * 0.03),
            ContactDetailsItem(
              screenWidth: screenWidth,
              icon: Icons.email,
              details: emailText,
            ),
            SizedBox(height: screenHeight * 0.03),

            WindowsSmallSocialMediaIcons(
              showIcons: showIcons,
              screenWidth: screenWidth,
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.22, top: 80),
              child: AnimatedOpacity(
                duration: Duration(seconds: 2),
                opacity: showLottie ? 1 : 0,
                child: Lottie.asset(
                  // 'assets/lotties/astronaut-laptop.json',
                  // 'assets/lotties/online-work.json',
                  // 'assets/lotties/dev5.json',
                  'assets/lotties/contact1.json',
                  // 'assets/lotties/dev1.json',
                  height: 200,
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
          SizedBox(width: screenWidth * 0.22),
          Icon(
            icon,
            color: Colors.white,
          ),
          SizedBox(width: 20),
          Text(
            details,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
