import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/page.provider.dart';
import 'package:spnk/provider/route_provider.dart';
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';
import 'package:spnk/views/windows/medium/home/menu.widgets/contact.me.menu.dart';
import 'package:spnk/views/windows/medium/home/menu.widgets/experience.menu.dart';
import 'package:spnk/views/windows/medium/home/menu.widgets/family.menu.dart';
import 'package:spnk/views/windows/medium/home/menu.widgets/home.menu.dart';
import 'package:spnk/views/windows/medium/home/menu.widgets/projects.menu.dart';

class WindowsMediumMenu extends StatefulWidget {
  const WindowsMediumMenu({Key? key}) : super(key: key);

  @override
  _WindowsMediumMenuState createState() => _WindowsMediumMenuState();
}

class _WindowsMediumMenuState extends State<WindowsMediumMenu> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    final provider = context.routeProvider;
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
              provider.setScreen(name: Screen.home);
            },
            child: HomeMenu(),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              provider.setScreen(name: Screen.family);
            },
            child: FamilyMenu(),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              provider.setScreen(name: Screen.experience);
            },
            child: ExperienceMenu(),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              provider.setScreen(name: Screen.projects);
              Provider.of<PageProvider>(context, listen: false).updatePage(0);
            },
            child: MyProjectsMenu(),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              provider.setScreen(name: Screen.contactMe);
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
