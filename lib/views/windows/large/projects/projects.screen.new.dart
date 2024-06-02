import 'package:flutter/material.dart';
import 'package:spnk/entity/project_entity.dart';
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';
import 'package:spnk/views/windows/hover_extensions.dart';
import 'package:spnk/views/windows/large/common.widgets/section.title.dart';
import 'package:spnk/views/windows/large/projects/details.container.dart';
import 'package:spnk/views/windows/large/projects/image.container.dart';

class ProjectsScreenNew extends StatefulWidget {
  const ProjectsScreenNew({Key? key}) : super(key: key);

  @override
  State<ProjectsScreenNew> createState() => _ProjectsScreenNewState();
}

class _ProjectsScreenNewState extends State<ProjectsScreenNew> {
  ///
  PageController controller = PageController();

  ///
  bool showNextIcon = true;
  bool showPrevIcon = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: context.screenHeight * 0.2),
        const WindowsLargeSectionTitle(
          title: 'My Projects',
        ),
        const SizedBox(
          height: 50,
        ),
        SizedBox(
          width: context.screenWidth * 0.9,
          height: context.screenHeight * 0.5,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 150,
              ),
              GestureDetector(
                onTap: () {
                  controller.previousPage(
                    duration: const Duration(seconds: 1),
                    curve: Curves.bounceOut,
                  );
                },
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: showPrevIcon
                      ? Icon(
                          Icons.arrow_back_ios,
                          color: Theme.of(context).splashColor,
                        ).showCursorOnHover
                      : const SizedBox.shrink(),
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.5,
                width: 800,
                child: PageView(
                  onPageChanged: (page) {
                    setState(() {
                      showPrevIcon = page != 0;
                      showNextIcon = page != 2;
                    });
                  },
                  controller: controller,
                  children: projectList.map((project) {
                    return SizedBox(
                      height: context.screenHeight * 0.5,
                      child: Row(
                        children: [
                          ImageContainer(
                            imagePath: project.bgAssetPath,
                            isWeb: project.isWeb,
                          ),
                          DetailsContainer(
                            desc1: project.descList.first,
                            desc2: project.descList.last,
                            tools1: project.techStackList.first,
                            tools2: project.techStackList.last,
                            link: project.url,
                            title: project.projName,
                            isWeb: project.isWeb,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              if (showNextIcon)
                GestureDetector(
                  onTap: () {
                    controller.nextPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.bounceOut,
                    );
                  },
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: showNextIcon
                        ? Icon(
                            Icons.arrow_forward_ios,
                            color: Theme.of(context).splashColor,
                          ).showCursorOnHover
                        : const SizedBox.shrink(),
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}
