import 'package:flutter/material.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/views/windows/large/projects/details.container.dart';
import 'package:spnk/views/windows/large/projects/image.container.dart';

class WebSiteAppItem extends StatelessWidget {
  const WebSiteAppItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    return SizedBox(
      height: screenHeight * 0.5,
      child: Row(
        children: const [
          WebsiteImageContainer(),
          WebsiteDetailsContainer(),
        ],
      ),
    );
  }
}

class WebsiteImageContainer extends StatelessWidget {
  const WebsiteImageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      imagePath: websiteImageAssetPath,
      imageFit: BoxFit.fitWidth,
      isWeb: true,
    );
  }
}

class WebsiteDetailsContainer extends StatelessWidget {
  const WebsiteDetailsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DetailsContainer(
      desc1: websiteStr1Large,
      tools2: '',
      desc2: websiteStr2Large,
      link: websiteLink,
      isWeb: true,
      title: 'Portfolio website',
    );
  }
}
