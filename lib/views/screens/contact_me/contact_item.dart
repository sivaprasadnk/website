import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:spnk/domain/entity/contact_details.dart';
import 'package:spnk/utils/extensions/context_extension.dart';
import 'package:spnk/utils/extensions/string_extensions.dart';
import 'package:spnk/utils/extensions/widget_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactItem extends StatefulWidget {
  const ContactItem({super.key, required this.contactDetails});
  final ContactDetails contactDetails;

  @override
  State<ContactItem> createState() => _ContactItemState();
}

class _ContactItemState extends State<ContactItem> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovering = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovering = false;
        });
      },
      child: FadeInRight(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 25,
          ),
          child: GestureDetector(
            onTap: () async {
              await launchUrl(Uri.parse(widget.contactDetails.link));
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  widget.contactDetails.iconName.iconFromString,
                  color: isHovering ? Colors.cyan : context.primaryColor,
                ),
                const SizedBox(width: 20),
                Text(
                  widget.contactDetails.details,
                  style: context.displaySmall.copyWith(
                    color: isHovering ? Colors.cyan : context.primaryColor,
                  ),
                ),
              ],
            ),
          ).showCursorOnHover,
        ),
      ),
    );
  }
}
