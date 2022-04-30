import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/page.provider.dart';
import 'package:spnk/views/windows/medium/projects/app.summary/next.icon.dart';
import 'package:spnk/views/windows/medium/projects/app.summary/prev.icon.dart';
import 'package:spnk/views/windows/medium/projects/portfolioApp/portfolio.app.medium.dart';
import 'package:spnk/views/windows/medium/projects/quizApp/quiz.app.item.medium.dart';
import 'package:spnk/views/windows/medium/projects/quotesApp/quotes.app.item.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    // final screenWidth = screenSize.width;
    return Row(
      children: [
        PrevIcon(controller: controller),
        SizedBox(
          height: screenHeight * 0.5,
          width: 450,
          child: PageView(
            onPageChanged: (pageIndex) {
              Provider.of<PageProvider>(context, listen: false)
                  .updatePage(pageIndex.toDouble());
            },
            controller: controller,
            children: const [
              QuizAppItemMedium(),
              QuotesAppItemMedium(),
              PortfolioAppItemMedium(),
            ],
          ),
        ),
        NextIcon(controller: controller),
      ],
    );
  }
}
