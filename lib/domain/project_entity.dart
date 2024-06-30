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
      quizStr1,
      quizStr2,
      quizStr3,
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
      quotesAppStr1,
      quotesAppStr2,
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
      websiteStr1,
      websiteStr2,
      websiteStr3,
    ],
    url: websiteLink,
    isWeb: true,
  ),
];
