import 'package:flutter/material.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/windows/hover_extensions.dart';

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
    return Container(
      width: 400,
      // padding: const EdgeInsets.only(right: 30),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        color: Color.fromARGB(255, 9, 71, 122),
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
                color: Colors.white,
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
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              desc2,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
            child: WinddowsGooglePlayButton(
              screenWidth: screenWidth * 0.4,
              url: link,
            ).showCursorOnHover,
          )
        ],
      ),
    );
  }
}
