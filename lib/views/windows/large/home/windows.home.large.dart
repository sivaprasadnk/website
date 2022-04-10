import 'package:auto_size_text/auto_size_text.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'autos'
import 'package:spnk/provider/theme_provider.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/windows/hover_extensions.dart';
import 'package:spnk/views/windows/large/contactme/windows.large.contactme.screen.dart';
import 'package:spnk/views/windows/large/experience/windows.large.experience.screen.dart';
import 'package:spnk/views/windows/large/home/windows.home.large.screen.dart';
import 'package:spnk/views/windows/large/home/windows.large.home.widgets/copyright_text.dart';
import 'package:spnk/views/windows/large/home/windows.large.home.widgets/made_with_flutter_widget.dart';
import 'package:spnk/views/windows/large/projects/windows.large.projects.screen.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

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
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    const double size = 15;
    debugPrint('..@ screenWidth1 large: $screenWidth');
    const Duration _duration = Duration(seconds: 1);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.03,
            vertical: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              CopyrightText(size: size),
              MadeWithFlutterWidget(size: size),
            ],
          ),
        ),
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size(screenWidth, 90),
          child: Padding(
            padding: const EdgeInsets.all(16) +
                EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
            child: SizedBox(
              // width: screenWidth,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      _tabController.animateTo(
                        0,
                        duration: _duration,
                      );
                    },
                    child: nameText(context: context).showCursorOnHover,
                  ),
                  const Spacer(),
                  Consumer<ThemeNotifier>(
                    builder: (_, provider, __) {
                      return SizedBox(
                        height: 50,
                        width: 75,
                        child: GestureDetector(
                          onDoubleTap: () {},
                          child: DayNightSwitcher(
                            // nightBackgroundColor: Colors.black54,
                            // moonColor: Colors.black54,
                            isDarkModeEnabled: provider.darkTheme,
                            onStateChanged: (isDarkModeEnabled) {
                              provider.toggleTheme();
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: TabBar(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      indicator: RectangularIndicator(
                        color: const Color.fromRGBO(249, 139, 125, 1),
                        paintingStyle: PaintingStyle.stroke,
                        bottomLeftRadius: 100,
                        bottomRightRadius: 100,
                        topLeftRadius: 100,
                        topRightRadius: 100,
                      ),
                      padding: EdgeInsets.zero,
                      controller: _tabController,
                      tabs: [
                        HomeTab(
                          tabController: _tabController,
                          duration: _duration,
                        ),
                        ExperienceTab(
                          tabController: _tabController,
                          duration: _duration,
                        ),
                        ProjectsTab(
                          tabController: _tabController,
                          duration: _duration,
                        ),
                        ContactMeTab(
                          tabController: _tabController,
                          duration: _duration,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: TabBarView(
            controller: _tabController,
            children: [
              WindowsHomeLargeScreen(),
              WindowsLargeExperienceScreen(),
              WindowsLargeProjectScreen(),
              WindowsLargeContactMeScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  final TabController tabController;
  final Duration duration;
  const HomeTab({
    required this.tabController,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return TabItem(
      onTap: () {
        tabController.animateTo(0, duration: duration);
      },
      title: 'Home',
    );
  }
}

class ProjectsTab extends StatelessWidget {
  final TabController tabController;
  final Duration duration;
  const ProjectsTab({
    required this.tabController,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return TabItem(
      onTap: () {
        tabController.animateTo(2, duration: duration);
      },
      title: 'Projects',
    );
  }
}

class ContactMeTab extends StatelessWidget {
  final TabController tabController;
  final Duration duration;
  const ContactMeTab({
    required this.tabController,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return TabItem(
      onTap: () {
        tabController.animateTo(3, duration: duration);
      },
      title: 'Contact Me',
    );
  }
}

class ExperienceTab extends StatelessWidget {
  final TabController tabController;
  final Duration duration;
  const ExperienceTab({
    required this.tabController,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return TabItem(
      onTap: () {
        tabController.animateTo(
          1,
          duration: duration,
          curve: Curves.decelerate,
        );
      },
      title: 'Experience',
    );
  }
}

class TabItem extends StatelessWidget {
  const TabItem({
    required this.title,
    required this.onTap,
  });

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // highlightColor: Colors.transparent,
      // splashColor: Colors.transparent,
      onTap: () => onTap.call(),
      child: SizedBox(
        height: 40,
        width: 100,
        child: Center(
          child: AutoSizeText(
            title,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }
}
