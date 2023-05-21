import 'package:flutter/material.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/views/windows/small/projects/app.summary/image.container.dart';
import 'package:spnk/views/windows/small/projects/quotesApp/quotes.title.text.dart';
// import 'package:spnk/views/windows/medium/projects/app.summary/image.container.dart';
// import 'package:spnk/views/windows/medium/projects/quotesApp/quotes.title.text.dart';

class QuotesAppItemSmall extends StatelessWidget {
  const QuotesAppItemSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    return SizedBox(
      height: screenHeight * 0.5,
      child: const QuotesAppImageContainer(),
    );
  }
}

class QuotesAppImageContainer extends StatelessWidget {
  const QuotesAppImageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageContainerSmall(imagePath: quotesAppImageAssetPath),
        Positioned.fill(
          left: 20,
          child: const Align(
            alignment: Alignment.bottomLeft,
            child: QuotesTitleTextSmall(),
          ),
        )
      ],
    );
  }
}
