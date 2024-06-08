import 'package:flutter/material.dart';

class ContactDetailsModel {
  IconData icon;
  String details;
  String title;
  int index;
  ContactDetailsModel({
    required this.title,
    required this.details,
    required this.icon,
    required this.index,
  });
}
