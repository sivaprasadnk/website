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

class _AndroidMenuScreenState extends State<AndroidMenuScreen>
    with SingleTickerProviderStateMixin {
  // double topPosition = -250;

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

  late AnimationController _animationController;
  late Animation _animation;
  // late Animation _animation1;
  var rightPos;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation =
        Tween<double>(begin: 350, end: 370).animate(_animationController);
    // _animation1 = IntTween(begin: 350, end: 370).animate(_animationController);
    _animationController.forward();
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            right: double.tryParse((_animation.value).toString())?.abs(),
            top: 0,
            child: Align(
              alignment: Alignment.topRight,
              child: AnimatedOpacity(
                opacity: 1,
                duration: Duration(seconds: 2),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: RotationTransition(
                    turns: new AlwaysStoppedAnimation(_animation.value / 360),
                    child: Image(
                      image: AssetImage('assets/images/ball1.png'),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            right: 90,
            top: -30,
            child: Align(
              alignment: Alignment.topRight,
              child: AnimatedOpacity(
                opacity: 1,
                // opacity: _animationController.value,
                duration: Duration(seconds: 2),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Image(
                    image: AssetImage('assets/images/ball2.png'),
                  ),
                ),
              ),
            ),
          ),
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
