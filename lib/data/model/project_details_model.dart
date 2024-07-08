import 'package:spnk/domain/entity/project_details.dart';

class ProjectDetailsModel extends ProjectDetails {
  ProjectDetailsModel({
    required super.projName,
    required super.techStackList,
    required super.descList,
    // required super.bgAssetPath,
    required super.url,
    required super.isWeb,
  });

  factory ProjectDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProjectDetailsModel(
      projName: json['name'],
      techStackList:
          (json['tech_stack'] as List).map((e) => e.toString()).toList(),
      descList: (json['desc'] as List).map((e) => e.toString()).toList(),
      url: json['url'],
      isWeb: json['is_web'],
    );
  }
}
