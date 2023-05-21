import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/dialog_provider.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/views/windows/hover_extensions.dart';
import 'package:spnk/views/windows/small/projects/app.summary/project.title.dart';
import 'package:spnk/views/windows/small/projects/app.summary/text.container.dart';
import 'package:spnk/views/windows/small/projects/app.summary/view.more.small.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioTitleTextSmall extends StatelessWidget {
  const PortfolioTitleTextSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextContainer().blurred(
      overlay: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            const ProjectTitle(title: 'Portfolio website'),
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
                  builder: (BuildContext context) {
                    return Dialog(
                      backgroundColor: Colors.transparent,
                      child: DetailsContainer(
                        desc1: websiteStr1,
                        desc2: websiteStr2,
                        link: websiteLink,
                        title: 'Portfolio Website',
                      ),
                    );
                  },
                  animationType: DialogTransitionType.size,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(seconds: 1),
                );
              },
              child: const ViewMoreContainerSmall(),
            ),
          ],
        ),
      ),
      colorOpacity: 0.3,
      alignment: Alignment.topLeft,
      borderRadius: const BorderRadius.only(
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
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 10, right: 20),
                child: VisitLinkContainer(),
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

class VisitLinkContainer extends StatelessWidget {
  const VisitLinkContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launch(websiteLink);
      },
      child: Container(
        // height: 50,
        margin: const EdgeInsets.only(left: 20, top: 4, right: 20),
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const [
              FaIcon(
                FontAwesomeIcons.externalLinkAlt,
                color: Colors.white,
              ),
              SizedBox(
                width: 1,
              ),
              Padding(
                padding: EdgeInsets.only(top: 1, left: 5),
                child: Text(
                  'Click here to visit',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
      ).showCursorOnHover,
    );
  }
}
