import 'package:flutter/material.dart';
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';
import 'package:spnk/views/windows/common/project_list_view.dart';
import 'package:spnk/views/windows/large/common.widgets/screen_section.dart';

class WindowsLargeProjectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = context.screenWidth;
    final double leftPadding =
        width < 740 ? width * .35 : context.screenWidth * 0.5;
    return ScreenSection(
      title: 'My Projects',
      details: ProjectListView(
        padding: EdgeInsets.only(
          left: leftPadding,
          top: context.screenHeight * .15,
        ),
      ),
      imageName: 'dash3',
    );
  }
}
