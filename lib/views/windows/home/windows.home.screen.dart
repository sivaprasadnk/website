import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:spnk/provider/quotes/quotes.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/windows/home/windows.home.container.dart';
import 'package:spnk/views/windows/projects/windows.project.container.dart';

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
      ..strokeWidth = 5.0;

    final Path path = Path();

    final h = size.height;
    final w = size.width;

    final y = h / 2;
    path.moveTo(0, h - padding);
    path.lineTo(0, h * 0.55);
    path.quadraticBezierTo(w * 0.29, h * 0.55, w * 0.5, h * 0.7);
    path.quadraticBezierTo(w * 0.73, h * 0.84, w, h * 0.74);
    path.lineTo(w - padding, y);
    path.lineTo(w - padding, h - padding);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class WindowsHomeScreen extends StatefulWidget {
  static const routeName = '/Home';
  const WindowsHomeScreen({Key? key}) : super(key: key);

  @override
  _WindowsHomeScreenState createState() => _WindowsHomeScreenState();
}

// class MyPainter extends CustomPainter {
//   final BuildContext ctx;
//   MyPainter({required this.ctx});
//   @override
//   void paint(Canvas canvas, Size size) {
//     double padding = 0;
//     // final theme = Provider.of<ThemeNotifier>(ctx, listen: false);
//     final Paint paint = Paint()
//       ..color = Colors.teal
//       ..style = PaintingStyle.fill
//       ..strokeWidth = 5.0;

//     final Path path = Path();

//     final h = size.height;
//     final w = size.width;
//     var x = w / 2;
//     x = 0;
//     final y = h / 2;
//     path.moveTo(padding + x, h - padding);
//     path.lineTo(padding + x, h - h * 0.15);
//     path.quadraticBezierTo(w, y - 55, w, y - 5);
//     path.lineTo(w - padding + x, y - y * 0.5);
//     path.lineTo(w - padding + x, h - padding);
//     path.close();
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }

class _WindowsHomeScreenState extends State<WindowsHomeScreen> {
  bool isDarkModeEnabled = false;
  // DateTime time = DateTime.now();
  List _isHovering = [true, false, false];
  Quotes? item;
  bool homeSelected = true, projectSelected = false, contactmeSelected = false;
  late Widget fbPng;
  late Widget waPng;
  late Widget instaPng;
  late Widget linkedInPng;
  late bool showImage;
  late bool showQuote = false;
  double iconSize = 30;
  bool quoteLoaded = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    // final themeProvider = Provider.of<DarkThemeProvider>(context);
    // var screen = Provider.of<RouteProvider>(context).screen.toString();

    return Scaffold(
      backgroundColor: Color.fromRGBO(7, 17, 26, 1),
      appBar: PreferredSize(
        preferredSize: Size(screenWidth, 65),
        child: Container(
          color: Color.fromRGBO(7, 17, 26, 1),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        homeSelected = true;
                        projectSelected = false;
                      });
                    },
                    child: nameText(textColor: Colors.white),
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      homeSelected = true;
                      projectSelected = false;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Home',
                        style: TextStyle(
                          fontFamily: 'PatuaOne',
                          color: _isHovering[0]
                              ? Colors.blue.shade200
                              : Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      // For showing an underline on hover
                      Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: homeSelected,
                        child: Container(
                          height: 2,
                          width: 40,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: screenWidth / 50,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      projectSelected = true;
                      homeSelected = false;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Projects',
                        style: TextStyle(
                          fontFamily: 'PatuaOne',
                          color: _isHovering[1]
                              ? Colors.blue.shade200
                              : Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      // For showing an underline on hover
                      Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: projectSelected,
                        child: Container(
                          height: 2,
                          width: 40,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: screenWidth / 50,
                ),
              ],
            ),
          ),
        ),
      ),
      body: (homeSelected)
          ? Stack(
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
                WindowsHomeContainer(
                    screenWidth: screenWidth, screenHeight: screenHeight)
              ],
            )
          : projectSelected
              ? WindowsProjectContainer(
                  screenWidth: screenWidth, screenHeight: screenHeight)
              : Container(),
    );
  }

  @override
  void initState() {
    super.initState();
    showImage = false;
    fbPng = Image.asset(fbPngAssetName, height: iconSize);
    waPng = Image.asset(whatsappPngeAssetName, height: iconSize);
    instaPng = Image.asset(instaPngImageName, height: iconSize);
    linkedInPng = Image.asset(linkedInAssetName,
        height: iconSize, color: Colors.blue[900]);
  }
}
