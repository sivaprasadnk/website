import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spnk/utils/screen_type.dart';
import 'package:spnk/views/provider/route_provider.dart';
import 'package:spnk/views/windows/medium/home/menu.widgets/menu.item.dart';

class ExperienceMenu extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final screen = context.routeProvider.selectedSCreen;

    return CustomMenuItem(
      title: 'Experience',
      isSelected: ref.watch(routeNotifierProvider) == Screen.experience,
    );
  }
}
