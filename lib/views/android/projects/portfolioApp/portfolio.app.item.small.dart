import 'package:flutter/material.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/views/android/projects/portfolioApp/portfolio.title.text.dart';
import 'package:spnk/views/windows/small/projects/app.summary/image.container.dart';

class PortfolioAppItemMobile extends StatelessWidget {
  const PortfolioAppItemMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    return SizedBox(
      height: screenHeight * 0.5,
      child: const PortfolioImageContainerMobile(),
    );
  }
}

class PortfolioImageContainerMobile extends StatelessWidget {
  const PortfolioImageContainerMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageContainerSmall(
          imagePath: websiteImageAssetPath,
          isWeb: true,
        ),
        const Positioned.fill(
          left: 20,
          bottom: -2,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: PortfolioTitleTextMobile(),
          ),
        ),
      ],
    );
  }
}
