import 'package:spnk/data/repository/repository_impl.dart';
import 'package:spnk/domain/entity/experience_details.dart';

class GetExpDetails {
  GetExpDetails(
    this.repository,
  );
  final RepositoryImpl repository;

  List<ExperienceDetails> call() {
    return repository.getExperienceDetails();
  }
}
