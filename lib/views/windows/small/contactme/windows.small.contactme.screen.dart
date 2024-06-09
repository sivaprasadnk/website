import 'package:flutter/material.dart';
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';
import 'package:spnk/views/windows/common/contact_details_list_view.dart';
import 'package:spnk/views/windows/common/screen_image.dart';
import 'package:spnk/views/windows/small/windows.small.common.widgets.dart';

class WindowsSmallContactMeScreen extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    final screenHeight = context.screenHeight;
    final screenWidth = context.screenWidth;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: screenHeight * 0.13),
        SectionTitle(screenWidth: screenWidth, title: 'Contact Me'),
        SizedBox(height: screenHeight * 0.13),
        ContactDetailsListView(
          padding: EdgeInsets.only(
            left: screenWidth * 0.15,
          ),
        ),
        const SizedBox(height: 50),
        const Flexible(
          child: ScreenImage(
            alignment: Alignment.center,
            height: 250,
            imagePath: 'assets/images/dash/dash4.png',
          ),
        ),
      ],
    );
  }
}
