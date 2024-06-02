import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:provider/provider.dart';
import 'package:spnk/views/provider/route_provider.dart';
import 'package:spnk/views/windows/medium/home/menu.widgets/menu.item.dart';

class ContactmeMenu extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final screen = Provider.of<RouteProvider>(context).selectedSCreen;

    return CustomMenuItem(
      title: 'Contact Me',
      isSelected: ref.watch(routeNotifierProvider) == Screen.contactMe,
    );
  }
}
