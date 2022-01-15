import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

TextStyle authorStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.red,
  fontSize: 21,
);

TextStyle quoteStyle = TextStyle(
  fontWeight: FontWeight.bold,
  // fontFamily: 'Vollkorn',
  decorationStyle: TextDecorationStyle.solid,
  fontStyle: FontStyle.italic,
  color: Colors.teal,
  fontSize: 21,
);

Text nameText({
  required Color textColor,
}) {
  return Text(
    'Sivaprasad NK',
    style: TextStyle(
      fontFamily: 'PatuaOne',
      color: textColor,
      fontWeight: FontWeight.bold,
      fontSize: 21.0,
    ),
  );
}

class AndroidBgCurve extends CustomPainter {
  final BuildContext ctx;
  AndroidBgCurve({required this.ctx});
  @override
  void paint(Canvas canvas, Size size) {
    double padding = 0;
    // final theme = Provider.of<ThemeNotifier>(ctx, listen: false);
    final Paint paint = Paint()
      // ..color = Color.fromRGBO(7, 17, 26, 1)
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 5.0;

    final Path path = Path();

    final h = size.height;
    final w = size.width;

    final y = h / 2;
    // final x = w / 2;

    path.moveTo(0, h - padding);
    path.lineTo(0, h * 0.33);
    path.quadraticBezierTo(w * 0.25, h * 0.26, w * 0.5, h * 0.33);
    path.quadraticBezierTo(w * 0.75, h * 0.40, w, h * 0.33);
    path.lineTo(w - padding, y);
    path.lineTo(w - padding, h - padding);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class DescriptionText extends StatelessWidget {
  final String description;
  const DescriptionText({required this.description});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 40,
        top: 5,
        right: 30,
      ),
      child: Text(
        description,
        // 'A Quiz App with various categories ,and cool animations for each element on screen ',
        style: TextStyle(
          // fontFamily: 'PlayfairDisplay',
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 15,
          // color: Colors.white
        ),
      ),
    );
  }
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
                  // width: 10,
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

class WinddowsGooglePlayButton extends StatelessWidget {
  final double screenWidth;
  final String url;
  const WinddowsGooglePlayButton(
      {required this.screenWidth, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                'assets/images/google-play.png',
                height: 40,
                // width: 10,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'GET IT ON',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    'Google Play',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NameWidget extends StatelessWidget {
  const NameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Sivaprasad NK',
      style: TextStyle(
        fontFamily: 'PatuaOne',
        color: Colors.white,
        fontSize: 21.0,
      ),
    );
  }
}

class ProPic extends StatelessWidget {
  const ProPic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        radius: 100,
        backgroundImage: AssetImage(
          proPicAssetPath,
        ),
      ),
    );
  }
}

class ProPicWidget extends StatelessWidget {
  final double radius;
  const ProPicWidget({required this.radius});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        radius: radius,
        backgroundColor: Colors.cyanAccent,
        backgroundImage: AssetImage(proPicAssetPath),
      ),
    );
  }
}

class QuoteWidget extends StatefulWidget {
  final bool showQuote;
  QuoteWidget({required this.showQuote});
  @override
  _QuoteWidgetState createState() => _QuoteWidgetState();
}

class TitleText extends StatelessWidget {
  final String title;
  const TitleText({required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 30),
      child: Text(
        title,
        style: TextStyle(
          // fontFamily: 'PlayfairDisplay',
          // color: Colors.,
          fontWeight: FontWeight.bold,
          // color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}

class Wave extends StatefulWidget {
  const Wave({Key? key}) : super(key: key);

  @override
  _WaveState createState() => _WaveState();
}

class WelcomeText extends StatelessWidget {
  final bool isMobile;
  WelcomeText({required this.isMobile});
  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      isRepeatingAnimation: false,
      animatedTexts: [
        TypewriterAnimatedText(
          !isMobile ? welcomeSiteText : welcomeMobText,
          // : 'Welcome to \n sivaprasadnk.github.io',
          textAlign: TextAlign.center,
          textStyle: TextStyle(
            fontFamily: 'PatuaOne',
            fontSize: 35,
            color: Colors.teal,
            fontWeight: FontWeight.bold,
          ),
          speed: Duration(
            milliseconds: 115,
          ),
        )
      ],
    );
    // return Text(
    //   isMobile ? welcomeMobText : welcomeSiteText,
    //   textAlign: TextAlign.center,
    //   style: TextStyle(
    //     fontFamily: 'PatuaOne',
    //     color: Colors.teal,
    //     fontWeight: FontWeight.bold,
    //     fontSize: 35,
    //   ),
    // );
  }
}

class _QuoteWidgetState extends State<QuoteWidget> {
  DateTime time = DateTime.now();
  @override
  Widget build(BuildContext context) {
    time = DateTime.now();
    // var quote = time.second % 2 == 0 ? quote1 : quote2;
    // var author = time.second % 2 == 0 ? author1 : author2;
    print('..second ==${time.second}');
    return AnimatedOpacity(
      opacity: widget.showQuote ? 1 : 0,
      duration: Duration(seconds: 3),
      child: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SelectableText(
              "$quote1",
              toolbarOptions: ToolbarOptions(copy: true, selectAll: true),
              textAlign: TextAlign.center,
              style: quoteStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              ' - $author1',
              maxLines: 2,
              textAlign: TextAlign.right,
              style: authorStyle,
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class _WaveState extends State<Wave> {
  bool showWave = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: WaveWidget(
        config: CustomConfig(
          gradients: [
            [Colors.blueAccent, Colors.blueAccent],
            [Colors.blueAccent, Colors.blueAccent],
            [Colors.blue, Colors.blue],
            [Colors.blue, Colors.blue]
          ],
          //  heightPercentages: [0.25, 0.26, 0.28, 0.31],
          durations: [35000, 19440, 10800, 6000],
          heightPercentages: [0.65, 0.63, 0.65, 0.60],
          blur: MaskFilter.blur(BlurStyle.solid, 10),
          gradientBegin: Alignment.bottomLeft,
          gradientEnd: Alignment.topRight,
        ),
        // color: [
        //   Colors.white70,
        //   Colors.white54,
        //   Colors.white30,
        //   Colors.white24,
        // ],
        // durations: [
        //   32000,
        //   21000,
        //   18000,
        //   5000,
        // ],
        waveAmplitude: 0,
        size: Size(
          double.infinity,
          double.infinity,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500)).then((value) {
      setState(() {
        showWave = true;
      });
    });
  }
}

class AndroidHomeBgCurve extends CustomPainter {
  final BuildContext ctx;
  AndroidHomeBgCurve({required this.ctx});
  @override
  void paint(Canvas canvas, Size size) {
    double padding = 0;
    // final theme = Provider.of<ThemeNotifier>(ctx, listen: false);
    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 5.0;

    final Path path = Path();

    final h = size.height;
    final w = size.width;

    final y = h / 2;
    // final x = w / 2;
    // path.
    path.moveTo(0, h - padding);
    path.lineTo(0, h * 0.65);
    path.quadraticBezierTo(w * 0.29, h * 0.65, w * 0.5, h * 0.8);
    path.quadraticBezierTo(w * 0.73, h * 0.94, w, h * 0.84);
    path.lineTo(w - padding, y);
    path.lineTo(w - padding, h - padding);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class WindowsHomeBgCurve extends CustomPainter {
  final BuildContext ctx;
  WindowsHomeBgCurve({required this.ctx});
  @override
  void paint(Canvas canvas, Size size) {
    double padding = 0;
    // final theme = Provider.of<ThemeNotifier>(ctx, listen: false);
    final Paint paint = Paint()
      ..color = Color.fromRGBO(4, 139, 168, 1)
      ..style = PaintingStyle.fill
      ..strokeWidth = 5.0;

    final Path path = Path();

    final h = size.height;
    final w = size.width;

    final y = h / 2;
    path.moveTo(0, h - padding);
    path.lineTo(0, h * 0.65);
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

class WindowsExpBgCurve extends CustomPainter {
  final BuildContext ctx;
  WindowsExpBgCurve({required this.ctx});
  @override
  void paint(Canvas canvas, Size size) {
    double padding = 0;
    // final theme = Provider.of<ThemeNotifier>(ctx, listen: false);
    final Paint paint = Paint()
      // ..color = Colors.teal
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 5.0;

    final Path path = Path();

    final h = size.height;
    final w = size.width;

    final y = h / 2;
    path.moveTo(0, h - padding);
    path.lineTo(0, h * 0.74);
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
