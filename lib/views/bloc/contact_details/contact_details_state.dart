import 'package:equatable/equatable.dart';
import 'package:spnk/data/contact_model.dart';

class ContactDetailsState extends Equatable {
  final List<ContactDetailsModel> contactDetailList;

  const ContactDetailsState({
    this.contactDetailList = const [],
  });

  ContactDetailsState copyWith({List<ContactDetailsModel>? details}) {
    return ContactDetailsState(
      contactDetailList: details ?? contactDetailList,
    );
  }

  @override
  List<Object?> get props => [contactDetailList];
}
