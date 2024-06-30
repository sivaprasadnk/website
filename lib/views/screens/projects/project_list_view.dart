import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spnk/utils/extensions/context_extension.dart';
import 'package:spnk/views/bloc/project/project_bloc.dart';
import 'package:spnk/views/bloc/project/project_state.dart';
import 'package:spnk/views/screens/projects/project_container.dart';

class ProjectListView extends StatelessWidget {
  const ProjectListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, state) {
        return SizedBox(
          // height: context.isLargeDevice ? 460 : context.screenHeight - 200,
          height: context.isLargeDevice ? 460 : 480,
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              child: Scrollbar(
                child: Wrap(
                  children: state.projectList.map((project) {
                    return ProjectContainer(
                      project: project,
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
