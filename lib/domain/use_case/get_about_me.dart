import 'package:spnk/domain/entity/about_me_details.dart';
import 'package:spnk/domain/repository/repository.dart';

class GetAboutMe {
  final Repository repository;
  GetAboutMe(
    this.repository,
  );

  AboutMeDetails call() {
    return repository.getAboutMe();
  }
}
