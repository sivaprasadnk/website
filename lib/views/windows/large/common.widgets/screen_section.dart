import 'package:flutter/material.dart';
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';
import 'package:spnk/views/windows/common/screen_image.dart';
import 'package:spnk/views/windows/large/common.widgets/section.title.dart';

class ScreenSection extends StatefulWidget {
  const ScreenSection({
    Key? key,
    required this.title,
    required this.details,
    required this.imageName,
  }) : super(key: key);
  final String title;
  final Widget details;
  final String imageName;

  @override
  State<ScreenSection> createState() => _ScreenSectionState();
}

class _ScreenSectionState extends State<ScreenSection>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final width = context.screenWidth;
    final double leftPadding = width > 710 ? width * .02 : 0;

    // debugPrint(' @@@ width');
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: leftPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.screenHeight * 0.2),
              WindowsLargeSectionTitle(
                title: widget.title,
                // leftPadding: 0,
              ),
              widget.details,
            ],
          ),
        ),
        if (context.screenWidth > 742)
          Positioned.fill(
            top: 100,
            left: context.screenWidth * 0.1,
            child: ScreenImage(
              alignment: Alignment.centerLeft,
              height: 350,
              width: context.screenWidth * 0.4,
              imagePath: 'assets/images/dash/${widget.imageName}.png',
            ),
          ),
      ],
    );
  }
}
