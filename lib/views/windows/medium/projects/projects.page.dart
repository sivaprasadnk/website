import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/entity/project_entity.dart';
import 'package:spnk/views/provider/page.provider.dart';
import 'package:spnk/views/windows/medium/projects/app.summary/next.icon.dart';
import 'package:spnk/views/windows/medium/projects/app.summary/prev.icon.dart';
import 'package:spnk/views/windows/medium/projects/view.more.container.dart';
import 'package:spnk/views/windows/small/projects/app.summary/image.container.dart';
import 'package:spnk/views/windows/small/projects/app.summary/project.title.dart';
import 'package:spnk/views/windows/small/projects/app.summary/text.container.dart';
import 'package:url_launcher/url_launcher.dart';

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
            children: projectList.map((project) {
              return Stack(
                children: [
                  ImageContainerSmall(
                    imagePath: project.bgAssetPath,
                    isWeb: project.isWeb,
                  ),
                  Positioned.fill(
                    left: 20,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: const TextContainer().blurred(
                        overlay: Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                          ),
                          child: Row(
                            children: [
                              ProjectTitle(title: project.projName),
                              const Expanded(
                                child: Text(""),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await launchUrl(Uri.parse(project.url));
                                },
                                child: const ViewMoreContainer(),
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
              );
            }).toList(),
          ),
        ),
        NextIcon(controller: controller),
      ],
    );
  }
}
