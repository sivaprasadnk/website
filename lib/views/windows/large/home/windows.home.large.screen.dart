import 'package:flutter/material.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';
import 'package:spnk/views/windows/common/dash_image.dart';
import 'package:spnk/views/windows/common/flutter_developer_container.dart';
import 'package:spnk/views/windows/common/hi_name_text.dart';
import 'package:spnk/views/windows/large/home/windows.large.home.widgets/social.media.icons/social.media.icons.list.dart';

// import 'windows.large.home.widgets/social.media.icons/social.media.icons.list.dart';

class WindowsHomeLargeScreen extends StatefulWidget {
  @override
  _WindowsHomeLargeScreenState createState() => _WindowsHomeLargeScreenState();
}

class _WindowsHomeLargeScreenState extends State<WindowsHomeLargeScreen>
    with AutomaticKeepAliveClientMixin {
  bool showName = false;
  bool showProPic = false;
  bool showLottie = false;

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      setState(() {
        showLottie = true;
      });
    }).then((value) {
      Future.delayed(const Duration(milliseconds: 500)).then((value) {
        setState(() {
          showName = true;
        });
      }).then((value) {
        Future.delayed(const Duration(seconds: 1)).then((value) {
          setState(() {
            showProPic = true;
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final screenWidth = context.screenWidth;
    final heightFactor = context.screenHeight / 804;
    return Row( 
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SocialMediaIconsList(),
        AnimatedOpacity(
          opacity: showName ? 1 : 0,
          duration: const Duration(milliseconds: 900),
          child: SizedBox(
            width: screenWidth / 1.7,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: context.screenHeight * 0.12),
                DashImage(
                  showLottie: showLottie,
                  leftPadding: screenWidth * 0.1,
                  size: 250,
                ),
                HiNameContainer(
                  showName: showName,
                  leftPadding: screenWidth * 0.15,
                  screenWidth: screenWidth,
                ),
                const SizedBox(height: 20),
                FlutterDeveloperContainer(
                  showName: showName,
                  screenWidth: screenWidth,
                  leftPadding: screenWidth * 0.15,
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: context.screenHeight * 0.2,
            ),
            Flexible(
              child: ProPicMediumWithBlob(
                height: heightFactor * 380,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
