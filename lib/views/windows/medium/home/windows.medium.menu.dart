import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spnk/utils/screen_type.dart';
import 'package:spnk/views/bloc/screen_details/screen_bloc.dart';
import 'package:spnk/views/bloc/screen_details/screen_event.dart';
import 'package:spnk/views/windows/medium/home/menu.widgets/contact.me.menu.dart';
import 'package:spnk/views/windows/medium/home/menu.widgets/experience.menu.dart';
import 'package:spnk/views/windows/medium/home/menu.widgets/home.menu.dart';
import 'package:spnk/views/windows/medium/home/menu.widgets/projects.menu.dart';

class WindowsMediumMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 250,
          ),
          GestureDetector(
            onTap: () {
              context.read<ScreenBloc>().add(UpdateScreen());
            },
            child: HomeMenu(),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              context
                  .read<ScreenBloc>()
                  .add(UpdateScreen(screen: Screen.experience));
            },
            child: ExperienceMenu(),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              context
                  .read<ScreenBloc>()
                  .add(UpdateScreen(screen: Screen.projects));
            },
            child: MyProjectsMenu(),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              
              context
                  .read<ScreenBloc>()
                  .add(UpdateScreen(screen: Screen.contactMe));
            },
            child: ContactmeMenu(),
          ),
          const SizedBox(height: 20),
          // Spacer(),
        ],
      ),
    );
  }
}
