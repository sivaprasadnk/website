import 'package:animate_do/animate_do.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spnk/utils/common_colors.dart';
import 'package:spnk/utils/screen_type.dart';
import 'package:spnk/views/provider/menu_provider.dart';
// import 'package:provider/provider.dart';
import 'package:spnk/views/provider/route_provider.dart';
import 'package:spnk/views/windows/hover_extensions.dart';

class WindowsSmallDrawer extends StatefulWidget {
  @override
  _WindowsHomeSmallDrawerState createState() => _WindowsHomeSmallDrawerState();
}

class _WindowsHomeSmallDrawerState extends State<WindowsSmallDrawer> {
  Widget Function(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) animationItemBuilder(
    Widget Function(int index) child, {
    EdgeInsets padding = EdgeInsets.zero,
  }) =>
      (
        BuildContext context,
        int index,
        Animation<double> animation,
      ) =>
          FadeTransition(
            opacity: Tween<double>(
              begin: 0,
              end: 1,
            ).animate(animation),
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, -0.1),
                end: Offset.zero,
              ).animate(animation),
              child: Padding(
                padding: padding,
                child: child(index),
              ),
            ),
          );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeInLeftBig(
            child: Container(
              padding: const EdgeInsets.only(top: 30),
              child: Image.asset(
                'assets/images/exp_icon.png',
                height: 250,
              ),
            ),
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: 320,
            child: LiveList(
              shrinkWrap: true,
              separatorBuilder: (ctx, _) => const SizedBox(height: 10),
              padding: const EdgeInsets.all(20),
              showItemInterval: const Duration(milliseconds: 200),
              itemCount: 4,
              itemBuilder: animationItemBuilder((index) {
                switch (index) {
                  case 0:
                    return HomeListItem();
                  case 3:
                    return ContactMeListItem();
                  case 1:
                    return ExperienceListItem();
                  case 2:
                    return MyProjectsListItem();
                }
                return Container();
              }),
            ),
          ),
          // FadeInLeftBig(
          //   child: Container(
          //     padding: const EdgeInsets.only(left: 0, top: 50),
          //     child: Image.asset(
          //       'assets/images/exp_icon.png',
          //       height: 250,
          //     ),
          //     // child: Lottie.asset(
          //     //   'assets/lotties/mobile-app-process.json',
          //     //   height: 250,
          //     // ),
          //   ),
          // ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class HomeListItem extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListItem(
      title: 'Home',
      callback: () {
        ref.read(menuNotifierProvider.notifier).menuSelected = false;
        ref.read(routeNotifierProvider.notifier).selectedScreen = Screen.home;
      },
      icon: Icons.home,
    );
  }
}

class ContactMeListItem extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListItem(
      title: 'Contact Me',
      callback: () {
        ref.read(menuNotifierProvider.notifier).menuSelected = false;
        ref.read(routeNotifierProvider.notifier).selectedScreen =
            Screen.contactMe;
      },
      icon: Icons.call,
    );
  }
}

class ExperienceListItem extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListItem(
      title: 'Experience',
      callback: () {
        ref.read(menuNotifierProvider.notifier).menuSelected = false;
        ref.read(routeNotifierProvider.notifier).selectedScreen =
            Screen.experience;
      },
      icon: Icons.work,
    );
  }
}

class MyProjectsListItem extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListItem(
      title: 'Projects',
      callback: () {
        ref.read(menuNotifierProvider.notifier).menuSelected = false;
        ref.read(routeNotifierProvider.notifier).selectedScreen =
            Screen.projects;
      },
      icon: Icons.apps,
    );
  }
}

class ListItem extends StatefulWidget {
  final String title;
  final VoidCallback callback;
  final IconData icon;
  const ListItem({
    required this.title,
    required this.callback,
    required this.icon,
  });

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    const hoverColor = Colors.cyan;
    final normalColor =
        isDarkTheme ? kWhiteColor : kPrimaryBlueColor;
    return Theme(
      data: ThemeData(
        splashColor: kTransparentColor,
        highlightColor: kTransparentColor,
      ),
      child: MouseRegion(
        opaque: false,
        onEnter: (_) {
          setState(() {
            isHovering = true;
          });
        },
        onExit: (val) {
          setState(() {
            isHovering = false;
          });
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: ListTile(
            dense: true,
            // hoverColor: const Color.fromRGBO(249, 139, 125, 1),
            hoverColor: kTransparentColor,
            onTap: () {
              widget.callback.call();
              setState(() {});
            },
            leading: Icon(
              widget.icon,
              color: !isHovering ? normalColor : hoverColor,
              // color: isHovering ? Colors.cyanAccent : kWhiteColor,
            ),
            title: Text(
              widget.title,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: !isHovering ? normalColor : hoverColor,
                  ),
              // style: TextStyle(
              //   fontFamily: 'PlayfairDisplay',
              //   color: isHovering ? Colors.cyanAccent : kWhiteColor,
              //   fontWeight: FontWeight.bold,
              //   fontSize: 30,
              // ),
            ),
          ).showCursorOnHover,
        ),
      ),
    );
  }
}
