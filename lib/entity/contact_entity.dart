import 'package:flutter/material.dart';
import 'package:spnk/data/contact_model.dart';
import 'package:spnk/utils/common_strings.dart';

List<ContactModel> contactList = [
  ContactModel(
    details: addressText,
    icon: Icons.home,
    title: 'Address',
    index: 0,
  ),
  ContactModel(
    details: mobileNumberText,
    icon: Icons.call,
    title: 'Mobile',
    index: 1,
  ),
  ContactModel(
    details: emailText,
    icon: Icons.email,
    title: 'Email ',
    index: 2,
  ),
];
