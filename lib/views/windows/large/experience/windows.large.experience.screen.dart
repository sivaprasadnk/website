import 'package:flutter/material.dart';
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';
import 'package:spnk/views/windows/common/exp_details_list_view.dart';
import 'package:spnk/views/windows/common/screen_image.dart';
import 'package:spnk/views/windows/large/common.widgets/section.title.dart';

class WindowsLargeExperienceScreen extends StatefulWidget {
  @override
  _WindowsLargeExperienceScreenState createState() =>
      _WindowsLargeExperienceScreenState();
}

class _WindowsLargeExperienceScreenState
    extends State<WindowsLargeExperienceScreen>
    with AutomaticKeepAliveClientMixin {
 

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: context.screenWidth * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.screenHeight * 0.2),
              const WindowsLargeSectionTitle(
                title: 'Experience',
              ),
              ExpDetailsListView(
                padding: EdgeInsets.only(
                  left: context.screenWidth * 0.5,
                  top: context.screenHeight * .05,
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          top: 100,
          left: context.screenWidth * 0.0,
          child: const ScreenImage(
            alignment: Alignment.centerLeft,
            height: 350,
            imagePath: 'assets/images/dash/dash2.png',
          ),
        ),
      ],
    );
  }
}
