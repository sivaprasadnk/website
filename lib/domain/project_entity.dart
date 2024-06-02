import 'package:spnk/data/project_model.dart';
import 'package:spnk/utils/common_strings.dart';

List<ProjectModel> projectList = [
  ProjectModel(
    bgAssetPath: quizImageAssetPath,
    projName: 'SP Quiz App',
    techStackList: [
      'Flutter',
      'Firebase',
    ],
    descList: [
      quizStr3,
      quizStr4,
    ],
    url: spQuizLink,
    isWeb: false,
  ),
  ProjectModel(
    bgAssetPath: quotesAppImageAssetPath,
    projName: 'SP Quotes App',
    techStackList: [
      'Flutter',
      'Public api',
    ],
    descList: [
      quotesAppStr1Large,
      quotesAppStr2Large,
    ],
    url: spQuotesLink,
    isWeb: false,
  ),
  ProjectModel(
    bgAssetPath: websiteImageAssetPath,
    projName: 'Portfolio WebApp',
    techStackList: [
      'Flutter',
      'Web',
    ],
    descList: [
      websiteStr1Large,
      websiteStr2Large,
    ],
    url: websiteLink,
    isWeb: true,
  ),
];
