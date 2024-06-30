import 'package:equatable/equatable.dart';
import 'package:spnk/domain/entity/contact_details.dart';

class ContactDetailsState extends Equatable {
  final List<ContactDetails> contactDetailList;

  const ContactDetailsState({
    this.contactDetailList = const [],
  });

  ContactDetailsState copyWith({List<ContactDetails>? details}) {
    return ContactDetailsState(
      contactDetailList: details ?? contactDetailList,
    );
  }

  @override
  List<Object?> get props => [contactDetailList];
}
