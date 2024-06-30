import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spnk/utils/common_colors.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/extensions/context_extension.dart';
import 'package:spnk/views/screens/home/widgets/social.media.icon.item.dart';

class SocialMediaIconsList extends StatelessWidget {
  const SocialMediaIconsList({
    Key? key,
    this.isMobile = false,
  }) : super(key: key);
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    const double spacing = 15;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    final normalColor = isMobile
        ? kWhiteColor
        : isDarkTheme
            ? kWhiteColor
            : kPrimaryBlueColor;
    return FadeInUp(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SocialMediaIconItem(
            icon: FontAwesomeIcons.facebook,
            url: fbLink,
            iconColor: kWhiteColor,
            isMobile: isMobile,
          ),
          const SizedBox(height: spacing),
          SocialMediaIconItem(
            icon: FontAwesomeIcons.instagram,
            url: instaLink,
            iconColor: kWhiteColor,
            isMobile: isMobile,
          ),
          const SizedBox(height: spacing),
          SocialMediaIconItem(
            icon: FontAwesomeIcons.whatsapp,
            url: whatsappWebLink,
            iconColor: kWhiteColor,
            isMobile: isMobile,
          ),
          const SizedBox(height: spacing),
          SocialMediaIconItem(
            icon: FontAwesomeIcons.linkedin,
            url: linkedInLink,
            iconColor: normalColor,
            isMobile: isMobile,
          ),
          const SizedBox(height: spacing),
          SocialMediaIconItem(
            icon: FontAwesomeIcons.github,
            url: githubLink,
            iconColor: normalColor,
            isMobile: isMobile,
          ),
          const SizedBox(height: spacing),
          Container(
            width: 3,
            height: 200,
            decoration: BoxDecoration(
              color: context.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
