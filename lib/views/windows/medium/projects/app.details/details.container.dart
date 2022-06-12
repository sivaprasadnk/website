import 'package:flutter/material.dart';
import 'package:spnk/views/windows/hover_extensions.dart';
import 'package:spnk/views/windows/medium/projects/app.details/close.button.dart';
import 'package:spnk/views/windows/medium/projects/app.details/description.text.dart';
import 'package:spnk/views/windows/medium/projects/app.details/google.play.button.dart';
import 'package:spnk/views/windows/medium/projects/app.details/tools.text.dart';

class DetailsContainer extends StatefulWidget {
  const DetailsContainer({
    Key? key,
    required this.desc1,
    required this.desc2,
    required this.link,
    required this.title,
    required this.isWeb,
    required this.tool2,
  }) : super(key: key);
  final String desc1;
  final String desc2;
  final String link;
  final String title;
  final String tool2;
  final bool isWeb;

  @override
  State<DetailsContainer> createState() => _DetailsContainerState();
}

class _DetailsContainerState extends State<DetailsContainer> {
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
                  widget.title,
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
                  children: const [
                    ToolsText(title: 'Flutter', bgColor: Colors.blue),
                    ToolsText(
                      title: 'Public api',
                      bgColor: Colors.yellow,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ProjectDescriptionText(description: widget.desc1),
              const SizedBox(
                height: 10,
              ),
              ProjectDescriptionText(description: widget.desc2),
              const SizedBox(
                height: 30,
              ),
              GooglePlayButton(
                screenWidth: screenWidth * 0.4,
                url: widget.link,
              ).showCursorOnHover,
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        const DialogCloseButton()
      ],
    );
  }
}