import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spnk/utils/extensions/context_extension.dart';
import 'package:spnk/views/bloc/contact_details/contact_details_bloc.dart';
import 'package:spnk/views/bloc/contact_details/contact_details_state.dart';
import 'package:spnk/views/screens/contact_me/contact_item.dart';

class ContactDetailsListView extends StatelessWidget {
  const ContactDetailsListView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactDetailsBloc, ContactDetailsState>(
      builder: (_, state) {
        return SizedBox(
          // height: context.isLargeDevice ? 460 : context.screenHeight - 200,
          height: context.isLargeDevice ? 460 : 480,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: state.contactDetailList.map(
              (e) {
                return ContactItem(contactDetails: e);
              },
            ).toList(),
          ),
        );
      },
    );
  }
}
