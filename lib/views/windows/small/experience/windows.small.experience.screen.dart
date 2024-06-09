import 'package:flutter/material.dart';
import 'package:spnk/views/windows/common/exp_details_list_view.dart';
import 'package:spnk/views/windows/common/exp_screen_image.dart';
import 'package:spnk/views/windows/small/windows.small.common.widgets.dart';

class WindowsSmallExperienceScreen extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: screenHeight * 0.13),
        SectionTitle(screenWidth: screenWidth, title: 'Experience'),
        SizedBox(height: screenHeight * 0.12),
        ExpDetailsListView(
          padding: EdgeInsets.only(
            left: screenWidth * 0.15,
            top: screenHeight * .05,
          ),
        ),
        const Flexible(
          child: ExpScreenImage(
            alignment: Alignment.bottomRight,
            height: 280,
          ),
        ),
      ],
    );
  }
}
