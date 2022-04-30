import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/page.provider.dart';
import 'package:spnk/views/windows/medium/projects/app.summary/next.icon.dart';
import 'package:spnk/views/windows/medium/projects/app.summary/prev.icon.dart';
import 'package:spnk/views/windows/small/projects/portfolioApp/portfolio.app.item.small.dart';
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.5,
                width: 380,
                child: PageView(
                  controller: controller,
                  onPageChanged: (pageIndex) {
                    Provider.of<PageProvider>(context, listen: false)
                        .updatePage(pageIndex.toDouble());
                  },
                  children: const [
                    QuizAppItemSmall(),
                    QuotesAppItemSmall(),
                    PortfolioAppItemSmall(),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 300,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    PrevIcon(controller: controller),
                    const Spacer(),
                    NextIcon(controller: controller),
                    const SizedBox(
                      width: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
