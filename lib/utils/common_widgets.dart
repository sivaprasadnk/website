import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

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

class Wave extends StatefulWidget {
  const Wave({Key? key}) : super(key: key);

  @override
  _WaveState createState() => _WaveState();
}

class _WaveState extends State<Wave> {
  bool showWave = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500)).then((value) {
      setState(() {
        showWave = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: AnimatedOpacity(
        opacity: showWave ? 1 : 0,
        duration: Duration(milliseconds: 500),
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

TextStyle quoteStyle = TextStyle(
  fontWeight: FontWeight.bold,
  // fontFamily: 'Vollkorn',
  decorationStyle: TextDecorationStyle.solid,
  fontStyle: FontStyle.italic,
  color: Colors.teal,
  fontSize: 23,
);

TextStyle authorStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.red,
  fontSize: 25,
);

class ProPic extends StatelessWidget {
  const ProPic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        radius: 100,
        backgroundImage: AssetImage(
          'assets/images/propic3.jpg',
        ),
      ),
    );
  }
}
