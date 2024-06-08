import 'package:flutter/material.dart';
import 'package:spnk/views/windows/medium/projects/projects.page.dart';

// ignore: must_be_immutable
class ProjectsMediumNew extends StatelessWidget {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 200),
            ProjectsPage(),
          ],
        ),
      ),
    );
  }
}
