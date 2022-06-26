import 'package:flutter/material.dart';
import 'package:spnk/views/windows/large/home/windows.large.home.widgets/tab.list/tab.item.dart';

class ProjectsTab extends StatelessWidget {
  final TabController tabController;
  final Duration duration;
  const ProjectsTab({
    required this.tabController,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return TabItem(
      onTap: () {
        tabController.animateTo(2, duration: duration);
      },
      tabController: tabController,

      isSelected: tabController.index == 2,
      title: 'Projects',
      index: 2,
    );
  }
}
