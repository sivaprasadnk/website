import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spnk/utils/common_colors.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';
import 'package:spnk/views/provider/data_provider.dart';
import 'package:spnk/views/provider/page_provider.dart';
import 'package:spnk/views/windows/hover_extensions.dart';
import 'package:spnk/views/windows/small/projects/app.summary/image.container.dart';
import 'package:spnk/views/windows/small/projects/app.summary/project.title.dart';
import 'package:spnk/views/windows/small/projects/app.summary/text.container.dart';
import 'package:spnk/views/windows/small/projects/app.summary/view.more.small.dart';
import 'package:url_launcher/url_launcher.dart';

class AndroidProjects extends ConsumerStatefulWidget {
  const AndroidProjects();
  @override
  _AndroidProjectsState createState() => _AndroidProjectsState();
}

class _AndroidProjectsState extends ConsumerState<AndroidProjects> {
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
    final pageIndex = ref.watch(pageIndexProvider);
    final projects = ref.watch(projectProvider);
    final showNextIcon = pageIndex < projects.length - 1;
    final showPrevIcon = pageIndex != 0;

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
        Column(
          children: [
            SizedBox(
              height: screenHeight * 0.5,
              width: screenWidth * 0.8,
              child: PageView(
                onPageChanged: (pageIndex) {
                  ref.read(pageIndexProvider.notifier).pageIndex = pageIndex;
                },
                controller: controller,
                children: ref.watch(projectProvider).map((project) {
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
                if (showPrevIcon)
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
                if (showNextIcon)
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
        ),
      ],
    );
  }
}
