import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spnk/utils/extensions/context_extension.dart';
import 'package:spnk/utils/screen_type.dart';
import 'package:spnk/views/bloc/screen_details/screen_bloc.dart';
import 'package:spnk/views/bloc/screen_details/screen_state.dart';
import 'package:spnk/views/screens/home/widgets/copyright_text.dart';
import 'package:spnk/views/screens/home/widgets/made_with_flutter_widget.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScreenBloc, ScreenState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          child: state.selectedScreen == Screen.home
              ? context.isMobileDevice
                  ? const MadeWithFlutterWidget(
                      size: 15,
                      mainAxisAlignment: MainAxisAlignment.center,
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.screenWidth * 0.03,
                        vertical: 5,
                      ),
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CopyrightText(size: 15),
                          MadeWithFlutterWidget(
                            size: 15,
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                        ],
                      ),
                    )
              : const SizedBox.shrink(),
        );
      },
    );
  }
}
