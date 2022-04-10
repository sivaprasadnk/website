import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/route_provider.dart';

class AndroidMenuScreen extends StatefulWidget {
  const AndroidMenuScreen({Key? key}) : super(key: key);

  @override
  _AndroidMenuScreenState createState() => _AndroidMenuScreenState();
}

class _AndroidMenuScreenState extends State<AndroidMenuScreen>
    with SingleTickerProviderStateMixin {
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
                begin: const Offset(0, -0.1),
                end: Offset.zero,
              ).animate(animation),
              child: Padding(
                padding: padding,
                child: child(index),
              ),
            ),
          );

  bool showLottie = false;
  var rightPos;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then((value) {
      setState(() {
        showLottie = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    final double menuFontSize = screenWidth * 0.07;
    return SizedBox(
      height: screenHeight,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedOpacity(
                opacity: showLottie ? 1 : 0,
                duration: const Duration(seconds: 2),
                child: Container(
                  padding: EdgeInsets.only(left: screenWidth * .2, top: 30),
                  child: Image.asset(
                    'assets/images/exp_icon.png',
                    height: 250,
                  ),
                ),
              ),
              // FadeInLeftBig(
              //   child: Container(
              //     padding: const EdgeInsets.only(left: 36),
              //     child: CircleAvatar(
              //       radius: screenWidth * 0.25,
              //       backgroundImage: AssetImage(
              //         proPicAssetPath,
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 25,
              ),
              Container(
                child: LiveList(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(16),
                  showItemInterval: const Duration(milliseconds: 50),
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
                                leading: Icon(
                                  Icons.home,
                                  color: Colors.white,
                                  size: menuFontSize,
                                ),
                                title: Text(
                                  'Home',
                                  style: TextStyle(
                                    fontFamily: 'PlayfairDisplay',
                                    fontWeight: FontWeight.bold,
                                    fontSize: menuFontSize,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      case 3:
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
                                leading: Icon(
                                  Icons.call,
                                  color: Colors.white,
                                  size: menuFontSize,
                                ),
                                title: Text(
                                  'Contact Me',
                                  style: TextStyle(
                                    fontFamily: 'PlayfairDisplay',
                                    fontWeight: FontWeight.bold,
                                    fontSize: menuFontSize,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      case 1:
                        return Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: ListTile(
                              onTap: () {
                                Provider.of<RouteProvider>(
                                  context,
                                  listen: false,
                                ).setMenuSelected(check: false);
                                Provider.of<RouteProvider>(
                                  context,
                                  listen: false,
                                ).setScreen(name: 'Experience');
                              },
                              leading: Icon(
                                Icons.work,
                                color: Colors.white,
                                size: menuFontSize,
                              ),
                              title: Text(
                                'Experience',
                                style: TextStyle(
                                  fontFamily: 'PlayfairDisplay',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: menuFontSize,
                                ),
                              ),
                            ),
                          ),
                        );
                      case 2:
                        return SizedBox(
                          width: screenWidth * .1,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: ListTile(
                              onTap: () {
                                Provider.of<RouteProvider>(
                                  context,
                                  listen: false,
                                ).setMenuSelected(check: false);
                                Provider.of<RouteProvider>(
                                  context,
                                  listen: false,
                                ).setScreen(name: 'MyProjects');
                              },
                              leading: Icon(
                                Icons.apps,
                                color: Colors.white,
                                size: menuFontSize,
                              ),
                              title: Text(
                                'My Projects',
                                style: TextStyle(
                                  fontFamily: 'PlayfairDisplay',
                                  fontWeight: FontWeight.bold,
                                  fontSize: menuFontSize,
                                  color: Colors.white,
                                ),
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
                height: screenHeight * 0.15,
              )
            ],
          ),
        ],
      ),
    );
  }
}
