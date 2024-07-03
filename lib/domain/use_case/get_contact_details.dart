import 'package:spnk/domain/entity/contact_details.dart';
import 'package:spnk/domain/repository/repository.dart';

class GetContactDetails {
  final Repository repository;
  GetContactDetails({
    required this.repository,
  });

  List<ContactDetails> call() {
    return repository.getContactDetails();
  }
}
