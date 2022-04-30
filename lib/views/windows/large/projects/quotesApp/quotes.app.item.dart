import 'package:flutter/material.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/views/windows/large/projects/details.container.dart';
import 'package:spnk/views/windows/large/projects/image.container.dart';

class QuotesAppItem extends StatelessWidget {
  const QuotesAppItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    return SizedBox(
      height: screenHeight * 0.5,
      child: Row(
        children: const [
          QuotesAppImageContainer(),
          QuotesAppDetailsContainer(),
        ],
      ),
    );
  }
}

class QuotesAppImageContainer extends StatelessWidget {
  const QuotesAppImageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageContainer(imagePath: quotesAppImageAssetPath);
  }
}

class QuotesAppDetailsContainer extends StatelessWidget {
  const QuotesAppDetailsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DetailsContainer(
      desc1: quotesAppStr1Large,
      desc2: quotesAppStr2Large,
      tools2: 'Public api',
      link: spQuotesLink,
      title: 'SP Quotes App',
      isWeb: false,
    );
  }
}
