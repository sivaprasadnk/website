import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/windows/large/home/windows.large.home.widgets/social.media.icons/social.media.icons.list.dart';

class AndroidHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: 10,
                top: 20,
                left: screenWidth * 0.8,
              ),
              child: IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () {
                  // ref.read(menuNotifierProvider.notifier).menuSelected = true;
                },
              ),
            ),
            SizedBox(height: screenHeight * 0.23),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.1),
              child: FadeInDown(
                child: SizedBox(
                  width: screenWidth * 0.7,
                  child: FittedBox(
                    child: Text(
                      "Hi , \nI 'm Sivaprasad NK .",
                      style: TextStyle(
                        fontFamily: kFontFamily2,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.1, top: 15),
              child: FadeInLeft(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const FlutterLogo(
                          size: 30,
                        ),
                        Text(
                          ' Flutter Developer from',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: kFontFamily2,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      ' Tripunithura, Kerala .',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: kFontFamily2,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.1),
                child: Row(
                  children: [
                    const SocialMediaIconsList(
                      isMobile: true,
                    ),
                    SizedBox(
                      width: screenWidth * 0.1,
                    ),
                    ProPicMediumWithBlob(
                      height: screenHeight * 0.3,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
          ],
        ),
      ],
    );
  }
}
