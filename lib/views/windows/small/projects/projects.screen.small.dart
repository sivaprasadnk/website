import 'package:flutter/material.dart';
import 'package:spnk/views/windows/hover_extensions.dart';
import 'package:spnk/views/windows/small/projects/quizApp/quiz.app.item.small.dart';
import 'package:spnk/views/windows/small/projects/quotesApp/quotes.app.item.dart';
// import 'package:spnk/views/windows/medium/projects/quizApp/quiz.app.item.medium.dart';
// import 'package:spnk/views/windows/medium/projects/quotesApp/quotes.app.item.dart';
import 'package:spnk/views/windows/small/windows.small.common.widgets.dart';

class ProjectsScreenSmall extends StatefulWidget {
  const ProjectsScreenSmall({Key? key}) : super(key: key);

  @override
  State<ProjectsScreenSmall> createState() => _ProjectsScreenSmallState();
}

class _ProjectsScreenSmallState extends State<ProjectsScreenSmall> {
  PageController controller = PageController();

  bool showNextIcon = true;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: screenHeight * 0.13),
        SectionTitle(screenWidth: screenWidth, title: 'My Projects'),
        SizedBox(height: screenHeight * 0.1),
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.07),
              child: SizedBox(
                height: screenHeight * 0.5,
                width: screenWidth * 0.6,
                child: PageView(
                  controller: controller,
                  children: const [
                    QuizAppItemSmall(),
                    QuotesAppItemSmall(),
                  ],
                ),
              ),
            ),
            if (!showNextIcon)
              Positioned.fill(
                left: screenWidth * 0.15,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      controller.previousPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.bounceOut,
                      );
                      setState(() {
                        showNextIcon = true;
                      });
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Theme.of(context).splashColor,
                    ).showCursorOnHover,
                  ),
                ),
              ),
            if (showNextIcon)
              Positioned.fill(
                // left: 300,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      controller.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.bounceOut,
                      );
                      setState(() {
                        showNextIcon = false;
                      });
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Theme.of(context).splashColor,
                    ).showCursorOnHover,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
