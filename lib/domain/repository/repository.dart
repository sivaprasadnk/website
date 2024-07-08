import 'package:spnk/domain/entity/about_me_details.dart';
import 'package:spnk/domain/entity/contact_details.dart';
import 'package:spnk/domain/entity/experience_details.dart';
import 'package:spnk/domain/entity/project_details.dart';

abstract class Repository {
  Future<List<ExperienceDetails>> getExperienceDetails();
  Future<List<ProjectDetails>> getProjectDetails();
  Future<List<ContactDetails>> getContactDetails();
  Future<AboutMeDetails> getAboutMe();
}
