import 'package:flutter/material.dart';
import 'package:spnk/utils/screen_type.dart';
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
      screen: Screen.home,
      tabController: tabController,
      onTap: () {
        tabController.animateTo(0, duration: duration);
      },
      title: 'Home',
      // index: 0,
    );
  }
}
