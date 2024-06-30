import 'package:equatable/equatable.dart';
import 'package:spnk/domain/entity/project_details.dart';

class ProjectState extends Equatable {
  final List<ProjectDetails> projectList;
  final bool showNextIcon;
  final bool showPrevIcon;

  const ProjectState({
    this.projectList = const [],
    this.showNextIcon = true,
    this.showPrevIcon = false,
  });

  ProjectState copyWith({
    List<ProjectDetails>? list,
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
