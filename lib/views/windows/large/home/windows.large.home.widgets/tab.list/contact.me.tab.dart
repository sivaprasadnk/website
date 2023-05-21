import 'package:flutter/material.dart';
import 'package:spnk/views/windows/large/home/windows.large.home.widgets/tab.list/tab.item.dart';

class ContactMeTab extends StatelessWidget {
  final TabController tabController;
  final Duration duration;
  const ContactMeTab({
    required this.tabController,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return TabItem(
      onTap: () {
        tabController.animateTo(4, duration: duration);
      },
      isSelected: tabController.index == 4,
      title: 'Contact Me',
      tabController: tabController,
      index: 4,
    );
  }
}
