import 'package:flutter/material.dart';
import 'package:spnk/views/windows/common/exp_details_list_view.dart';

class WindowsMediumExperienceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.13),
          child: SizedBox(
            width: screenWidth * 0.78,
            child: ExpDetailsListView(
              padding: EdgeInsets.only(
                left: screenWidth * 0.2,
                top: screenHeight * .05,
              ),
            ),
          ),
        ),
        // Positioned.fill(
        //   child: Align(
        //     alignment: Alignment.bottomRight,
        //     child: AnimatedOpacity(
        //       duration: const Duration(seconds: 2),
        //       opacity: showLottie ? 1 : 0,
        //       child: Image.asset(
        //         'assets/images/dash/dash2.png',
        //         height: 280,
        //       ),
        //     ),
        //   ),
        // )
      ],
    );
  }
}
