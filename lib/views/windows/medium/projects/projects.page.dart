import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';
import 'package:spnk/views/provider/data_provider.dart';
import 'package:spnk/views/provider/page_provider.dart';
import 'package:spnk/views/windows/medium/projects/app.summary/next.icon.dart';
import 'package:spnk/views/windows/medium/projects/app.summary/prev.icon.dart';
import 'package:spnk/views/windows/medium/projects/view.more.container.dart';
import 'package:spnk/views/windows/small/projects/app.summary/image.container.dart';
import 'package:spnk/views/windows/small/projects/app.summary/project.title.dart';
import 'package:spnk/views/windows/small/projects/app.summary/text.container.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsPage extends ConsumerWidget {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = context.screenHeight;
    final pageIndex = ref.watch(pageIndexProvider);
    final projects = ref.watch(projectProvider);
    final showNextIcon = pageIndex < projects.length - 1;
    final showPrevIcon = pageIndex != 0;
    return Row(
      children: [
        if (showPrevIcon) PrevIcon(controller: controller),
        SizedBox(
          height: screenHeight * 0.5,
          width: 450,
          child: PageView(
            onPageChanged: (pageIndex) {
              ref.read(pageIndexProvider.notifier).pageIndex =
                  pageIndex.toDouble();
            },
            controller: controller,
            children: projects.map((project) {
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
        if (showNextIcon) NextIcon(controller: controller),
      ],
    );
  }
}
