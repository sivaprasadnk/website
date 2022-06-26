import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spnk/views/windows/hover_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIconItem extends StatefulWidget {
  const SocialMediaIconItem({
    Key? key,
    required this.icon,
    required this.url,
    required this.iconColor,
    required this.isMobile,
  }) : super(key: key);

  final IconData icon;
  final String url;
  final Color iconColor;
  final bool isMobile;

  @override
  State<SocialMediaIconItem> createState() => _SocialMediaIconItemState();
}

class _SocialMediaIconItemState extends State<SocialMediaIconItem> {
  ///
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onHover: (val) {
        setState(() {
          isHovering = val;
        });
      },
      child: FaIcon(
        widget.icon,
        color: widget.isMobile
            ? Colors.white
            : isHovering
                ? Colors.cyan
                : isDarkTheme
                    ? Colors.white
                    : const Color.fromRGBO(0, 34, 120, 1),
        size: 30,
      ),
      onTap: () {
        launch(widget.url);
      },
    ).showCursorOnHover;
  }
}
