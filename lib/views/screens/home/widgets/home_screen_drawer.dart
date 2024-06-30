import 'package:animate_do/animate_do.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spnk/utils/common_colors.dart';
import 'package:spnk/utils/extensions/context_extension.dart';
import 'package:spnk/utils/extensions/widget_extensions.dart';
import 'package:spnk/utils/screen_type.dart';
import 'package:spnk/views/bloc/screen_details/screen_bloc.dart';
import 'package:spnk/views/bloc/screen_details/screen_event.dart';
import 'package:spnk/views/screens/animation_item_builder.dart';
import 'package:spnk/views/screens/home/widgets/copyright_text.dart';

class HomeScreenDrawer extends StatelessWidget {
  const HomeScreenDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close,
                  color: context.primaryColor,
                ),
              ).showCursorOnHover,
              const SizedBox(width: 16),
            ],
          ),
          FadeInRightBig(
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
          const Spacer(),
          const CopyrightText(size: 15),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

class HomeListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListItem(
      title: 'Home',
      callback: () {
        Navigator.pop(context);
        context.read<ScreenBloc>().add(UpdateScreen());
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
        Navigator.pop(context);
        context.read<ScreenBloc>().add(UpdateScreen(screen: Screen.contactMe));
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
        Navigator.pop(context);
        context.read<ScreenBloc>().add(UpdateScreen(screen: Screen.experience));
      },
      icon: Icons.work,
    );
  }
}

class MyProjectsListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListItem(
      title: 'Projects',
      callback: () {
        Navigator.pop(context);
        context.read<ScreenBloc>().add(UpdateScreen(screen: Screen.projects));
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
    final normalColor = isDarkTheme ? kWhiteColor : kPrimaryBlueColor;
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
            hoverColor: kTransparentColor,
            onTap: () {
              widget.callback.call();
              setState(() {});
            },
            leading: Icon(
              widget.icon,
              color: !isHovering ? normalColor : hoverColor,
            ),
            title: Text(
              widget.title,
              style: context.displaySmall.copyWith(
                color: !isHovering ? normalColor : hoverColor,
              ),
            ),
          ).showCursorOnHover,
        ),
      ),
    );
  }
}
