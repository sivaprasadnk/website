import 'package:flutter/material.dart';

class ContactModel {
  IconData icon;
  String details;
  String title;
  int index;
  ContactModel({
    required this.title,
    required this.details,
    required this.icon,
    required this.index,
  });
}
