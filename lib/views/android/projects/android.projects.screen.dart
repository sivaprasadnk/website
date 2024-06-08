import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spnk/utils/common_colors.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';
import 'package:spnk/views/bloc/project/project_bloc.dart';
import 'package:spnk/views/bloc/project/project_event.dart';
import 'package:spnk/views/bloc/project/project_state.dart';
import 'package:spnk/views/windows/hover_extensions.dart';
import 'package:spnk/views/windows/small/projects/app.summary/image.container.dart';
import 'package:spnk/views/windows/small/projects/app.summary/project.title.dart';
import 'package:spnk/views/windows/small/projects/app.summary/text.container.dart';
import 'package:spnk/views/windows/small/projects/app.summary/view.more.small.dart';
import 'package:url_launcher/url_launcher.dart';

class AndroidProjects extends StatefulWidget {
  const AndroidProjects();
  @override
  _AndroidProjectsState createState() => _AndroidProjectsState();
}

class _AndroidProjectsState extends State<AndroidProjects> {
  PageController controller = PageController();

  Widget Function(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) animationItemBuilder(
    Widget Function(int index) child, {
    EdgeInsets padding = EdgeInsets.zero,
  }) =>
      (
        BuildContext context,
        int index,
        Animation<double> animation,
      ) =>
          FadeTransition(
            opacity: Tween<double>(
              begin: 0,
              end: 1,
            ).animate(animation),
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, -0.1),
                end: Offset.zero,
              ).animate(animation),
              child: Padding(
                padding: padding,
                child: child(index),
              ),
            ),
          );

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'My Projects',
            style: TextStyle(
              fontFamily: kRajdhaniFontFamily,
              fontWeight: FontWeight.bold,
              fontSize: 35,
              color: kWhiteColor,
            ),
          ),
        ),
        const AndroidDashImage(dashImage: 'dash3'),
        BlocBuilder<ProjectBloc, ProjectState>(
          builder: (context, state) {
            return Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.5,
                  width: screenWidth * 0.8,
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
                        height: screenHeight * 0.5,
                        child: Stack(
                          children: [
                            ImageContainerSmall(
                              imagePath: project.bgAssetPath,
                              isWeb: project.isWeb,
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
                                          onTap: () async {
                                            await launchUrl(
                                              Uri.parse(project.url),
                                            );
                                          },
                                          child: const ViewMoreContainerSmall(),
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
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (state.showPrevIcon)
                      GestureDetector(
                        onTap: () {
                          controller.previousPage(
                            duration: const Duration(seconds: 1),
                            curve: Curves.bounceOut,
                          );
                        },
                        child: SizedBox(
                          height: 10,
                          width: 10,
                          child: const Icon(
                            Icons.arrow_back_ios,
                          ).showCursorOnHover,
                        ),
                      )
                    else
                      const SizedBox(
                        height: 10,
                        width: 10,
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
                          height: 10,
                          width: 10,
                          child: const Icon(
                            Icons.arrow_forward_ios,
                          ).showCursorOnHover,
                        ),
                      )
                    else
                      const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                  ],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
