import 'package:flutter/material.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/views/windows/medium/projects/quizApp/quiz.title.text.dart';
import 'package:spnk/views/windows/small/projects/app.summary/image.container.dart';

class QuizAppItemMedium extends StatelessWidget {
  const QuizAppItemMedium({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: QuizImageContainer(),
    );
  }
}

class QuizImageContainer extends StatelessWidget {
  const QuizImageContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageContainerSmall(imagePath: quizImageAssetPath),
        Positioned.fill(
          left: 20,
          child: const Align(
            alignment: Alignment.bottomLeft,
            child: QuizTitleText(),
          ),
        ),
      ],
    );
  }
}
