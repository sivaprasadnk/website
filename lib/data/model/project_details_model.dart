import 'package:spnk/domain/entity/project_details.dart';

class ProjectDetailsModel extends ProjectDetails {
  ProjectDetailsModel({
    required super.projName,
    required super.techStackList,
    required super.descList,
    required super.bgAssetPath,
    required super.url,
    required super.isWeb,
  });
}
