import 'package:spnk/data/data_sources/local_data_source.dart';
import 'package:spnk/domain/entity/contact_details.dart';
import 'package:spnk/domain/entity/experience_details.dart';
import 'package:spnk/domain/entity/project_details.dart';
import 'package:spnk/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final LocalDataSource localDataSource;

  RepositoryImpl({required this.localDataSource});

  @override
  List<ContactDetails> getContactDetails() {
    return localDataSource.getContactDetails();
  }

  @override
  List<ExperienceDetails> getExperienceDetails() {
    return localDataSource.getExperienceDetails();
  }

  @override
  List<ProjectDetails> getProjectDetails() {
    return localDataSource.getProjectDetails();
  }
}
