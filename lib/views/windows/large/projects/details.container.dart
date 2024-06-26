import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spnk/utils/common_colors.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/windows/hover_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsContainer extends StatelessWidget {
  const DetailsContainer({
    Key? key,
    required this.desc1,
    required this.desc2,
    required this.link,
    required this.title,
    required this.tools1,
    required this.tools2,
    required this.isWeb,
  }) : super(key: key);
  final String desc1;
  final String desc2;
  final String tools1;
  final String tools2;
  final String link;
  final String title;
  final bool isWeb;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Container(
      // width: screenWidt,
      width: 280,
      // padding: const EdgeInsets.only(right: 30),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        color: Color.fromARGB(255, 9, 71, 122),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 20),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                color: kWhiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.blue,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 3,
                      ),
                      child: Text(
                        tools1,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
                if (tools2.trim().isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.yellow,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 3,
                        ),
                        child: Text(
                          tools2,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
            child: Text(
              desc1,
              style: TextStyle(
                color: kWhiteColor,
                fontSize: 15,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              desc2,
              style: TextStyle(
                color: kWhiteColor,
                fontSize: 15,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10,
              top: 10,
              right: !isWeb ? 20 : 0,
            ),
            child: !isWeb
                ? WinddowsGooglePlayButton(
                    screenWidth: screenWidth * 0.4,
                    url: link,
                  ).showCursorOnHover
                : const VisitLinkContainer(),
          ),
        ],
      ),
    );
  }
}

class VisitLinkContainer extends StatelessWidget {
  const VisitLinkContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrl(Uri.parse(websiteLink));
        // launch(websiteLink);
      },
      child: Container(
        // height: 50,
        margin: const EdgeInsets.only(left: 5, top: 10, right: 20),
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: kGreyColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                FontAwesomeIcons.externalLinkAlt,
                color: kWhiteColor,
              ),
              const SizedBox(
                width: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1, left: 5),
                child: Text(
                  'Click here to visit',
                  style: TextStyle(
                    color: kWhiteColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
      ).showCursorOnHover,
    );
  }
}
