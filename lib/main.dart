import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spnk/domain/use_case/get_about_me.dart';
import 'package:spnk/domain/use_case/get_contact_details.dart';
import 'package:spnk/domain/use_case/get_exp_details.dart';
import 'package:spnk/domain/use_case/get_project_details.dart';
import 'package:spnk/utils/locator.dart';
import 'package:spnk/utils/themes.dart';
import 'package:spnk/views/bloc/about_me/about_me_bloc.dart';
import 'package:spnk/views/bloc/about_me/about_me_event.dart';
import 'package:spnk/views/bloc/contact_details/contact_details_bloc.dart';
import 'package:spnk/views/bloc/contact_details/contact_details_event.dart';
import 'package:spnk/views/bloc/experience/exp_details_bloc.dart';
import 'package:spnk/views/bloc/experience/exp_details_event.dart';
import 'package:spnk/views/bloc/project/project_bloc.dart';
import 'package:spnk/views/bloc/project/project_event.dart';
import 'package:spnk/views/bloc/screen_details/screen_bloc.dart';
import 'package:spnk/views/bloc/theme_switch/theme_bloc.dart';
import 'package:spnk/views/bloc/theme_switch/theme_state.dart';
import 'package:spnk/views/screens/home/home_screen.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage('assets/images/mesh1.jpg'), context);
    precacheImage(const AssetImage('assets/images/dash/dash1.png'), context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<ScreenBloc>(create: (_) => ScreenBloc()),
        BlocProvider<AboutMeBloc>(
          create: (_) => AboutMeBloc(locator<GetAboutMe>())
            ..add(
              FetchAboutMe(),
            ),
        ),
        BlocProvider<ExpDetailsBloc>(
          create: (_) => ExpDetailsBloc(locator<GetExpDetails>())
            ..add(
              FetchExpDetails(),
            ),
        ),
        BlocProvider<ProjectBloc>(
          create: (_) => ProjectBloc(locator<GetProjectDetails>())
            ..add(
              FetchProjects(),
            ),
        ),
        BlocProvider<ContactDetailsBloc>(
          create: (_) => ContactDetailsBloc(locator<GetContactDetails>())
            ..add(
              FetchContactDetails(),
            ),
        ),
        BlocProvider<ThemeBloc>(create: (_) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            scrollBehavior: const MaterialScrollBehavior().copyWith(
              dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch,
                PointerDeviceKind.stylus,
                PointerDeviceKind.unknown,
              },
            ),
            title: 'Sivaprasad NK',
            debugShowCheckedModeBanner: false,
            theme: state.isDarkTheme ? darkTheme : lightTheme,
            routes: {
              '/': (context) => const SplashScreen(),
            },
          );
        },
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
   
  }
}
