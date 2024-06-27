import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';
import 'package:spnk/utils/extensions/int_extension.dart';
import 'package:spnk/views/bloc/screen_details/screen_bloc.dart';
import 'package:spnk/views/bloc/screen_details/screen_event.dart';
import 'package:spnk/views/windows/common/logo_text.dart';
import 'package:spnk/views/windows/common/theme_switch.dart';
import 'package:spnk/views/windows/large/contactme/windows.large.contactme.screen.dart';
import 'package:spnk/views/windows/large/experience/windows.large.experience.screen.dart';
import 'package:spnk/views/windows/large/home/windows.home.large.screen.dart';
import 'package:spnk/views/windows/large/home/windows.large.home.widgets/copyright_text.dart';
import 'package:spnk/views/windows/large/home/windows.large.home.widgets/made_with_flutter_widget.dart';
import 'package:spnk/views/windows/large/home/windows.large.home.widgets/tab.list/contact.me.tab.dart';
import 'package:spnk/views/windows/large/home/windows.large.home.widgets/tab.list/experience.tab.dart';
import 'package:spnk/views/windows/large/home/windows.large.home.widgets/tab.list/home.tab.dart';
import 'package:spnk/views/windows/large/home/windows.large.home.widgets/tab.list/projects.tab.dart';
import 'package:spnk/views/windows/large/projects/projects_screen.dart';

class WindowsHomeLarge extends StatefulWidget {
  static const routeName = '/Home';

  @override
  _WindowsHomeLargeState createState() => _WindowsHomeLargeState();
}

class _WindowsHomeLargeState extends State<WindowsHomeLarge>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      context
          .read<ScreenBloc>()
          .add(UpdateScreen(screen: _tabController.index.screenFromIndex));
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double size = 15;
    const Duration duration = Duration(seconds: 1);
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth * 0.03,
          vertical: 10,
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CopyrightText(size: size),
            MadeWithFlutterWidget(size: size),
          ],
        ),
      ),
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(context.screenWidth * 0.9, 90),
        child: Padding(
          padding: const EdgeInsets.all(16) +
              const EdgeInsets.symmetric(horizontal: 20),
          child: AppBar(
            title: LogoText(
              onTap: () {
                _tabController.animateTo(
                  0,
                  duration: duration,
                );
              },
            ),
            actions: [
              const ThemeSwitch(),
              const SizedBox(
                width: 30,
              ),
              HomeTab(
                tabController: _tabController,
                duration: duration,
              ),
              ExperienceTab(
                tabController: _tabController,
                duration: duration,
              ),
              ProjectsTab(
                tabController: _tabController,
                duration: duration,
              ),
              ContactMeTab(
                tabController: _tabController,
                duration: duration,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.02),
        child: TabBarView(
          controller: _tabController,
          children: [
            WindowsHomeLargeScreen(),
            WindowsLargeExperienceScreen(),
            // ProjectsScreenNew(),
            WindowsLargeProjectsScreen(),
            WindowsLargeContactMeScreen(),
          ],
        ),
      ),
    );
  }
}
