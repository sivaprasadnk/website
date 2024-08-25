import 'package:flutter/material.dart';
import 'package:spnk/domain/entity/contact_details.dart';
import 'package:spnk/utils/common_colors.dart';
import 'package:spnk/utils/extensions/context_extension.dart';
import 'package:spnk/utils/extensions/string_extensions.dart';

class ContactContainer extends StatefulWidget {
  const ContactContainer({
    super.key,
    required this.contactDetails,
  });

  final ContactDetails contactDetails;

  @override
  State<ContactContainer> createState() => _ContactContainerState();
}

class _ContactContainerState extends State<ContactContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, right: 20),
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            _isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            _isHovered = false;
          });
        },
        child: Material(
          elevation: _isHovered ? 15 : 0,
          shadowColor: _isHovered ? context.shadowColor : kTransparentColor,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: context.isLargeDevice ? 350 : double.infinity,
            height: 265,
            decoration: BoxDecoration(
              color: context.scaffoldColor,
              border: Border.all(
                color: _isHovered || context.isMobileDevice
                    ? context.primaryColor
                    : context.scaffoldColor,
              ),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 75),
                Icon(
                  widget.contactDetails.iconName.iconFromString,
                  size: 60,
                  color: context.primaryColor,
                ),
                const SizedBox(height: 20),
                Text(
                  widget.contactDetails.details,
                  style: context.displaySmall.copyWith(
                    color: context.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
