import 'package:spnk/domain/entity/project_details.dart';
import 'package:spnk/domain/repository/repository.dart';

class GetProjectDetails {
  final Repository repository;
  GetProjectDetails({
    required this.repository,
  });

  List<ProjectDetails> call() {
    return repository.getProjectDetails();
  }
}
