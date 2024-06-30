import 'package:flutter/material.dart';
import 'package:spnk/utils/extensions/context_extension.dart';
import 'package:spnk/utils/extensions/widget_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

class DownloadCvBtn extends StatelessWidget {
  const DownloadCvBtn({
    Key? key,
  }) : super(key: key);

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
        padding: const EdgeInsets.symmetric(
          horizontal: 45,
        ),
        color: context.primaryColor,
        child: Row(
          children: [
            Text(
              "Download CV",
              style: context.displaySmall.copyWith(
                color: context.scaffoldColor,
              ),
            ),
            const SizedBox(width: 15),
            Icon(
              Icons.download,
              color: context.scaffoldColor,
            ),
          ],
        ),
      ),
    ).showCursorOnHover.addShadowOnHover;
  }
}
