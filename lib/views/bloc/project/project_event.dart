abstract class ProjectEvent {
  const ProjectEvent();
}

class GetProjects extends ProjectEvent {}

class TogglePrevIcon extends ProjectEvent {}

class ToggleNextIcon extends ProjectEvent {}
