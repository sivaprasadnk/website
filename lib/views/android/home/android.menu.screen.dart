import 'package:animate_do/animate_do.dart';
import 'package:animate_icons/animate_icons.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/route_provider.dart';

class AndroidMenuScreen extends StatefulWidget {
  const AndroidMenuScreen({Key? key}) : super(key: key);

  @override
  _AndroidMenuScreenState createState() => _AndroidMenuScreenState();
}

class _AndroidMenuScreenState extends State<AndroidMenuScreen> {
  AnimateIconController controller = AnimateIconController();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    double menuFontSize = 25;
    // var menuSelectedCheck =
    //     Provider.of<RouteProvider>(context, listen: true).menuSelected as bool;
    // debugPrint('...@@456 @menu menuSelectedCheck..$menuSelectedCheck');
    return Container(
      height: screenHeight,
      child: Stack(
        children: [
          // Positioned.fill(
          //   child: Align(
          //     child: CustomPaint(
          //       painter: MyPainter(ctx: context),
          //       child: Container(),
          //     ),
          //   ),
          // ),
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
                      'assets/images/propic3.jpg',
                    ),
                  ),
                ),
              ),
              // Container(
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 20),
              //     child: Text(
              //       'MENU',
              //       style: TextStyle(
              //         fontFamily: 'PlayfairDisplay',
              //         // color: Colors.teal,
              //         fontWeight: FontWeight.bold,
              //         fontSize: 50,
              //       ),
              //     ),
              //   ),
              // ),
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
                                leading: Icon(Icons.home),
                                title: Text(
                                  'Home',
                                  style: TextStyle(
                                    fontFamily: 'PlayfairDisplay',
                                    // color: Colors.,
                                    fontWeight: FontWeight.bold,
                                    fontSize: menuFontSize,
                                  ),
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
                                leading: Icon(Icons.call),
                                title: Text(
                                  'Contact Me',
                                  style: TextStyle(
                                    fontFamily: 'PlayfairDisplay',
                                    // color: Colors.,
                                    fontWeight: FontWeight.bold,
                                    fontSize: menuFontSize,
                                  ),
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
                              leading: Icon(Icons.home),
                              title: Text(
                                'Experience',
                                style: TextStyle(
                                  fontFamily: 'PlayfairDisplay',
                                  // color: Colors.,
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
                              leading: Icon(
                                Icons.apps,
                              ),
                              title: Text(
                                'My Projects',
                                style: TextStyle(
                                  fontFamily: 'PlayfairDisplay',
                                  // color: Colors.,
                                  fontWeight: FontWeight.bold,
                                  fontSize: menuFontSize,
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
                height: 50,
              )
            ],
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

// class MyPainter extends CustomPainter {
//   final BuildContext ctx;
//   MyPainter({required this.ctx});
//   @override
//   void paint(Canvas canvas, Size size) {
//     // final theme = Provider.of<ThemeNotifier>(ctx, listen: false);
//     final Paint paint = Paint()
//       ..color = Colors.teal
//       ..style = PaintingStyle.fill
//       // ..

//       // ..strokeJoin  = Stroke
//       ..strokeWidth = 5.0;

//     final Path path = Path();

//     final h = size.height;
//     final w = size.width;

//     final y = h / 2;
//     // path.
//     // path.moveTo(20, h - 20);
//     path.moveTo(20, h - h * 0.19);
//     // path.quadraticBezierTo(w, y - 55, w, y - 5);
//     path.lineTo(w * 0.2, h - h * 0.19);
//     path.lineTo(w - 20, y);
//     path.lineTo(w * 0.2, h * 0.19);
//     path.lineTo(20, h * 0.19);

//     // path.lineTo(w - 20, h - 20);
//     path.close();
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }

class MyPainter extends CustomPainter {
  final BuildContext ctx;
  MyPainter({required this.ctx});
  @override
  void paint(Canvas canvas, Size size) {
    double padding = 0;
    // final theme = Provider.of<ThemeNotifier>(ctx, listen: false);
    final Paint paint = Paint()
      ..color = Colors.teal
      ..style = PaintingStyle.fill
      // ..

      // ..strokeJoin  = Stroke
      ..strokeWidth = 5.0;

    final Path path = Path();

    final h = size.height;
    final w = size.width;

    final y = h / 2;
    // path.
    path.moveTo(padding, h - padding);
    // path.lineTo(20, h - h * 0.19);
    path.lineTo(padding, y);
    // path.quadraticBezierTo(w, y - 55, w, y - 5);
    path.lineTo(w - padding, h - h * 0.19);
    path.lineTo(w - padding, h - padding);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
