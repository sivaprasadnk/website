import 'package:flutter/material.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/views/windows/large/projects/details.container.dart';
import 'package:spnk/views/windows/large/projects/image.container.dart';

class QuizAppItem extends StatelessWidget {
  const QuizAppItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    return SizedBox(
      height: screenHeight * 0.5,
      child: Row(
        children: const [
          QuizImageContainer(),
          QuizDetailsContainer(),
        ],
      ),
    );
  }
}

class QuizImageContainer extends StatelessWidget {
  const QuizImageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageContainer(imagePath: quizImageAssetPath);
  }
}

class QuizDetailsContainer extends StatelessWidget {
  const QuizDetailsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DetailsContainer(
      desc1: quizStr3,
      desc2: quizStr4,
      tools2: 'Firebase',
      link: spQuizLink,
      title: 'SP Quiz App',
      isWeb: false,
    );
  }
}
