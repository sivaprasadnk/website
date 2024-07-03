import 'package:spnk/domain/entity/experience_details.dart';
import 'package:spnk/domain/repository/repository.dart';

class GetExpDetails {
  GetExpDetails(
    this.repository,
  );
  final Repository repository;

  List<ExperienceDetails> call() {
    return repository.getExperienceDetails();
  }
}
