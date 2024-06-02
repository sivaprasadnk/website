class ProjectModel {
  String projName;
  List<String> techStackList;
  List<String> descList;
  String bgAssetPath;
  String url;
  bool isWeb;
  ProjectModel({
    required this.projName,
    required this.techStackList,
    required this.descList,
    required this.bgAssetPath,
    required this.url,
    required this.isWeb,
  });
}
