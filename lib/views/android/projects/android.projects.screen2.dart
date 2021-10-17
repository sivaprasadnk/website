import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/route_provider.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class AndroidProjects extends StatefulWidget {
  @override
  _AndroidProjectsState createState() => _AndroidProjectsState();
}

class _AndroidProjectsState extends State<AndroidProjects> {
  @override
  Widget build(BuildContext context) {
    // double menuFontSize = 35;
    var screenwidth = MediaQuery.of(context).size.width;
    var menuSelectedCheck =
        Provider.of<RouteProvider>(context, listen: true).menuSelected as bool;
    debugPrint('...@@456 @menu menuSelectedCheck..$menuSelectedCheck');
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, right: 20),
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      Provider.of<RouteProvider>(context, listen: false)
                          .setMenuSelected(check: true);
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 50),
            child: Text(
              'My Projects',
              style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                // color: Colors.,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
          ),
          LiveList(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(0),
            showItemInterval: const Duration(milliseconds: 50),
            showItemDuration: const Duration(milliseconds: 150),
            itemCount: 6,
            itemBuilder: animationItemBuilder((index) {
              switch (index) {
                case 0:
                  return TitleText(title: 'SP Quotes App');
                case 1:
                  return DescriptionText(
                      description: 'A Simple Quotes listing app');
                case 2:
                  return GooglePlayButton(
                    url: spQuotesLink,
                    screenWidth: screenwidth,
                  );
                case 3:
                  return TitleText(title: 'SP Quiz App');
                case 4:
                  return DescriptionText(
                    description:
                        'A Quiz App with various categories ,and cool animations for each element on screen ',
                  );
                case 5:
                  return GooglePlayButton(
                    screenWidth: screenwidth,
                    url: spQuizLink,
                  );
              }

              return SizedBox.shrink();
            }),
          ),
        ],
      ),
    );
  }

  Widget Function(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) animationItemBuilder(
    Widget Function(int index) child, {
    EdgeInsets padding = EdgeInsets.zero,
  }) =>
      (
        BuildContext context,
        int index,
        Animation<double> animation,
      ) =>
          FadeTransition(
            opacity: Tween<double>(
              begin: 0,
              end: 1,
            ).animate(animation),
            child: SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0, -0.1),
                end: Offset.zero,
              ).animate(animation),
              child: Padding(
                padding: padding,
                child: child(index),
              ),
            ),
          );
}

class GooglePlayButton extends StatelessWidget {
  final double screenWidth;
  final String url;
  const GooglePlayButton({required this.screenWidth, required this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 40, right: screenWidth * 0.32, top: 20),
      child: GestureDetector(
        onTap: () {
          launch(url);
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/google-play.png',
                  height: 50,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'GET IT ON',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Google Play',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
