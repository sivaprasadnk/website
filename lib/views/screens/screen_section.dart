import 'package:flutter/material.dart';
import 'package:spnk/utils/extensions/context_extension.dart';
import 'package:spnk/views/screens/section.title.dart';

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
    double leftPadding = 150;
    leftPadding = context.screenWidth * 0.1;
    return Container(
      padding: EdgeInsets.only(left: context.isLargeDevice ? leftPadding : 30),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WindowsLargeSectionTitle(
              title: widget.title,
            ),
            SizedBox(height: context.isMobileDevice ? 50 : 75),
            widget.details,
          ],
        ),
      ),
    );
  }
}
