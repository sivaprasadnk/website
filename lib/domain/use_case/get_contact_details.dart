import 'package:spnk/data/repository/repository_impl.dart';
import 'package:spnk/domain/entity/contact_details.dart';

class GetContactDetails {
  final RepositoryImpl repository;
  GetContactDetails({
    required this.repository,
  });

  List<ContactDetails> call() {
    return repository.getContactDetails();
  }
}
