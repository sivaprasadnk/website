import 'package:animate_do/animate_do.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';
import 'package:url_launcher/url_launcher.dart';



class WinddowsGooglePlayButton extends StatelessWidget {
  final double screenWidth;
  final String url;
  const WinddowsGooglePlayButton({
    required this.screenWidth,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launch(url);
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                'assets/images/google-play.png',
                height: 35,
                // width: 10,
              ),
            ),
            const SizedBox(
              width: 1,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5, left: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'GET IT ON',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8, bottom: 8),
                    child: Text(
                      'Google Play',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      ),
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





class TitleText extends StatelessWidget {
  final String title;
  const TitleText({required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 30),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: kRajdhaniFontFamily,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}





class ProPicMediumWithBlob extends StatefulWidget {
  final double height;
  // final double leftPadding;
  // final double bottomPadding;
  const ProPicMediumWithBlob({
    required this.height,
    // required this.bottomPadding,
    // required this.leftPadding,
  });

  @override
  _ProPicMediumWithBlobState createState() => _ProPicMediumWithBlobState();
}

class _ProPicMediumWithBlobState extends State<ProPicMediumWithBlob> {
  bool showProPicWithBlob = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      if (mounted) {
        setState(() {
          showProPicWithBlob = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 900),
      opacity: showProPicWithBlob ? 1 : 0,
      child: Image.asset(
        'assets/images/picWithBlob.png',
        // height: 350,
        width: widget.height,
      ),
      // child: Blob.fromID(
      //   id: const ['16-7-5840'],
      //   styles: BlobStyles(
      //     color: Colors.cyanAccent.shade700,
      //   ),
      //   size: widget.height,
      //   child: Padding(
      //     padding: EdgeInsets.only(
      //       bottom: widget.bottomPadding,
      //       left: widget.leftPadding,
      //       right: 15,
      //       // top: 10,
      //     ),
      //     child: Image.asset(
      //       'assets/images/propiccc.png',
      //       height: widget.height,
      //     ),
      //   ),
      // ),
    );
  }
}

class WindowsRightFooter extends StatelessWidget {
  const WindowsRightFooter({
    Key? key,
    required this.size,
  }) : super(key: key);
  final double size;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          ' Made with ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size,
            color: Colors.grey,
          ),
        ),
        const AvatarGlow(
          glowColor: Colors.grey,
          endRadius: 20.0,
          showTwoGlows: false,
          child: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ),
        // CircleAvatar(
        //   child: Icon(
        //     Icons.favorite,
        //     color: Colors.red,
        //   ),
        // ),
        Text(
          ' in ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size,
            color: Colors.grey,
          ),
        ),
        FlutterLogo(
          size: size,
        ),
        Text(
          ' Flutter  ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class AndroidRightFooter extends StatelessWidget {
  const AndroidRightFooter({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            ' Made with ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
          AvatarGlow(
            glowColor: Colors.grey,
            endRadius: 20.0,
            showTwoGlows: false,
            child: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
          Text(
            ' in ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
          FlutterLogo(
            size: 15,
          ),
          Text(
            ' Flutter  ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class WindowsLeftFooter extends StatelessWidget {
  const WindowsLeftFooter({Key? key, required this.size}) : super(key: key);
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      'Copyright © 2024 Sivaprasad NK .',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: size,
        fontFamily: 'Roboto',
        color: Colors.grey,
      ),
    );
  }
}

class NameLogo extends StatelessWidget {
  const NameLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('SP');
  }
}


class ProPicWithBlobLottie extends StatelessWidget {
  const ProPicWithBlobLottie({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Lottie.asset(blobLottieAssetPath, height: 280),
        const Padding(
          padding: EdgeInsets.all(40.0),
          child: CircleAvatar(
            radius: 95,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(proPicAssetPath),
          ),
        ),
      ],
    );
  }
}

class RobotLottie extends StatelessWidget {
  const RobotLottie({
    Key? key,
    required this.showLottie,
    required this.screenWidth,
  }) : super(key: key);

  final bool showLottie;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(seconds: 1),
      opacity: showLottie ? 1 : 0,
      child: Container(
        margin: EdgeInsets.only(left: screenWidth * 0.15),
        child: Lottie.asset(
          'assets/lotties/robot_hello.json',
          height: 195,
        ),
      ),
    );
  }
}

class DashImageMedium extends StatelessWidget {
  const DashImageMedium({
    Key? key,
    required this.showLottie,
    required this.screenWidth,
  }) : super(key: key);

  final bool showLottie;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(seconds: 1),
      opacity: showLottie ? 1 : 0,
      child: Container(
        margin: EdgeInsets.only(left: screenWidth * 0.12),
        child: Image.asset(
          'assets/images/dash/dash1.png',
          height: 220,
        ),
      ),
    );
  }
}

class AndroidDashImage extends StatelessWidget {
  const AndroidDashImage({
    Key? key,
    required this.dashImage,
  }) : super(key: key);

  final String dashImage;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Image.asset(
        'assets/images/dash/$dashImage.png',
        height: context.screenHeight * 0.18,
      ),
    );
  }
}
