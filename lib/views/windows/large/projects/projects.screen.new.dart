import 'package:flutter/material.dart';
import 'package:spnk/views/windows/hover_extensions.dart';
import 'package:spnk/views/windows/large/common.widgets/section.title.dart';
import 'package:spnk/views/windows/large/projects/quizApp/quiz.item.dart';
import 'package:spnk/views/windows/large/projects/quotesApp/quotes.app.item.dart';

class ProjectsScreenNew extends StatefulWidget {
  const ProjectsScreenNew({Key? key}) : super(key: key);

  @override
  State<ProjectsScreenNew> createState() => _ProjectsScreenNewState();
}

class _ProjectsScreenNewState extends State<ProjectsScreenNew> {
  PageController controller = PageController();
  bool showNextIcon = true;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: screenHeight * 0.2),
        WindowsLargeSectionTitle(
          title: 'My Projects',
          width: screenWidth,
        ),
        const SizedBox(
          height: 50,
        ),
        Stack(
          children: [
            Container(
              height: screenHeight * 0.5,
              padding: EdgeInsets.only(left: screenWidth * 0.1),
              child: PageView(
                controller: controller,
                children: const [
                  QuizAppItem(),
                  QuotesAppItem(),
                ],
              ),
            ),
            if (!showNextIcon)
              Positioned.fill(
                left: 100,
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
                right: 100,
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
        )
      ],
    );
  }
}
