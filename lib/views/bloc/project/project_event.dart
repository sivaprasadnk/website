import 'package:equatable/equatable.dart';

abstract class ProjectEvent extends Equatable {
  const ProjectEvent();
  @override
  List<Object?> get props => [];
}

class GetProjects extends ProjectEvent {}

class TogglePrevIcon extends ProjectEvent {}

class ToggleNextIcon extends ProjectEvent {}
