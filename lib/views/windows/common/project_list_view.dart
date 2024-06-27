import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spnk/views/bloc/project/project_bloc.dart';
import 'package:spnk/views/bloc/project/project_state.dart';
import 'package:spnk/views/windows/common/project_container.dart';

class ProjectListView extends StatelessWidget {
  const ProjectListView({Key? key, required this.padding}) : super(key: key);
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, state) {
        return SizedBox(
          height: 350,
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
