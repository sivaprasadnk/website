import 'package:flutter/material.dart';
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';
import 'package:spnk/views/windows/common/contact_details_list_view.dart';
import 'package:spnk/views/windows/common/screen_image.dart';

class WindowsMediumContactMeScreen extends StatelessWidget {
  const WindowsMediumContactMeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final screenHeight = context.screenHeight;
    final screenWidth = context.screenWidth;

    return Stack(
      children: [
        SizedBox(
          width: screenWidth * 0.78,
          child: ContactDetailsListView(
            padding: EdgeInsets.only(
              top: screenHeight * .3,
              left: screenWidth * 0.15,
            ),
          ),
          
        ),
        const Positioned.fill(
          right: -50,
          child: ScreenImage(
            alignment: Alignment.bottomRight,
            height: 280,
            imagePath: 'assets/images/dash/dash4.png',
          ),
        ),
      ],
    );
  }
}
