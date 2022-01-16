import 'package:flutter/material.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/views/windows/hover_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIcons extends StatefulWidget {
  const SocialMediaIcons({Key? key}) : super(key: key);

  @override
  _SocialMediaIconsState createState() => _SocialMediaIconsState();
}

class _SocialMediaIconsState extends State<SocialMediaIcons> {
  late Widget fbPng;
  late Widget waPng;
  late Widget instaPng;
  late Widget linkedInPng;

  bool showIcons = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500)).then((value) {
      setState(() {
        showIcons = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double iconSize = 30;
    fbPng = Image.asset(fbPngAssetName, height: iconSize);
    waPng = Image.asset(whatsappPngeAssetName, height: iconSize);
    instaPng = Image.asset(instaPngImageName, height: iconSize);
    linkedInPng = Image.asset(linkedInAssetName,
        height: iconSize, color: Colors.blue[900]);
    return Container(
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 900),
        opacity: showIcons ? 1 : 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              child: Container(
                child: fbPng,
              ),
              onTap: () {
                launch(fbLink);
              },
            ).showCursorOnHover,
            SizedBox(
              width: 15,
            ),
            GestureDetector(
              child: instaPng,
              onTap: () {
                launch(instaLink);
              },
            ).showCursorOnHover,
            SizedBox(
              width: 15,
            ),
            GestureDetector(
              child: waPng,
              onTap: () {
                launch(whatsappWebLink);
              },
            ).showCursorOnHover,
            SizedBox(
              width: 15,
            ),
            GestureDetector(
              child: linkedInPng,
              onTap: () {
                launch(linkedInLink);
              },
            ).showCursorOnHover,
          ],
        ),
      ),
    );
  }
}
