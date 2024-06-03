import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';
import 'package:spnk/views/provider/data_provider.dart';
import 'package:spnk/views/provider/page_provider.dart';
import 'package:spnk/views/windows/hover_extensions.dart';
import 'package:spnk/views/windows/large/common.widgets/section.title.dart';
import 'package:spnk/views/windows/large/projects/details.container.dart';
import 'package:spnk/views/windows/large/projects/image.container.dart';

// ignore: must_be_immutable
class ProjectsScreenNew extends ConsumerWidget {
  ProjectsScreenNew({Key? key}) : super(key: key);

  ///
  PageController controller = PageController();

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(pageIndexProvider);
    final projects = ref.watch(projectProvider);
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
                    ).showCursorOnHover
                        ,
                  ),
                ),
              SizedBox(
                height: context.screenHeight * 0.5,
                width: 800,
                child: PageView(
                  onPageChanged: (page) {
                    ref.read(pageIndexProvider.notifier).pageIndex =
                        page.toDouble();
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
                  },
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Theme.of(context).splashColor,
                    ).showCursorOnHover,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
