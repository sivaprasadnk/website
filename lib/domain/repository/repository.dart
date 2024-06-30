import 'package:spnk/domain/entity/contact_details.dart';
import 'package:spnk/domain/entity/experience_details.dart';
import 'package:spnk/domain/entity/project_details.dart';

abstract class Repository {
  List<ExperienceDetails> getExperienceDetails();
  List<ProjectDetails> getProjectDetails();
  List<ContactDetails> getContactDetails();
}
