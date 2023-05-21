import 'package:flutter/material.dart';
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
      tabController: tabController,
      onTap: () {
        tabController.animateTo(1, duration: duration);
      },
      isSelected: tabController.index == 1,
      title: 'Family',
      index: 1,
    );
  }
}
