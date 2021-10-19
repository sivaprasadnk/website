import 'package:animate_do/animate_do.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/route_provider.dart';
import 'package:spnk/utils/common_strings.dart';

class AndroidMenuScreen extends StatefulWidget {
  const AndroidMenuScreen({Key? key}) : super(key: key);

  @override
  _AndroidMenuScreenState createState() => _AndroidMenuScreenState();
}

class _AndroidMenuScreenState extends State<AndroidMenuScreen> {
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

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    double menuFontSize = 25;
    return Container(
      height: screenHeight,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInLeftBig(
                child: Container(
                  padding: const EdgeInsets.only(left: 36),
                  child: CircleAvatar(
                    radius: screenWidth * 0.25,
                    backgroundImage: AssetImage(
                      proPicAssetPath,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                // height: screenHeight * 0.5,
                child: LiveList(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(16),
                  showItemInterval: const Duration(milliseconds: 50),
                  showItemDuration: const Duration(milliseconds: 150),
                  itemCount: 4,
                  itemBuilder: animationItemBuilder((index) {
                    switch (index) {
                      case 0:
                        return GestureDetector(
                          onTap: () {
                            Provider.of<RouteProvider>(context, listen: false)
                                .setMenuSelected(check: false);
                            Provider.of<RouteProvider>(context, listen: false)
                                .setScreen(name: 'Home');
                          },
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: ListTile(
                                leading: Icon(Icons.home, color: Colors.white),
                                title: Text(
                                  'Home',
                                  style: TextStyle(
                                      fontFamily: 'PlayfairDisplay',
                                      // color: Colors.,
                                      fontWeight: FontWeight.bold,
                                      fontSize: menuFontSize,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        );
                      case 1:
                        return GestureDetector(
                          onTap: () {
                            debugPrint('...@@123');
                            Provider.of<RouteProvider>(context, listen: false)
                                .setMenuSelected(check: false);
                            Provider.of<RouteProvider>(context, listen: false)
                                .setScreen(name: 'ContactMe');
                          },
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: ListTile(
                                leading: Icon(Icons.call, color: Colors.white),
                                title: Text(
                                  'Contact Me',
                                  style: TextStyle(
                                      fontFamily: 'PlayfairDisplay',
                                      // color: Colors.,
                                      fontWeight: FontWeight.bold,
                                      fontSize: menuFontSize,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        );
                      case 2:
                        return Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: ListTile(
                              onTap: () {
                                Provider.of<RouteProvider>(context,
                                        listen: false)
                                    .setMenuSelected(check: false);
                                Provider.of<RouteProvider>(context,
                                        listen: false)
                                    .setScreen(name: 'Experience');
                              },
                              leading: Icon(Icons.work, color: Colors.white),
                              title: Text(
                                'Experience',
                                style: TextStyle(
                                  fontFamily: 'PlayfairDisplay',
                                  // color: Colors.,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: menuFontSize,
                                ),
                              ),
                            ),
                          ),
                        );
                      case 3:
                        return Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: ListTile(
                              onTap: () {
                                Provider.of<RouteProvider>(context,
                                        listen: false)
                                    .setMenuSelected(check: false);
                                Provider.of<RouteProvider>(context,
                                        listen: false)
                                    .setScreen(name: 'MyProjects');
                              },
                              leading: Icon(Icons.apps, color: Colors.white),
                              title: Text(
                                'My Projects',
                                style: TextStyle(
                                    fontFamily: 'PlayfairDisplay',
                                    // color: Colors.,
                                    fontWeight: FontWeight.bold,
                                    fontSize: menuFontSize,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        );
                    }
                    return Container();
                  }),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ],
      ),
    );
  }
}
