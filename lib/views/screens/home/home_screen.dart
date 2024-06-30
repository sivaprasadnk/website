import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spnk/utils/extensions/context_extension.dart';
import 'package:spnk/utils/extensions/int_extension.dart';
import 'package:spnk/utils/screen_type.dart';
import 'package:spnk/views/bloc/screen_details/screen_bloc.dart';
import 'package:spnk/views/bloc/screen_details/screen_event.dart';
import 'package:spnk/views/bloc/screen_details/screen_state.dart';
import 'package:spnk/views/screens/contact_me/contact_me_screen.dart';
import 'package:spnk/views/screens/experience/experience_screen.dart';
import 'package:spnk/views/screens/home/home_screen_large.dart';
import 'package:spnk/views/screens/home/home_screen_small.dart';
import 'package:spnk/views/screens/home/widgets/bottom_navbar.dart';
import 'package:spnk/views/screens/home/widgets/home_screen_drawer.dart';
import 'package:spnk/views/screens/home/widgets/logo_text.dart';
import 'package:spnk/views/screens/home/widgets/menu_icon.dart';
import 'package:spnk/views/screens/home/widgets/tab.list/contact.me.tab.dart';
import 'package:spnk/views/screens/home/widgets/tab.list/experience.tab.dart';
import 'package:spnk/views/screens/home/widgets/tab.list/home.tab.dart';
import 'package:spnk/views/screens/home/widgets/tab.list/projects.tab.dart';
import 'package:spnk/views/screens/home/widgets/theme_switch.dart';
import 'package:spnk/views/screens/projects/projects_screen.dart';

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
    const Duration duration = Duration(seconds: 1);
    List<Widget> menuList = [
      const ThemeSwitch(),
    ];

    final List tabsList = [
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
    ];
    if (context.isLargeDevice) {
      menuList = [
        ...menuList,
        ...tabsList,
      ];
    } else {
      menuList = [
        ...menuList,
        ...[
          const MenuIcon(),
        ],
      ];
    }
    return Scaffold(
      bottomNavigationBar: const BottomNavbar(),
      extendBodyBehindAppBar: true,
      extendBody: true,
      endDrawer: const HomeScreenDrawer(),
      appBar: PreferredSize(
        preferredSize: Size(context.screenWidth * 0.9, 90),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: AppBar(
            title: LogoText(
              onTap: () {
                if (context.isLargeDevice) {
                  _tabController.animateTo(
                    0,
                    duration: duration,
                  );
                } else {
                  context.read<ScreenBloc>().add(UpdateScreen());
                }
              },
            ),
            actions: menuList,
          ),
        ),
      ),
      body: context.isMobileDevice
          ? BlocBuilder<ScreenBloc, ScreenState>(
              builder: (context, state) {
                switch (state.selectedScreen) {
                  case Screen.home:
                    return const HomeScreenSmall();
                  case Screen.contactMe:
                    return ContactMeScreen();
                  case Screen.projects:
                    return ProjectsScreen();
                  case Screen.experience:
                    return ExperienceScreen();
                  case Screen.menu:
                    return const SizedBox.shrink();
                }
              },
            )
          : Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: context.screenWidth * 0.02),
              child: TabBarView(
                controller: _tabController,
                children: [
                  HomeScreenLarge(),
                  ExperienceScreen(),
                  ProjectsScreen(),
                  ContactMeScreen(),
                ],
              ),
            ),
    );
  }
}
