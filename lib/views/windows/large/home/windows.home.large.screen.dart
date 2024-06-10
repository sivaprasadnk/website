import 'package:flutter/material.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';
import 'package:spnk/views/windows/common/intro_text.dart';
import 'package:spnk/views/windows/large/home/windows.large.home.widgets/social.media.icons/social.media.icons.list.dart';

// import 'windows.large.home.widgets/social.media.icons/social.media.icons.list.dart';

class WindowsHomeLargeScreen extends StatefulWidget {
  @override
  _WindowsHomeLargeScreenState createState() => _WindowsHomeLargeScreenState();
}

class _WindowsHomeLargeScreenState extends State<WindowsHomeLargeScreen>
    with AutomaticKeepAliveClientMixin {
  bool showName = false;
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
        SizedBox(
          width: screenWidth / 1.7,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntroText(
                topPadding: context.screenHeight * 0.12,
                leftPadding: screenWidth * 0.15,
                splitText: false,
                imageHeight: 250,

              ),
            ],
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
