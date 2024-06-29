import 'package:flutter/material.dart';
import 'package:spnk/views/screens/projects/project_list_view.dart';
import 'package:spnk/views/windows/large/common.widgets/screen_section.dart';

class ProjectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final width = context.screenWidth;
    // final double leftPadding = width < 740 ? 50 : context.screenWidth * 0.5;
    return const ScreenSection(
      title: 'My Projects',
      details: ProjectListView(),
      imageName: 'dash3',
    );
  }
}
