import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/theme_provider.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';
import 'package:spnk/views/windows/hover_extensions.dart';
import 'package:spnk/views/windows/large/contactme/windows.large.contactme.screen.dart';
import 'package:spnk/views/windows/large/experience/windows.large.experience.screen.dart';
import 'package:spnk/views/windows/large/home/windows.home.large.screen.dart';
import 'package:spnk/views/windows/large/home/windows.large.home.widgets/copyright_text.dart';
import 'package:spnk/views/windows/large/home/windows.large.home.widgets/made_with_flutter_widget.dart';
import 'package:spnk/views/windows/large/home/windows.large.home.widgets/tab.list/contact.me.tab.dart';
import 'package:spnk/views/windows/large/home/windows.large.home.widgets/tab.list/experience.tab.dart';
import 'package:spnk/views/windows/large/home/windows.large.home.widgets/tab.list/family.tab.dart';
import 'package:spnk/views/windows/large/home/windows.large.home.widgets/tab.list/home.tab.dart';
import 'package:spnk/views/windows/large/home/windows.large.home.widgets/tab.list/projects.tab.dart';
import 'package:spnk/views/windows/large/projects/projects.screen.new.dart';
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
    _tabController = TabController(length: 5, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final status = context.dialogProvider.dialogIsOpen;

      if (status) {
        context.dialogProvider.updateDialogOpenStatus(status: false);
        context.pop();
      }
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
    const Duration _duration = Duration(seconds: 1);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
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
            child: SizedBox(
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TabBar(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        indicator: RectangularIndicator(
                          color: Colors.cyan,
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
                          FamilyTab(
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
                  ),
                ],
              ),
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
              const ProjectsScreenNew(),
              WindowsLargeContactMeScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
