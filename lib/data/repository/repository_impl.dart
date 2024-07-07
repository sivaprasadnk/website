import 'package:spnk/data/data_sources/local_data_source_impl.dart';
import 'package:spnk/domain/entity/about_me_details.dart';
import 'package:spnk/domain/entity/contact_details.dart';
import 'package:spnk/domain/entity/experience_details.dart';
import 'package:spnk/domain/entity/project_details.dart';
import 'package:spnk/domain/repository/repository.dart';
import 'package:spnk/utils/locator.dart';

class RepositoryImpl implements Repository {
  RepositoryImpl();

  @override
  List<ContactDetails> getContactDetails() {
    return locator<LocalDataSourceImpl>().getContactDetails();
  }

  @override
  List<ExperienceDetails> getExperienceDetails() {
    return locator<LocalDataSourceImpl>().getExperienceDetails();
  }

  @override
  List<ProjectDetails> getProjectDetails() {
    return locator<LocalDataSourceImpl>().getProjectDetails();
  }

  @override
  AboutMeDetails getAboutMe() {
    return locator<LocalDataSourceImpl>().getAboutMe();
  }
}
