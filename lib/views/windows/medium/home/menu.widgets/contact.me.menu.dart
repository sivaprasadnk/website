import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spnk/utils/screen_type.dart';
import 'package:spnk/views/windows/medium/home/menu.widgets/menu.item.dart';

class ContactmeMenu extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return const CustomMenuItem(
      title: 'Contact Me',
      screen: Screen.contactMe,
    );
  }
}
