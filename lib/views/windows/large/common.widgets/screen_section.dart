import 'package:flutter/material.dart';
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
    // final width = context.screenWidth;
    // double leftPadding = width > 710 ? width * .02 : 0;
    const double leftPadding = 150;
    return Container(
      padding: const EdgeInsets.only(left: leftPadding),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WindowsLargeSectionTitle(
              title: widget.title,
            ),
            const SizedBox(height: 50),
            widget.details,
          ],
        ),
      ),
    );
  }
}
