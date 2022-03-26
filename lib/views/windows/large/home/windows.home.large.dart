import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  bool homeSelected = true,
      projectHovered = false,
      contactmeSelected = false,
      experienceSelected = false;

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
    Future.delayed(Duration(milliseconds: 500)).then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    double size = 15;
    debugPrint('..@ screenWidth1 large: $screenWidth');
    debugPrint('..@ experienceSelected large: $experienceSelected');
    Duration _duration = Duration(seconds: 1);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CopyrightText(size: size),
              MadeWithFlutterWidget(size: size),
            ],
          ),
        ),
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size(screenWidth, 75),
          child: Padding(
            padding: EdgeInsets.all(18) +
                EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: SizedBox(
              width: screenWidth,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _tabController.animateTo(
                          0,
                          duration: _duration,
                        );
                      },
                      child: nameText(context: context).showCursorOnHover,
                    ),
                  ),
                  Consumer<ThemeNotifier>(
                    builder: (_, themeNotifier, __) => SizedBox(
                      // height: 50,
                      width: 50,
                      child: Switch(
                        onChanged: (val) {
                          themeNotifier.toggleTheme();
                        },
                        value: themeNotifier.darkTheme,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: TabBar(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      indicator: RectangularIndicator(
                        color: Color.fromRGBO(249, 139, 125, 1),
                        paintingStyle: PaintingStyle.stroke,
                        bottomLeftRadius: 100,
                        bottomRightRadius: 100,
                        topLeftRadius: 100,
                        topRightRadius: 100,
                      ),
                      padding: EdgeInsets.zero,
                      indicatorPadding: EdgeInsets.zero,
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
  HomeTab({
    required this.tabController,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabItem(
        onTap: () {
          tabController.animateTo(0, duration: duration);
        },
        title: 'Home',
      ),
    );
  }
}

class ProjectsTab extends StatelessWidget {
  final TabController tabController;
  final Duration duration;
  ProjectsTab({
    required this.tabController,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabItem(
        onTap: () {
          tabController.animateTo(2, duration: duration);
        },
        title: 'Projects',
      ),
    );
  }
}

class ContactMeTab extends StatelessWidget {
  final TabController tabController;
  final Duration duration;
  ContactMeTab({
    required this.tabController,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabItem(
        onTap: () {
          tabController.animateTo(3, duration: duration);
        },
        title: 'Contact Me',
      ),
    );
  }
}

class ExperienceTab extends StatelessWidget {
  final TabController tabController;
  final Duration duration;
  ExperienceTab({
    required this.tabController,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabItem(
        onTap: () {
          tabController.animateTo(1,
              duration: duration, curve: Curves.decelerate);
        },
        title: 'Experience',
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  const TabItem({
    Key? key,
    required String title,
    required VoidCallback onTap,
  })  : onTap = onTap,
        title = title,
        super(key: key);

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // highlightColor: Colors.transparent,
      // splashColor: Colors.transparent,
      onTap: () => onTap.call(),
      child: SizedBox(
        height: 50,
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }
}
