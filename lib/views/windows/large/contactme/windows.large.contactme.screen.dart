import 'package:flutter/material.dart';
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';
import 'package:spnk/views/windows/common/contact_details_list_view.dart';
import 'package:spnk/views/windows/common/contact_screen_image.dart';
import 'package:spnk/views/windows/large/common.widgets/section.title.dart';

class WindowsLargeContactMeScreen extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {

    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;

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
              ContactDetailsListView(
                padding: EdgeInsets.only(
                  left: context.screenWidth * 0.5,
                  top: context.screenHeight * .15,
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          top: 100,
          left: screenWidth * 0.0,
          child: const ContactScreenImage(
            alignment: Alignment.centerLeft,
            height: 350,
          ),
        ),
      ],
    );
  }
}
