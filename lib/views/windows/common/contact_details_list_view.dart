import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';
import 'package:spnk/views/bloc/contact_details/contact_details_bloc.dart';
import 'package:spnk/views/bloc/contact_details/contact_details_state.dart';

class ContactDetailsListView extends StatelessWidget {
  const ContactDetailsListView({
    Key? key,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactDetailsBloc, ContactDetailsState>(
      builder: (_, state) {
        return Padding(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: state.contactDetailList.map((e) {
              return Padding(
                padding: EdgeInsets.only(bottom: context.screenHeight * 0.03),
                child: FadeInRight(
                  child: SizedBox(
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
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
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