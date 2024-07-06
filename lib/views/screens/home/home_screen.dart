import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spnk/utils/extensions/context_extension.dart';
import 'package:spnk/utils/extensions/int_extension.dart';
import 'package:spnk/utils/screen_type.dart';
import 'package:spnk/views/bloc/screen_details/screen_bloc.dart';
import 'package:spnk/views/bloc/screen_details/screen_event.dart';
import 'package:spnk/views/bloc/screen_details/screen_state.dart';
import 'package:spnk/views/screens/about_me/about_me_screen.dart';
import 'package:spnk/views/screens/contact_me/contact_me_screen.dart';
import 'package:spnk/views/screens/experience/experience_screen.dart';
import 'package:spnk/views/screens/home/home_screen_large.dart';
import 'package:spnk/views/screens/home/home_screen_small.dart';
import 'package:spnk/views/screens/home/widgets/bottom_navbar.dart';
import 'package:spnk/views/screens/home/widgets/home_screen_drawer.dart';
import 'package:spnk/views/screens/home/widgets/logo_text.dart';
import 'package:spnk/views/screens/home/widgets/menu_icon.dart';
import 'package:spnk/views/screens/home/widgets/tab_item.dart';
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
    _tabController = TabController(length: Screen.values.length, vsync: this);
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

  Offset _mousePosition = Offset.zero;

  @override
  Widget build(BuildContext context) {
    const Duration duration = Duration(seconds: 1);
    List<Widget> menuList = [
      const ThemeSwitch(),
    ];
    final List<Widget> screenList = Screen.values.map((screen) {
      return TabItem(
        title: screen.menuName,
        tabController: _tabController,
        screen: screen,
      );
    }).toList();

    final List tabsList = [
      const SizedBox(
        width: 30,
      ),
      ...screenList,
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
    return MouseRegion(
      onHover: (PointerHoverEvent event) {
        setState(() {
          _mousePosition = event.position;
        });
      },
      child: Stack(
        children: [
          Scaffold(
            bottomNavigationBar: const BottomNavbar(),
            extendBodyBehindAppBar: true,
            extendBody: true,
            endDrawer: const HomeScreenDrawer(),
            appBar: PreferredSize(
              preferredSize: Size(context.screenWidth * 0.8, 65),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                        case Screen.aboutMe:
                          return const AboutMeScreen();
                      }
                    },
                  )
                : Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.screenWidth * 0.02,
                        ),
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            HomeScreenLarge(),
                            const AboutMeScreen(),
                            ExperienceScreen(),
                            ProjectsScreen(),
                            ContactMeScreen(),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
          if (context.isLargeDevice)
            Positioned(
              left: _mousePosition.dx - 35,
              top: _mousePosition.dy - 35,
              child: IgnorePointer(
                child: AnimatedContainer(
                  duration: const Duration(
                    seconds: 1,
                  ),
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: context.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
