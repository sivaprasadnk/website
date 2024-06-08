import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';
import 'package:spnk/views/bloc/project/project_bloc.dart';
import 'package:spnk/views/bloc/project/project_event.dart';
import 'package:spnk/views/bloc/project/project_state.dart';
import 'package:spnk/views/windows/medium/projects/app.summary/next.icon.dart';
import 'package:spnk/views/windows/medium/projects/app.summary/prev.icon.dart';
import 'package:spnk/views/windows/medium/projects/view.more.container.dart';
import 'package:spnk/views/windows/small/projects/app.summary/image.container.dart';
import 'package:spnk/views/windows/small/projects/app.summary/project.title.dart';
import 'package:spnk/views/windows/small/projects/app.summary/text.container.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsPage extends StatelessWidget {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = context.screenHeight;
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, state) {
        return Row(
          children: [
            if (state.showPrevIcon) PrevIcon(controller: controller),
            SizedBox(
              height: screenHeight * 0.5,
              width: 450,
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
            if (state.showNextIcon) NextIcon(controller: controller),
          ],
        );
      },
    );
  }
}
