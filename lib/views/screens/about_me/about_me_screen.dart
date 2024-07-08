import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spnk/utils/extensions/context_extension.dart';
import 'package:spnk/views/bloc/about_me/about_me_bloc.dart';
import 'package:spnk/views/bloc/about_me/about_me_state.dart';
import 'package:spnk/views/screens/screen_section.dart';

class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenSection(
      title: 'About Me',
      details: BlocBuilder<AboutMeBloc, AboutMeState>(
        builder: (context, state) {
          return SizedBox(
            width: context.isMobileDevice ? context.screenWidth - 20 : 600,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 20,
              ),
              child: Text(
                state.content,
                textAlign: TextAlign.justify,
                style: context.displaySmall,
              ),
            ),
          );
        },
      ),
      imageName: '',
    );
  }
}
