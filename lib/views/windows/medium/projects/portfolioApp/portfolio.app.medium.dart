import 'package:flutter/material.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/views/windows/medium/projects/portfolioApp/portfolio.title.text.dart';
import 'package:spnk/views/windows/small/projects/app.summary/image.container.dart';

class PortfolioAppItemMedium extends StatelessWidget {
  const PortfolioAppItemMedium({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: PortfolioImageContainer(),
    );
  }
}

class PortfolioImageContainer extends StatelessWidget {
  const PortfolioImageContainer({
    Key? key,
  }) : super(key: key);

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
          child: Align(
            alignment: Alignment.bottomLeft,
            child: PortfolioTitleText(),
          ),
        ),
      ],
    );
  }
}
