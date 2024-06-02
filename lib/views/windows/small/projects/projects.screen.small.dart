import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/data/project_model.dart';
import 'package:spnk/entity/project_entity.dart';
import 'package:spnk/views/provider/page.provider.dart';
import 'package:spnk/views/windows/hover_extensions.dart';
import 'package:spnk/views/windows/medium/projects/app.summary/next.icon.dart';
import 'package:spnk/views/windows/medium/projects/app.summary/prev.icon.dart';
import 'package:spnk/views/windows/small/projects/app.summary/image.container.dart';
import 'package:spnk/views/windows/small/projects/app.summary/project.title.dart';
import 'package:spnk/views/windows/small/projects/app.summary/text.container.dart';
// import 'package:spnk/views/windows/medium/projects/quizApp/quiz.app.item.medium.dart';
// import 'package:spnk/views/windows/medium/projects/quotesApp/quotes.app.item.dart';
import 'package:spnk/views/windows/small/windows.small.common.widgets.dart';
import 'package:url_launcher/url_launcher.dart';

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
                  children: projectList.map((proj) {
                    return ProjectItemSmall(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      project: proj,
                    );
                  }).toList(),
                  // children: const [
                  //   QuizAppItemSmall(),
                  //   QuotesAppItemSmall(),
                  //   PortfolioAppItemSmall(),
                  // ],
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

class ProjectItemSmall extends StatelessWidget {
  const ProjectItemSmall({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
    required this.project,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;
  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.5,
      child: Stack(
        children: [
          ImageContainerSmall(
            imagePath: project.bgAssetPath,
            isWeb: true,
          ),
          Positioned.fill(
            left: 20,
            bottom: -2,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: const TextContainer().blurred(
                overlay: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      ProjectTitle(title: project.projName),
                      const Expanded(
                        child: Text(""),
                      ),
                      GestureDetector(
                        onTap: () {
                          launchUrl(Uri.parse(project.url));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                            top: 5,
                            right: 5,
                            bottom: 8,
                          ),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(
                              0,
                              34,
                              120,
                              1,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: screenWidth > 600
                                ? const Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: Text(
                                      'View More',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  )
                                : const Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: Icon(
                                      Icons.info,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        ).showCursorOnHover,
                      ),
                    ],
                  ),
                ),
                colorOpacity: 0.3,
                alignment: Alignment.topLeft,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
