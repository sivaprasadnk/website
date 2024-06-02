import 'package:flutter/material.dart';
import 'package:spnk/data/contact_model.dart';
import 'package:spnk/utils/common_strings.dart';

List<ContactModel> contactList = [
  ContactModel(
    details: addressText,
    icon: Icons.home,
  ),
  ContactModel(
    details: mobileNumberText,
    icon: Icons.call,
  ),
  ContactModel(
    details: emailText,
    icon: Icons.email,
  ),
];
