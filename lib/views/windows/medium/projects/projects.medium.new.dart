import 'package:flutter/material.dart';
import 'package:spnk/views/windows/hover_extensions.dart';
import 'package:spnk/views/windows/medium/projects/quizApp/quiz.app.item.medium.dart';
import 'package:spnk/views/windows/medium/projects/quotesApp/quotes.app.item.dart';

class ProjectsMediumNew extends StatefulWidget {
  const ProjectsMediumNew({Key? key}) : super(key: key);

  @override
  State<ProjectsMediumNew> createState() => _ProjectsMediumNewState();
}

class _ProjectsMediumNewState extends State<ProjectsMediumNew> {
  PageController controller = PageController();

  bool showNextIcon = true;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    return Padding(
      padding: EdgeInsets.only(left: screenWidth * 0.08),
      child: SizedBox(
        height: screenHeight * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: screenHeight * 0.32),
            Stack(
              children: [
                SizedBox(
                  height: screenHeight * 0.5,
                  width: screenWidth * 0.6,
                  child: PageView(
                    controller: controller,
                    children: const [
                      QuizAppItemMedium(),
                      QuotesAppItemMedium(),
                    ],
                  ),
                ),
                if (!showNextIcon)
                  Positioned.fill(
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
                    right: 50,
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
        ),
      ),
    );
  }
}
