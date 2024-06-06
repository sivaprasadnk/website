import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spnk/utils/screen_type.dart';
// import 'package:provider/provider.dart';
import 'package:spnk/views/provider/route_provider.dart';
import 'package:spnk/views/windows/medium/home/menu.widgets/menu.item.dart';

class MyProjectsMenu extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final screen = Provider.of<RouteProvider>(context).selectedSCreen;

    return CustomMenuItem(
      title: 'Projects',
      isSelected: ref.read(routeNotifierProvider.notifier).selectedScreen ==
          Screen.projects,
    );
  }
}
