import 'package:flutter/material.dart';
import 'package:spnk/views/windows/large/home/windows.large.home.widgets/tab.list/tab.item.dart';

class HomeTab extends StatelessWidget {
  final TabController tabController;
  final Duration duration;
  const HomeTab({
    required this.tabController,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return TabItem(
      tabController: tabController,

      onTap: () {
        tabController.animateTo(0, duration: duration);
      },
      isSelected: tabController.index == 0,
      title: 'Home',
      index: 0,
    );
  }
}
