import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/route_provider.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class AndroidContactMeScreen extends StatefulWidget {
  @override
  _AndroidContactMeScreenState createState() => _AndroidContactMeScreenState();
}

class _AndroidContactMeScreenState extends State<AndroidContactMeScreen> {
  late Widget fbPng;
  late Widget waPng;
  late Widget instaPng;
  late Widget linkedInPng;

  @override
  Widget build(BuildContext context) {
    double iconSize = 30;
    var menuSelectedCheck =
        Provider.of<RouteProvider>(context, listen: true).menuSelected as bool;
    debugPrint('...@@456 @menu menuSelectedCheck..$menuSelectedCheck');
    fbPng = Image.asset(fbPngAssetName, height: iconSize);
    waPng = Image.asset(whatsappPngeAssetName, height: iconSize);
    instaPng = Image.asset(instaPngImageName, height: iconSize);
    linkedInPng = Image.asset(linkedInAssetName,
        height: iconSize, color: Colors.blue[900]);
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
              'Contact Me',
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
            padding: const EdgeInsets.all(16),
            physics: NeverScrollableScrollPhysics(),
            showItemInterval: const Duration(milliseconds: 50),
            showItemDuration: const Duration(milliseconds: 150),
            itemCount: 8,
            itemBuilder: animationItemBuilder((index) {
              switch (index) {
                case 0:
                  return TitleText(title: 'Address');
                case 1:
                  return DescriptionText(
                      description:
                          'Prasadam, Nadama, \nTripunithura, Ernakulam, Kerala .');
                case 2:
                  return TitleText(title: 'Mobile');
                case 3:
                  return DescriptionText(description: '8086028340');
                case 4:
                  return TitleText(title: 'E-mail');
                case 5:
                  return DescriptionText(
                      description: 'sivaprasadnk123@gmail.com');
                case 6:
                  return TitleText(title: 'Social Media');
                case 7:
                  return Padding(
                    padding: const EdgeInsets.only(top: 15, left: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          child: fbPng,
                          onTap: () {
                            launch(fbLink);
                          },
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          child: instaPng,
                          onTap: () {
                            launch(instaLink);
                          },
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          child: waPng,
                          onTap: () {
                            if (defaultTargetPlatform == TargetPlatform.iOS) {
                              launch(whatsappWebLink);
                            } else {
                              launch(whatsappAndroidLink);
                            }
                          },
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          child: linkedInPng,
                          onTap: () {
                            launch(linkedInLink);
                          },
                        ),
                      ],
                    ),
                  );
                //  case 7: return DescriptionText(description: description)
              }

              return Container();
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
