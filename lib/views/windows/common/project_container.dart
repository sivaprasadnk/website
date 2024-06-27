import 'package:flutter/material.dart';
import 'package:spnk/data/project_model.dart';
import 'package:spnk/utils/common_colors.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';
import 'package:spnk/utils/extensions/widget_extensions.dart';

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
    final textStyle = Theme.of(context).textTheme.displaySmall;

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
                // boxShadow: _isHovered
                //     ? [
                //         BoxShadow(
                //           // blurStyle: BlurStyle.inner,
                //           color: context.shadowColor,
                //           blurRadius: 2,
                //           spreadRadius: 2,
                //         ),
                //       ]
                //     : [],
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
                      style: textStyle,
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
                          style: textStyle!.copyWith(
                            color: Theme.of(context).scaffoldBackgroundColor,
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
                            style: textStyle,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const Spacer(),
                  if (!widget.project.isWeb)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 3,
                        horizontal: 5,
                      ),
                      child: SizedBox(
                        height: 60,
                        child: GooglePlayButton(
                          url: widget.project.url,
                        ),
                      ),
                    ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ).showCursorOnHover,
      ),
    );
  }
}
