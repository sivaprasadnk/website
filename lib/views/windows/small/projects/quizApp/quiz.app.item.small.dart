import 'package:flutter/material.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/views/windows/small/projects/app.summary/image.container.dart';
import 'package:spnk/views/windows/small/projects/quizApp/title.text.dart';
// import 'package:spnk/views/windows/medium/projects/app.summary/image.container.dart';
// import 'package:spnk/views/windows/medium/projects/quizApp/title.text.dart';

class QuizAppItemSmall extends StatelessWidget {
  const QuizAppItemSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    return SizedBox(
      height: screenHeight * 0.5,
      child: const QuizImageContainer(),
    );
  }
}

class QuizImageContainer extends StatefulWidget {
  const QuizImageContainer({Key? key}) : super(key: key);

  @override
  State<QuizImageContainer> createState() => _QuizImageContainerState();
}

class _QuizImageContainerState extends State<QuizImageContainer> {
  bool onHovered = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageContainerSmall(imagePath: quizImageAssetPath),
        const Positioned.fill(
          left: 20,
          bottom: -2,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: QuizTitleTextSmall(),
          ),
        ),
      ],
    );
  }
}
