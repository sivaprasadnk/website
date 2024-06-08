import 'package:bloc/bloc.dart';
import 'package:spnk/domain/project_entity.dart';
import 'package:spnk/views/bloc/project/project_event.dart';
import 'package:spnk/views/bloc/project/project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(const ProjectState()) {
    on<GetProjects>(_getProjects);
    on<ToggleNextIcon>(_toggleNextIcon);
    on<TogglePrevIcon>(_togglePrevIcon);
  }

  void _getProjects(GetProjects event, Emitter<ProjectState> emit) {
    emit(state.copyWith(list: projectList));
  }

  void _toggleNextIcon(ToggleNextIcon event, Emitter<ProjectState> emit) {
    emit(state.copyWith(showNext: !state.showNextIcon));
  }

  void _togglePrevIcon(TogglePrevIcon event, Emitter<ProjectState> emit) {
    emit(state.copyWith(showPrev: !state.showPrevIcon));
  }
}
