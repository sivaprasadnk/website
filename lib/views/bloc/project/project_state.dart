import 'package:equatable/equatable.dart';
import 'package:spnk/data/project_model.dart';

class ProjectState extends Equatable {
  final List<ProjectModel> projectList;
  final bool showNextIcon;
  final bool showPrevIcon;

  const ProjectState({
    this.projectList = const [],
    this.showNextIcon = true,
    this.showPrevIcon = false,
  });

  ProjectState copyWith({
    List<ProjectModel>? list,
    bool? showNext,
    bool? showPrev,
  }) {
    return ProjectState(
      projectList: list ?? projectList,
      showNextIcon: showNext ?? showNextIcon,
      showPrevIcon: showPrev ?? showPrevIcon,
    );
  }

  @override
  List<Object?> get props => [
        projectList,
        showNextIcon,
        showPrevIcon,
      ];
}
