import 'package:flutter/material.dart';
import 'package:spnk/utils/extensions/context_extension.dart';
import 'package:spnk/views/screens/home/widgets/download_cv_btn.dart';
import 'package:spnk/views/screens/home/widgets/profile_pic.dart';

class HomeScreenSmall extends StatelessWidget {
  const HomeScreenSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.screenWidth * .15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.screenHeight * 0.2),
          const ProfilePic(width: 300),
          Text(
            "Hi,\nI 'm Sivaprasad NK .",
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: SizedBox(
                  width: context.screenWidth * 0.8,
                  child: Text(
                    'Flutter Developer and Fitness Enthusiast from Tripunithura, Kerala .',
                    style: context.displaySmall,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          const Row(
            children: [
              DownloadCvBtn(),
            ],
          ),
        ],
      ),
    );
  }
}
