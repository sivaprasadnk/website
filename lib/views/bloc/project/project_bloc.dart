import 'package:bloc/bloc.dart';
import 'package:spnk/domain/project_entity.dart';
import 'package:spnk/views/bloc/project/project_event.dart';
import 'package:spnk/views/bloc/project/project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(const ProjectState()) {
    on<GetProjects>(_getProjects);
    on<ShowNextIcon>(_showNextIcon);
    on<ShowPrevIcon>(_showPrevIcon);
  }

  void _getProjects(GetProjects event, Emitter<ProjectState> emit) {
    emit(state.copyWith(list: projectList));
  }

  void _showNextIcon(ShowNextIcon event, Emitter<ProjectState> emit) {
    emit(state.copyWith(showNext: event.showNext));
  }

  void _showPrevIcon(ShowPrevIcon event, Emitter<ProjectState> emit) {
    emit(state.copyWith(showPrev: event.showPrev));
  }
}
