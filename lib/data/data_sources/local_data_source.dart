import 'package:spnk/data/model/contact_details_model.dart';
import 'package:spnk/data/model/experience_details_model.dart';
import 'package:spnk/data/model/project_details_model.dart';

abstract class LocalDataSource {
  List<ExperienceDetailsModel> getExperienceDetails();
  List<ProjectDetailsModel> getProjectDetails();
  List<ContactDetailsModel> getContactDetails();
}
