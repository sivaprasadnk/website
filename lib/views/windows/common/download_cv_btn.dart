import 'package:flutter/material.dart';
import 'package:spnk/views/windows/hover_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

class DownloadCvBtn extends StatelessWidget {
  const DownloadCvBtn({
    Key? key,
    required this.leftPadding,
    required this.topPadding,
  }) : super(key: key);
  final double leftPadding;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await launchUrl(
          Uri.parse('https://sivaprasadnk.dev/resume.pdf'),
        );
      },
      child: Container(
        height: 50,
        width: 200,
        margin: EdgeInsets.only(
          left: leftPadding,
          top: topPadding,
        ),
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Text(
            "Download CV",
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
          ),
        ),
      ),
    ).showCursorOnHover;
  }
}
