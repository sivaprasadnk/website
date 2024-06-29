import 'package:flutter/material.dart';
import 'package:spnk/views/screens/contact_me/contact_details_list_view.dart';
import 'package:spnk/views/screens/screen_section.dart';

class ContactMeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const ScreenSection(
      title: 'Contact Me',
      details: ContactDetailsListView(),
      imageName: 'dash4',
    );
  }
}
