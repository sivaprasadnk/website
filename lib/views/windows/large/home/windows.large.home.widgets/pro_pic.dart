import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spnk/utils/common_strings.dart';

class ProPic extends StatelessWidget {
  const ProPic({
    Key? key,
    required this.showPic,
    required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;
  final bool showPic;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: screenWidth / 1.8,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.23,
            ),
            // ProPicMediumWithBlob()
            // ProPicLargeWithBlob()
            AnimatedOpacity(
              opacity: showPic ? 1 : 0,
              duration: Duration(milliseconds: 500),
              child: Stack(
                children: [
                  Lottie.asset(blobLottieAssetPath, height: 350),
                  Padding(
                    padding: const EdgeInsets.all(60.0),
                    child: CircleAvatar(
                      radius: 115,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(proPicAssetPath),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
