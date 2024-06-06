// import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:spnk/utils/common_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class MacOsProjectScreen extends StatefulWidget {
  const MacOsProjectScreen({Key? key}) : super(key: key);

  @override
  _MacOsProjectScreenState createState() => _MacOsProjectScreenState();
}

class _MacOsProjectScreenState extends State<MacOsProjectScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: screenWidth > 500
                ? Text(
                      'My Projects',
                      style: TextStyle(
                        fontFamily: 'PatuaOne',
                      color: kWhiteColor,
                        fontSize: 21.0,
                    ),
                  )
                : const Text(
                    'My Projects',
                    style: TextStyle(
                      fontFamily: 'PatuaOne',
                      color: Colors.teal,
                      fontSize: 21.0,
                    ),
                  ),
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 50.0, top: 8, right: 20),
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            launch(
                              'https://play.google.com/store/apps/details?id=com.sptpra.spquotes',
                            );
                          },
                          child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.teal,
                            ),
                            child: Align(
                              child: Text(
                                'SP \nQuotes',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontFamily: 'Gugi',
                                  color: kWhiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50.0, top: 8),
                      child: Text(
                        'A simple quotes listing app',
                        style: TextStyle(
                          fontFamily: 'PatuaOne',
                          color: Colors.teal,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0, top: 8),
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            launch(
                              'https://play.google.com/store/apps/details?id=com.sptpra.spquiz',
                            );
                          },
                          child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.teal,
                            ),
                            child: Align(
                              child: Text(
                                'SP \nQuiz',
                                style: TextStyle(
                                  fontSize: 50,
                                  fontFamily: 'Gugi',
                                  color: kWhiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50.0, top: 8),
                      child: Text(
                        'A simple Quiz app',
                        style: TextStyle(
                          fontFamily: 'PatuaOne',
                          color: Colors.teal,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
