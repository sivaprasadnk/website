import 'package:flutter/material.dart';
import 'package:spnk/utils/extensions/context_extension.dart';
import 'package:spnk/views/windows/common/exp_details_list_view.dart';
import 'package:spnk/views/windows/large/common.widgets/screen_section.dart';

class WindowsLargeExperienceScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final double leftPadding =
        context.screenWidth < 740
        ? context.screenWidth * .35
        : context.screenWidth * 0.5;
    return ScreenSection(
      title: 'Experience',
      details: ExpDetailsListView(
        padding: EdgeInsets.only(
          left: leftPadding,
          top: context.screenHeight * .05,
        ),
      ),
      imageName: 'dash2',
    );
  }
}
