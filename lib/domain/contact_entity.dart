import 'package:flutter/material.dart';
import 'package:spnk/data/contact_model.dart';
import 'package:spnk/utils/common_strings.dart';

List<ContactDetailsModel> contactList = [
  ContactDetailsModel(
    details: addressText,
    icon: Icons.home,
    title: 'Address',
    index: 0,
  ),
  ContactDetailsModel(
    details: mobileNumberText,
    icon: Icons.call,
    title: 'Mobile',
    index: 1,
  ),
  ContactDetailsModel(
    details: emailText,
    icon: Icons.email,
    title: 'Email ',
    index: 2,
  ),
];
