import 'package:flutter/material.dart';
import 'package:spnk/views/windows/common/exp_details_list_view.dart';
import 'package:spnk/views/windows/small/screen_title.dart';

class WindowsSmallExperienceScreen extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ScreenTitle(title: 'Experience'),
        SizedBox(height: screenHeight * 0.05),
        ExpDetailsListView(
          padding: EdgeInsets.only(
            left: screenWidth * 0.15,
            top: screenHeight * .05,
          ),
        ),
        // const Flexible(
        //   child: ScreenImage(
        //     alignment: Alignment.bottomRight,
        //     height: 280,
        //     imagePath: 'assets/images/dash/dash2.png',
        //   ),
        // ),
      ],
    );
  }
}
