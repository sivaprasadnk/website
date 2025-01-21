import 'package:flutter/material.dart';
import 'package:spnk/utils/extensions/context_extension.dart';
import 'package:spnk/views/screens/section.title.dart';

class ScreenSection extends StatefulWidget {
  const ScreenSection({
    super.key,
    required this.title,
    required this.details,
    required this.imageName,
  });
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
    // double leftPadding = context.isLargeDevice ? 150 : 20;
    // final double leftPadding = context.screenWidth * 0.1;
    final double padding =
        context.isLargeDevice ? context.screenWidth * 0.09 : 20;
    return Container(
      width: context.isMobileDevice ? double.infinity : 600,
      padding: EdgeInsets.only(left: padding, right: padding),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WindowsLargeSectionTitle(
              title: widget.title,
            ),
            widget.details,
          ],
        ),
      ),
    );
  }
}
