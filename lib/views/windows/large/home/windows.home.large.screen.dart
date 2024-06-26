import 'package:flutter/material.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';
import 'package:spnk/views/windows/common/download_cv_btn.dart';
import 'package:spnk/views/windows/common/intro_text.dart';

// import 'windows.large.home.widgets/social.media.icons/social.media.icons.list.dart';

class WindowsHomeLargeScreen extends StatefulWidget {
  @override
  _WindowsHomeLargeScreenState createState() => _WindowsHomeLargeScreenState();
}

class _WindowsHomeLargeScreenState extends State<WindowsHomeLargeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final screenWidth = context.screenWidth;
    debugPrint("@@ with :$screenWidth");
    // final heightFactor = context.screenHeight / 804;
    final leftPadding = screenWidth * .1;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: [
        // const SocialMediaIconsList(),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntroText(
              topPadding: 0,
              leftPadding: leftPadding,
              imageHeight: 250,
              imageWidth: screenWidth * .4,
            ),
            DownloadCvBtn(
              leftPadding: leftPadding,
              topPadding: 30,
            ),
          ],
        ),
        ProPicMediumWithBlob(
          width: screenWidth * 0.28,
        ),
      ],
    );
  }
}
