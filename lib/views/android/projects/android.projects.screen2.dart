import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/route_provider.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class AndroidProjects extends StatefulWidget {
  final double screenHeight;
  const AndroidProjects({required this.screenHeight});
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
    return Stack(
      children: [
        Positioned.fill(
          child: AnimatedOpacity(
            opacity: 1,
            duration: Duration(milliseconds: 900),
            child: Align(
              child: CustomPaint(
                painter: MyPainter(ctx: context),
                child: Container(),
              ),
            ),
          ),
        ),
        // Positioned.fill(
        //   top: 55,
        //   child: Align(
        //     alignment: Alignment.topRight,
        //     child: IconButton(
        //       icon: Icon(Icons.menu, color: Colors.white),
        //       onPressed: () {
        //         Provider.of<RouteProvider>(context, listen: false)
        //             .setMenuSelected(check: true);
        //       },
        //     ),
        //   ),
        // ),
        SingleChildScrollView(
          child: Container(
            height: widget.screenHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.menu, color: Colors.white),
                      onPressed: () {
                        Provider.of<RouteProvider>(context, listen: false)
                            .setMenuSelected(check: true);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0, left: 30),
                  child: Text(
                    'My Projects',
                    style: TextStyle(
                        fontFamily: 'PlayfairDisplay',
                        // color: Colors.,
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: widget.screenHeight * 0.1,
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
                Spacer(),
              ],
            ),
          ),
        ),
      ],
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
      padding: EdgeInsets.only(left: 40, right: screenWidth * 0.29, top: 20),
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

// class MyPainter extends CustomPainter {
//   final BuildContext ctx;
//   MyPainter({required this.ctx});
//   @override
//   void paint(Canvas canvas, Size size) {
//     double padding = 0;
//     // final theme = Provider.of<ThemeNotifier>(ctx, listen: false);
//     final Paint paint = Paint()
//       ..color = Color.fromRGBO(7, 17, 26, 1)
//       ..style = PaintingStyle.fill
//       ..strokeWidth = 5.0;

//     final Path path = Path();

//     final h = size.height;
//     final w = size.width;

//     final y = h / 2;
//     final x = w / 2;
//     // path.
//     path.moveTo(0, h - padding);
//     path.lineTo(0, h * 0.29);
//     path.quadraticBezierTo(w * 0.29, h * 0.19, w * 0.5, h * 0.3);
//     path.quadraticBezierTo(w * 0.78, h * 0.44, w, h * 0.35);
//     path.lineTo(w - padding, y);
//     path.lineTo(w - padding, h - padding);
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
      ..color = Color.fromRGBO(7, 17, 26, 1)
      ..style = PaintingStyle.fill
      ..strokeWidth = 5.0;

    final Path path = Path();

    final h = size.height;
    final w = size.width;

    final y = h / 2;
    final x = w / 2;

    path.moveTo(0, h - padding);
    path.lineTo(0, h * 0.23);
    path.quadraticBezierTo(w * 0.25, h * 0.16, w * 0.5, h * 0.23);
    path.quadraticBezierTo(w * 0.75, h * 0.3, w, h * 0.23);
    path.lineTo(w - padding, y);
    path.lineTo(w - padding, h - padding);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
