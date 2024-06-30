import 'package:flutter/material.dart';

extension StringExt on String {
  IconData get iconFromString {
    if (this == 'home') {
      return Icons.home;
    } else if (this == "call") {
      return Icons.call;
    } else if (this == 'email') {
      return Icons.email;
    }
    return Icons.home;
  }
}
