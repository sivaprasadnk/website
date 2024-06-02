import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spnk/views/provider/page_provider.dart';
import 'package:spnk/views/provider/route_provider.dart';
import 'package:spnk/views/windows/medium/home/menu.widgets/contact.me.menu.dart';
import 'package:spnk/views/windows/medium/home/menu.widgets/experience.menu.dart';
import 'package:spnk/views/windows/medium/home/menu.widgets/home.menu.dart';
import 'package:spnk/views/windows/medium/home/menu.widgets/projects.menu.dart';

class WindowsMediumMenu extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 250,
          ),
          GestureDetector(
            onTap: () {
              ref.read(routeNotifierProvider.notifier).selectedScreen =
                  Screen.home;
            },
            child: HomeMenu(),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              ref.read(routeNotifierProvider.notifier).selectedScreen =
                  Screen.experience;
            },
            child: ExperienceMenu(),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              ref.read(routeNotifierProvider.notifier).selectedScreen =
                  Screen.projects;

              ref.read(pageIndexProvider.notifier).pageIndex = 0;
            },
            child: MyProjectsMenu(),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              ref.read(routeNotifierProvider.notifier).selectedScreen =
                  Screen.contactMe;
            },
            child: ContactmeMenu(),
          ),
          const SizedBox(height: 20),
          // Spacer(),
        ],
      ),
    );
  }
}
