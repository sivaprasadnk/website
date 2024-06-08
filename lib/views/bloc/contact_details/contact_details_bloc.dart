import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spnk/domain/contact_entity.dart';
import 'package:spnk/views/bloc/contact_details/contact_details_event.dart';
import 'package:spnk/views/bloc/contact_details/contact_details_state.dart';

class ContactDetailsBloc
    extends Bloc<ContactDetailsEvent, ContactDetailsState> {
  ContactDetailsBloc() : super(const ContactDetailsState()) {
    on(_getContactDetails);
  }

  void _getContactDetails(
    GetContactDetails event,
    Emitter<ContactDetailsState> emit,
  ) {
    emit(state.copyWith(details: contactList));
  }
}
