import 'package:flutter/material.dart';
import 'package:spnk/utils/screen_type.dart';
import 'package:spnk/views/windows/large/home/windows.large.home.widgets/tab.list/tab.item.dart';

class FamilyTab extends StatelessWidget {
  final TabController tabController;
  final Duration duration;
  const FamilyTab({
    required this.tabController,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return TabItem(
      screen: Screen.experience,
      tabController: tabController,
      onTap: () {
        tabController.animateTo(1, duration: duration);
      },
      title: 'Family',
      // index: 1,
    );
  }
}
