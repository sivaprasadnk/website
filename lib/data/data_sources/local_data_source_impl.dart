import 'package:spnk/data/data_sources/local_data_source.dart';
import 'package:spnk/data/model/contact_details_model.dart';
import 'package:spnk/data/model/experience_details_model.dart';
import 'package:spnk/data/model/project_details_model.dart';
import 'package:spnk/utils/common_strings.dart';

class LocalDataSourceImpl implements LocalDataSource {
  LocalDataSourceImpl();

  @override
  List<ExperienceDetailsModel> getExperienceDetails() {
    return [
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
          'Offline caching',
          'Push Notifications',
        ],
        orgName: 'Invenics Services India Pvt Ltd',
        startDate: '05/2023',
        endDate: "07/2024",
      ),
    ];
  }

  @override
  List<ContactDetailsModel> getContactDetails() {
    return [
      ContactDetailsModel(
        details: addressText,
        iconName: 'home',
        title: 'Address',
        index: 0,
      ),
      ContactDetailsModel(
        details: mobileNumberText,
        iconName: 'call',
        title: 'Mobile',
        index: 1,
      ),
      ContactDetailsModel(
        details: emailText,
        iconName: 'email',
        title: 'Email ',
        index: 2,
      ),
    ];
  }

  @override
  List<ProjectDetailsModel> getProjectDetails() {
    return [
      ProjectDetailsModel(
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
      ProjectDetailsModel(
        bgAssetPath: quotesAppImageAssetPath,
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
          websiteStr4,
          websiteStr5,
        ],
        url: websiteLink,
        isWeb: true,
      ),
    ];
  }
}
