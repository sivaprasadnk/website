import 'package:animate_do/animate_do.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/route_provider.dart';
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
                begin: Offset(0, -0.1),
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
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FadeInLeftBig(
          child: Container(
            padding: const EdgeInsets.only(left: 0, top: 50),
            child: Image.asset(
              'assets/images/exp_icon.png',
              height: 250,
            ),
            // child: Lottie.asset(
            //   'assets/lotties/mobile-app-process.json',
            //   height: 250,
            // ),
          ),
        ),
        SizedBox(height: 25),
        Container(
          child: LiveList(
            shrinkWrap: true,
            separatorBuilder: (ctx, _) => SizedBox(height: 10),
            padding: const EdgeInsets.all(20),
            showItemInterval: const Duration(milliseconds: 200),
            showItemDuration: const Duration(milliseconds: 150),
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
        SizedBox(
          height: 20,
        )
      ],
    ));
  }
}

class HomeListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListItem(
      title: 'Home',
      callback: () {
        Provider.of<RouteProvider>(context, listen: false)
            .setMenuSelected(check: false);
        Provider.of<RouteProvider>(context, listen: false)
            .setScreen(name: 'Home');
      },
      icon: Icons.home,
    );
  }
}

class ContactMeListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListItem(
      title: 'Contact Me',
      callback: () {
        Provider.of<RouteProvider>(context, listen: false)
            .setMenuSelected(check: false);
        Provider.of<RouteProvider>(context, listen: false)
            .setScreen(name: 'ContactMe');
      },
      icon: Icons.call,
    );
  }
}

class ExperienceListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListItem(
      title: 'Experience',
      callback: () {
        Provider.of<RouteProvider>(context, listen: false)
            .setMenuSelected(check: false);
        Provider.of<RouteProvider>(context, listen: false)
            .setScreen(name: 'Experience');
      },
      icon: Icons.work,
    );
  }
}

class MyProjectsListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListItem(
      title: 'My Projects',
      callback: () {
        Provider.of<RouteProvider>(context, listen: false)
            .setMenuSelected(check: false);
        Provider.of<RouteProvider>(context, listen: false)
            .setScreen(name: 'MyProjects');
      },
      icon: Icons.apps,
    );
  }
}

class ListItem extends StatefulWidget {
  final String title;
  final VoidCallback callback;
  final IconData icon;
  ListItem({
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
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: MouseRegion(
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
          padding: EdgeInsets.only(left: 50),
          child: ListTile(
            hoverColor: Colors.transparent,
            onTap: () {
              widget.callback.call();
              setState(() {});
            },
            leading: Icon(
              widget.icon,
              color: isHovering ? Colors.cyanAccent : Colors.white,
            ),
            title: Text(
              widget.title,
              style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                color: isHovering ? Colors.cyanAccent : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ).showCursorOnHover,
        ),
      ),
    );
  }
}
