import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spnk/utils/screen_type.dart';
import 'package:spnk/views/android/menu/menu.widgets/menu.image.dart';
import 'package:spnk/views/android/menu/menu.widgets/menu.item.dart';
import 'package:spnk/views/bloc/screen_details/screen_bloc.dart';
import 'package:spnk/views/bloc/screen_details/screen_event.dart';

class AndroidMenuScreen extends StatefulWidget {
  const AndroidMenuScreen({Key? key}) : super(key: key);

  @override
  _AndroidMenuScreenState createState() => _AndroidMenuScreenState();
}

class _AndroidMenuScreenState extends State<AndroidMenuScreen>
    with SingleTickerProviderStateMixin {
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

  bool showLottie = false;
  // var rightPos;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then((value) {
      setState(() {
        showLottie = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    // final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MenuImage(showLottie: showLottie, screenWidth: screenWidth),
        const SizedBox(
          height: 25,
        ),
        LiveList(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16),
          showItemInterval: const Duration(milliseconds: 50),
          itemCount: 4,
          itemBuilder: animationItemBuilder((index) {
            switch (index) {
              case 0:
                return GestureDetector(
                  onTap: () {
                    context.read<ScreenBloc>().add(UpdateScreen());
                  },
                  child: const AndroidCustomMenuItem(
                    icon: FontAwesomeIcons.home,
                    title: 'Home',
                  ),
                );
              case 1:
                return GestureDetector(
                  onTap: () {
                    context
                        .read<ScreenBloc>()
                        .add(UpdateScreen(screen: Screen.experience));
                  },
                  child: const AndroidCustomMenuItem(
                    icon: Icons.work,
                    title: 'Experience',
                  ),
                );

              case 2:
                return GestureDetector(
                  onTap: () {
                    context
                        .read<ScreenBloc>()
                        .add(UpdateScreen(screen: Screen.projects));
                  },
                  child: const AndroidCustomMenuItem(
                    icon: Icons.apps,
                    title: 'Projects',
                  ),
                );
              case 3:
                return GestureDetector(
                  onTap: () {
                    context
                        .read<ScreenBloc>()
                        .add(UpdateScreen(screen: Screen.contactMe));
                  },
                  child: const AndroidCustomMenuItem(
                    icon: Icons.call,
                    title: 'Contact Me',
                  ),
                );
            }
            return Container();
          }),
        ),
      ],
    );
  }
}
