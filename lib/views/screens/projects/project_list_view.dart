import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spnk/utils/extensions/context_extension.dart';
import 'package:spnk/views/bloc/project/project_bloc.dart';
import 'package:spnk/views/bloc/project/project_state.dart';
import 'package:spnk/views/screens/projects/loading_project_container.dart';
import 'package:spnk/views/screens/projects/project_container.dart';

class ProjectListView extends StatelessWidget {
  const ProjectListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, state) {
        return SizedBox(
          height: context.isLargeDevice ? 460 : context.screenHeight - 200,
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              child: Scrollbar(
                child: Wrap(
                  children: state.isLoading
                      ? [1, 1, 1].map((_) {
                          return const LoadingProjectContainer();
                        }).toList()
                      : state.projectList.map((project) {
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
