import 'package:spnk/data/model/about_me_details_model.dart';
import 'package:spnk/data/model/contact_details_model.dart';
import 'package:spnk/data/model/experience_details_model.dart';
import 'package:spnk/data/model/project_details_model.dart';
import 'package:spnk/utils/string_constants.dart';

List<ProjectDetailsModel> projectList = [
  ProjectDetailsModel(
    // bgAssetPath: quizImageAssetPath,
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
  ProjectDetailsModel(
    // bgAssetPath: quotesAppImageAssetPath,
    projName: 'SP Quotes App',
    techStackList: [
      'Flutter',
      'Public api',
    ],
    descList: [
      quotesAppStr1,
      quotesAppStr2,
      quotesAppStr3,
    ],
    url: spQuotesLink,
    isWeb: false,
  ),
  ProjectDetailsModel(
    // bgAssetPath: websiteImageAssetPath,
    projName: 'Portfolio WebApp',
    techStackList: [
      'Flutter',
      'Web',
    ],
    descList: [
      websiteStr1,
      websiteStr2,
      websiteStr3,
      websiteStr4,
      websiteStr5,
    ],
    url: websiteLink,
    isWeb: true,
  ),
];

List<ContactDetailsModel> contactDetailsList = [
  ContactDetailsModel(
    details: addressText,
    iconName: 'home',
    title: 'Address',
    index: 0,
    type: 'location',
    link:
        'https://www.google.com/maps/search/?api=1&query=9.9482885,76.3480163',
  ),
  ContactDetailsModel(
    details: mobileNumberText,
    iconName: 'call',
    title: 'Mobile',
    index: 1,
    type: 'mobile',
    link: whatsappWebLink,
  ),
  ContactDetailsModel(
    details: emailText,
    iconName: 'email',
    title: 'Email ',
    index: 2,
    type: 'email',
    link: 'mailto:$emailText',
  ),
];

List<ExperienceDetailsModel> expDetailsList = [
  ExperienceDetailsModel(
    title: 'Programmer Trainee',
    order: 0,
    detailsList: [
      'Java, Postgres',
      "Client Visit",
    ],
    orgName: 'Bayasys Infotech Pvt Ltd',
    startDate: '07/2019',
    endDate: "09/2020",
  ),
  ExperienceDetailsModel(
    title: 'Flutter Developer',
    order: 1,
    detailsList: [
      'Flutter Team Lead',
      'RESTfull api integretion',
      'Firebase SDK',
      'Push Notifications',
    ],
    orgName: 'Indbytes Technologies Pvt Ltd',
    startDate: '12/2020',
    endDate: "05/2023",
  ),
  ExperienceDetailsModel(
    title: 'Consultant Mobile app Developer',
    order: 2,
    detailsList: [
      'Flutter Team Lead',
      'App Flavoring',
      'Offline caching using Hive DB',
      'Push Notifications',
    ],
    orgName: 'Invenics Services India Pvt Ltd',
    startDate: '05/2023',
    endDate: "07/2024",
  ),
];

AboutMeDetailsModel aboutMeDetailsContent = AboutMeDetailsModel(
  content: """
 Hello! I'm a passionate Flutter developer with 3.5 years of experience crafting seamless, cross-platform applications that delight users and solve real-world problems. My journey in software development is driven by a relentless curiosity and a commitment to learning new technologies and methodologies.
 Beyond the world of coding, I'm a fitness enthusiast dedicated to maintaining a balanced and healthy lifestyle. As a proud felintrovert, I cherish my moments of solitude with my feline companions, finding inspiration and creativity in these quiet times.
 I'm always eager to explore new ideas and enhance my skill set, continuously pushing the boundaries of what's possible with Flutter. Let's connect and build something amazing together!""",
);
