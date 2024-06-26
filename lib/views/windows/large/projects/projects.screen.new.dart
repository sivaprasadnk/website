import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';
import 'package:spnk/views/bloc/project/project_bloc.dart';
import 'package:spnk/views/bloc/project/project_event.dart';
import 'package:spnk/views/bloc/project/project_state.dart';
import 'package:spnk/views/windows/hover_extensions.dart';
import 'package:spnk/views/windows/large/common.widgets/section.title.dart';
import 'package:spnk/views/windows/large/projects/details.container.dart';
import 'package:spnk/views/windows/large/projects/image.container.dart';

// ignore: must_be_immutable
class ProjectsScreenNew extends StatelessWidget {
  ProjectsScreenNew({Key? key}) : super(key: key);

  ///
  PageController controller = PageController();

  ///
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: context.screenHeight * 0.2),
        const WindowsLargeSectionTitle(
          title: 'My Projects',
          // leftPadding: 0,
        ),
        const SizedBox(
          height: 50,
        ),
        BlocBuilder<ProjectBloc, ProjectState>(
          builder: (context, state) {
            return SizedBox(
              width: context.screenWidth * 0.9,
              height: context.screenHeight * 0.5,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    width: 150,
                  ),
                  if (state.showPrevIcon)
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
                    ),
                  SizedBox(
                    height: context.screenHeight * 0.5,
                    width: 800,
                    child: PageView(
                      onPageChanged: (page) {
                        context.read<ProjectBloc>().add(
                              ShowNextIcon(
                                showNext: page < state.projectList.length - 1,
                              ),
                            );
                        context.read<ProjectBloc>().add(
                              ShowPrevIcon(
                                showPrev: page > 0,
                              ),
                            );
                      },
                      controller: controller,
                      children: state.projectList.map((project) {
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
                  if (state.showNextIcon)
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
            );
          },
        ),
      ],
    );
  }
}
