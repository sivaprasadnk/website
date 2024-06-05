import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';
import 'package:spnk/views/provider/data_provider.dart';
import 'package:spnk/views/provider/page_index_controller.dart';
import 'package:spnk/views/windows/hover_extensions.dart';
import 'package:spnk/views/windows/large/common.widgets/section.title.dart';
import 'package:spnk/views/windows/large/projects/details.container.dart';
import 'package:spnk/views/windows/large/projects/image.container.dart';

// ignore: must_be_immutable
class ProjectsScreenNew extends StatelessWidget {
  ProjectsScreenNew({Key? key}) : super(key: key);

  ///
  PageController controller = PageController();
  DataController dataController = Get.find<DataController>();
  PageIndexController pageIndexController = Get.find<PageIndexController>();

  ///
  @override
  Widget build(BuildContext context) {
    final projects = dataController.projects;

    return GetX<PageIndexController>(
      builder: (pageIndexController) {
        final pageIndex = pageIndexController.pageIndex.value;

        final showNextIcon = pageIndex < projects.length - 1;
        final showPrevIcon = pageIndex != 0;
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
                  if (showPrevIcon)
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
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Theme.of(context).splashColor,
                        ).showCursorOnHover,
                      ),
                    )
                  else
                    const SizedBox(
                      height: 20,
                      width: 20,
                    ),
                  SizedBox(
                    height: context.screenHeight * 0.5,
                    width: 800,
                    child: PageView(
                      onPageChanged: (page) {
                        pageIndexController.pageIndex.value = page;
                      },
                      controller: controller,
                      children: projects.map((project) {
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
                        pageIndexController.pageIndex.value += 1;
                      },
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Theme.of(context).splashColor,
                        ).showCursorOnHover,
                      ),
                    )
                  else
                    const SizedBox(
                      height: 20,
                      width: 20,
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
