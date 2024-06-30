import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spnk/utils/extensions/context_extension.dart';
import 'package:spnk/views/bloc/contact_details/contact_details_bloc.dart';
import 'package:spnk/views/bloc/contact_details/contact_details_state.dart';

class ContactDetailsListView extends StatelessWidget {
  const ContactDetailsListView({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactDetailsBloc, ContactDetailsState>(
      builder: (_, state) {
        return SizedBox(
          // height: context.isLargeDevice ? 460 : context.screenHeight - 200,
          height: context.isLargeDevice ? 460 : 480,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: state.contactDetailList.map((e) {
              return FadeInRight(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 25,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        e.icon,
                        color: Theme.of(context).splashColor,
                      ),
                      const SizedBox(width: 20),
                      Text(
                        e.details,
                        style: context.displaySmall,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        );

      },
    );
  }
}
