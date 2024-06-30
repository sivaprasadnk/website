import 'package:spnk/data/repository/repository_impl.dart';
import 'package:spnk/domain/entity/project_details.dart';

class GetProjectDetails {
  final RepositoryImpl repository;
  GetProjectDetails({
    required this.repository,
  });

  List<ProjectDetails> call() {
    return repository.getProjectDetails();
  }
}
