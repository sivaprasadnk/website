import 'package:get/get.dart';
import 'package:spnk/data/contact_model.dart';
import 'package:spnk/data/experience_model.dart';
import 'package:spnk/data/project_model.dart';
import 'package:spnk/domain/contact_entity.dart';
import 'package:spnk/domain/experience_entity.dart';
import 'package:spnk/domain/project_entity.dart';

class DataController extends GetxController {

  RxList<ContactModel> get contacts => contactList.obs;
  RxList<ProjectModel> get projects => projectList.obs;
  RxList<ExperienceModel> get experiences => experienceList.obs;
}
