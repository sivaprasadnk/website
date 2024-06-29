import 'package:flutter/material.dart';
import 'package:spnk/data/project_model.dart';
import 'package:spnk/utils/common_colors.dart';
import 'package:spnk/utils/extensions/context_extension.dart';
import 'package:spnk/utils/extensions/widget_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectContainer extends StatefulWidget {
  const ProjectContainer({
    Key? key,
    required this.project,
  }) : super(key: key);

  final ProjectModel project;

  @override
  State<ProjectContainer> createState() => _ProjectContainerState();
}

class _ProjectContainerState extends State<ProjectContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, right: 20),
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            _isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            _isHovered = false;
          });
        },
        child: GestureDetector(
          onTap: () {},
          child: Material(
            elevation: _isHovered ? 15 : 0,
            shadowColor: _isHovered ? context.shadowColor : kTransparentColor,
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 350,
                  height: 265,
                  decoration: BoxDecoration(
                    color: context.scaffoldColor,
                    border: Border.all(
                      color: context.primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 5),
                        child: Text(
                          widget.project.projName,
                          style: context.displaySmall,
                        ),
                      ),
                      const Divider(),
                      Wrap(
                        children: widget.project.techStackList.map((tool) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 3,
                            ),
                            margin: const EdgeInsets.symmetric(
                              vertical: 3,
                              horizontal: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Text(
                              tool,
                              style: context.bodyMedium.copyWith(
                                color: context.scaffoldColor,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.project.descList.map((desc) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8, left: 8),
                              child: Text(
                                desc,
                                style: context.bodyMedium,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned.fill(
                  bottom: 8,
                  right: 8,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () async {
                        await launchUrl(Uri.parse(widget.project.url));
                      },
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                            color: context.primaryColor,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 13,
                            vertical: 5,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(width: 10),
                              Text(
                                "View",
                                style: context.bodyMedium,
                              ),
                              const SizedBox(width: 10),
                              Icon(
                                Icons.arrow_right_alt,
                                color: context.primaryColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ).showCursorOnHover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
