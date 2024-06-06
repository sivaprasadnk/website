import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spnk/data/project_model.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';
import 'package:spnk/views/provider/data_provider.dart';
import 'package:spnk/views/provider/page_index_controller.dart';
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

  DataController dataController = Get.find<DataController>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;
    final projects = dataController.projects;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Positioned.fill(
        //   child: Align(
        //     child: CustomPaint(
        //       painter: AndroidBgCurve(ctx: context),
        //       child: Container(),
        //     ),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'My Projects',
            style: TextStyle(
              fontFamily: kRajdhaniFontFamily,
              fontWeight: FontWeight.bold,
              fontSize: 35,
              color: Colors.white,
            ),
          ),
        ),
        const AndroidDashImage(dashImage: 'dash3'),
        const SizedBox(
          height: 50,
        ),
        GetBuilder<PageIndexController>(
          builder: (pageIndexController) {
            final pageIndex = pageIndexController.pageIndex.value;

            final showNextIcon = pageIndex < projects.length - 1;
            final showPrevIcon = pageIndex != 0;
            return Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.4,
                  width: screenWidth * 0.8,
                  child: PageView(
                    onPageChanged: (pageIndex) {
                      debugPrint("krjbkejrcb");

                      pageIndexController.updatePageIndex(pageIndex);
                    },
                    controller: controller,
                    children: projects.map((project) {
                      return ProjectItem(
                        screenHeight: screenHeight,
                        project: project,
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
                    if (showPrevIcon)
                      GestureDetector(
                        onTap: () async {
                          debugPrint("previousPage");

                          await controller.previousPage(
                            duration: const Duration(seconds: 1),
                            curve: Curves.bounceOut,
                          );
                          pageIndexController.updatePageIndex(pageIndex - 1);
                        },
                        child: SizedBox(
                          height: 10,
                          width: 10,
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ).showCursorOnHover,
                        ),
                      )
                    else
                      const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                    if (showNextIcon)
                      GestureDetector(
                        onTap: () async {
                          debugPrint("nextPage");
                          await controller.nextPage(
                            duration: const Duration(seconds: 1),
                            curve: Curves.bounceOut,
                          );
                          pageIndexController.updatePageIndex(pageIndex + 1);
                        },
                        child: SizedBox(
                          height: 10,
                          width: 10,
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
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

class ProjectItem extends StatelessWidget {
  const ProjectItem({
    Key? key,
    required this.screenHeight,
    required this.project,
  }) : super(key: key);

  final double screenHeight;
  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
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
                      ProjectTitle(
                        title: project.projName,
                      ),
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
  }
}
