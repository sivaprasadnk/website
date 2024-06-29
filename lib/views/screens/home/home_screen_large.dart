import 'package:flutter/material.dart';
import 'package:spnk/utils/extensions/context_extension.dart';
import 'package:spnk/utils/int_constants.dart';
import 'package:spnk/views/screens/home/widgets/download_cv_btn.dart';
import 'package:spnk/views/screens/home/widgets/intro_text.dart';
import 'package:spnk/views/screens/home/widgets/profile_pic.dart';

class HomeScreenLarge extends StatefulWidget {
  @override
  _HomeScreenLargeState createState() => _HomeScreenLargeState();
}

class _HomeScreenLargeState extends State<HomeScreenLarge>
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
    final leftPadding = screenWidth * .1;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: [
        // const SocialMediaIconsList(),
        Padding(
          padding: EdgeInsets.only(left: leftPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntroText(
                topPadding: 0,
                leftPadding: 0,
                imageHeight: 250,
                imageWidth: screenWidth * .4,
              ),
              const SizedBox(height: 30),
              const DownloadCvBtn(),
            ],
          ),
        ),
        if (context.screenWidth > mobileBreakPoint)
          ProfilePic(
            width: screenWidth * 0.28,
          ),
      ],
    );
  }
}
