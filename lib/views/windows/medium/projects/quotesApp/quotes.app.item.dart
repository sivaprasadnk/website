import 'package:flutter/material.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/views/windows/medium/projects/quotesApp/quotes.title.text.dart';
import 'package:spnk/views/windows/small/projects/app.summary/image.container.dart';

class QuotesAppItemMedium extends StatelessWidget {
  const QuotesAppItemMedium({
    Key? key,
    // required this.pageIndex,
    // required this.controller,
  }) : super(key: key);
  // final double pageIndex;
  // final PageController controller;

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    // final screenHeight = screenSize.height;
    return const SizedBox(
      // height: screenHeight * 0.5,
      child: QuotesAppImageContainer(
          // pageIndex: controller.page!,
          // controller: controller,
          ),
    );
  }
}

class QuotesAppImageContainer extends StatelessWidget {
  const QuotesAppImageContainer({
    Key? key,
    // required this.pageIndex,
    // required this.controller,
  }) : super(key: key);
  // final double pageIndex;
  // final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageContainerSmall(imagePath: quotesAppImageAssetPath),
        Positioned.fill(
          left: 20,
          child: const Align(
            alignment: Alignment.bottomLeft,
            child: QuotesTitleText(),
          ),
        ),
      ],
    );
  }
}

// class QuizImageContainer extends StatefulWidget {
//   const QuizImageContainer({Key? key}) : super(key: key);

//   @override
//   State<QuizImageContainer> createState() => _QuizImageContainerState();
// }

// class _QuizImageContainerState extends State<QuizImageContainer> {
//   bool onHovered = false;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         ImageContainer(imagePath: quizImageAssetPath),
//         const Positioned.fill(
//           left: 50,
//           child: Align(
//             alignment: Alignment.bottomLeft,
//             child: QuizTitleText(),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class QuotesAppDetailsContainer extends StatelessWidget {
//   const QuotesAppDetailsContainer({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DetailsContainer(
//       desc1: quotesAppStr1,
//       desc2: quotesAppStr2,
//       link: spQuotesLink,
//       title: 'SP Quotes App',
//     );
//   }
// }
