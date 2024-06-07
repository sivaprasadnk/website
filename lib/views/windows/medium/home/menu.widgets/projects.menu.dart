import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spnk/utils/screen_type.dart';
import 'package:spnk/views/windows/medium/home/menu.widgets/menu.item.dart';

class MyProjectsMenu extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final screen = Provider.of<RouteProvider>(context).selectedSCreen;

    return const CustomMenuItem(
      title: 'Projects',
      screen: Screen.projects,
    );
  }
}
