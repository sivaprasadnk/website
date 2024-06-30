import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spnk/domain/use_case/get_contact_details.dart';
import 'package:spnk/views/bloc/contact_details/contact_details_event.dart';
import 'package:spnk/views/bloc/contact_details/contact_details_state.dart';

class ContactDetailsBloc
    extends Bloc<ContactDetailsEvent, ContactDetailsState> {
  final GetContactDetails getContactDetails;
  ContactDetailsBloc(this.getContactDetails)
      : super(const ContactDetailsState()) {
    on(_getContactDetails);
  }

  void _getContactDetails(
    FetchContactDetails event,
    Emitter<ContactDetailsState> emit,
  ) {
    final list = getContactDetails.call();
    emit(state.copyWith(details: list));
  }
}
