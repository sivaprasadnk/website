import 'package:flutter/material.dart';
import 'package:spnk/views/screens/experience/exp_details_list_view.dart';
import 'package:spnk/views/screens/screen_section.dart';

class ExperienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const ScreenSection(
      title: 'Experience',
      details: ExpDetailsListView(),
      imageName: 'dash2',
    );
  }
}
