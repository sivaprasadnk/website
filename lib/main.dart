import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';
import 'package:spnk/views/android/home/android.home.dart';
import 'package:spnk/views/bloc/project/project_bloc.dart';
import 'package:spnk/views/min_size_container.dart';
import 'package:spnk/views/windows/large/home/windows.home.large.dart';
import 'package:spnk/views/windows/medium/home/windows.medium.home.dart';
import 'package:spnk/views/windows/small/home/windows.small.home.dart';

// lottie https://assets1.lottiefiles.com/packages/lf20_j1uvfzu5.json
// https://assets8.lottiefiles.com/packages/lf20_zGHcl0.json

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage('assets/images/mesh1.jpg'), context);
    precacheImage(const AssetImage('assets/images/dash/dash1.png'), context);
    return BlocProvider(
      create: (context) => ProjectBloc(),
      child: MaterialApp(
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
        // theme: isDarktheme ? darkTheme : lightTheme,
      routes: {
        '/': (context) => const SplashScreen(),
      },
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return defaultTargetPlatform == TargetPlatform.android ||
            defaultTargetPlatform == TargetPlatform.iOS
        ? const AndroidHome()
        : context.screenWidth > 1121
            ? MinSize(
                minHeight: 734,
                child: WindowsHomeLarge(),
              )
            : context.screenWidth > 695
                ? MinSize(
                    minHeight: 734,
                    child: WindowsMediumHome(),
                  )
                : MinSize(
                    minHeight: 734,
                    child: WindowsSmallHome(),
                  );
  }
}
