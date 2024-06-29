import 'package:flutter/material.dart';
import 'package:spnk/views/screens/projects/project_list_view.dart';
import 'package:spnk/views/screens/screen_section.dart';

class ProjectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const ScreenSection(
      title: 'My Projects',
      details: ProjectListView(),
      imageName: 'dash3',
    );
  }
}
