import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/dialog_provider.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/views/windows/hover_extensions.dart';
import 'package:spnk/views/windows/medium/projects/app.details/google.play.button.dart';
import 'package:spnk/views/windows/medium/projects/view.more.container.dart';
import 'package:spnk/views/windows/small/projects/app.summary/project.title.dart';
import 'package:spnk/views/windows/small/projects/app.summary/text.container.dart';
import 'package:url_launcher/url_launcher.dart';

class QuizTitleText extends StatefulWidget {
  const QuizTitleText({
    Key? key,
  }) : super(key: key);

  @override
  State<QuizTitleText> createState() => _QuizTitleTextState();
}

class _QuizTitleTextState extends State<QuizTitleText> {
  @override
  Widget build(BuildContext context) {
    return const TextContainer().blurred(
      overlay: Padding(
        padding: const EdgeInsets.only(
          left: 20,
        ),
        child: Row(
          children: [
            const ProjectTitle(title: 'SP Quiz App'),
            Expanded(
              child: const Text(""),
            ),
            GestureDetector(
              onTap: () {
                Provider.of<DialogProvider>(context, listen: false)
                    .updateDialogOpenStatus(status: true);

                showAnimatedDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context1) {
                    return Dialog(
                      backgroundColor: Colors.transparent,
                      child: DetailsContainer(
                        desc1: quizStr3,
                        desc2: quizStr4,
                        link: spQuizLink,
                        title: 'SP Quiz App',
                      ),
                    );
                  },
                  animationType: DialogTransitionType.size,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(seconds: 1),
                );
              },
              child: const ViewMoreContainer(),
            ),
          ],
        ),
      ),
      colorOpacity: 0.3,
      alignment: Alignment.topLeft,
      borderRadius: const BorderRadius.only(
        // topLeft: Radius.circular(10),
        // topRight: Radius.circular(10),
        bottomRight: Radius.circular(10),
        bottomLeft: Radius.circular(10),
      ),
    );
  }
}

class DetailsContainer extends StatelessWidget {
  const DetailsContainer({
    Key? key,
    required this.desc1,
    required this.desc2,
    required this.link,
    required this.title,
  }) : super(key: key);
  final String desc1;
  final String desc2;
  final String link;
  final String title;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 30, right: 5),
          width: 400,
          height: 330,
          // padding: const EdgeInsets.only(right: 30),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/mesh1.jpg',
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            // color: Color.fromARGB(255, 9, 71, 122),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 20),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'PlayfairDisplay',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.blue,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 3,
                          ),
                          child: Text(
                            'Flutter',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.yellow,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 3,
                          ),
                          child: Text(
                            'Firebase',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                child: Text(
                  desc1,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  desc2,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                child: GooglePlayButton(
                  screenWidth: screenWidth * 0.4,
                  url: link,
                ).showCursorOnHover,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        Positioned.fill(
          top: 15,
          child: Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 35,
                width: 35,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: const Icon(
                  Icons.close,
                  size: 18,
                  color: Colors.white,
                ).showCursorOnHover,
              ),
            ),
          ),
        )
      ],
    );
  }
}

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
      child: Container(
        height: 50,
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
                height: 31,
                // width: 10,
              ),
            ),
            const SizedBox(
              width: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'GET IT ON',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8, bottom: 5),
                    child: Text(
                      'Google Play',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
