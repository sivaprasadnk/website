import 'package:flutter/material.dart';
import 'package:spnk/views/windows/medium/projects/projects.page.dart';

class ProjectsMediumNew extends StatefulWidget {
  const ProjectsMediumNew({Key? key}) : super(key: key);

  @override
  State<ProjectsMediumNew> createState() => _ProjectsMediumNewState();
}

class _ProjectsMediumNewState extends State<ProjectsMediumNew> {
  PageController controller = PageController();

  bool showNextIcon = true;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    return Padding(
      padding: EdgeInsets.only(left: screenWidth * 0.08),
      child: SizedBox(
        height: screenHeight * 0.9,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 200),
            ProjectsPage(),
          ],
        ),
      ),
    );
  }
}
