import 'package:flutter/material.dart';
import 'package:spnk/data/project_model.dart';
import 'package:spnk/utils/common_colors.dart';
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';
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
      padding: const EdgeInsets.only(bottom: 40, right: 20),
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
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 400,
              height: 300,
              decoration: BoxDecoration(
                color: context.scaffoldColor,
                border: Border.all(
                  color: Theme.of(context).primaryColor,
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
                          style: context.displaySmall.copyWith(
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
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            desc,
                            style: context.displaySmall,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 3,
                          horizontal: 5,
                        ),
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
                                horizontal: 15,
                                vertical: 7,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(width: 10),
                                  Text(
                                    "View",
                                    style: context.displaySmall,
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
                    ],
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
