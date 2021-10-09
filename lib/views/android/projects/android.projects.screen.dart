import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/android/drawer/android.drawer.screen.dart';
import 'package:url_launcher/url_launcher.dart';

class AndroidProjectScreen extends StatefulWidget {
  const AndroidProjectScreen({Key? key}) : super(key: key);

  @override
  _AndroidProjectScreenState createState() => _AndroidProjectScreenState();
}

class _AndroidProjectScreenState extends State<AndroidProjectScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    return Scaffold(
      drawer: Drawer(
        child: AndroidDrawerScreen(),
      ),
      body: Container(
        child: Stack(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Wave()),
            Builder(
              builder: (ctx) => Positioned.fill(
                top: 50,
                left: 20,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                      onTap: () {
                        debugPrint('...@1');
                        Scaffold.of(ctx).openDrawer();
                      },
                      child: Icon(Icons.menu)),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: screenWidth > 500
                      ? BorderedText(
                          strokeWidth: 4.0,
                          strokeCap: StrokeCap.round,
                          strokeColor: Colors.teal,
                          child: Text(
                            'My Projects',
                            style: TextStyle(
                              fontFamily: 'PatuaOne',
                              color: Colors.white,
                              fontSize: 21.0,
                            ),
                          ),
                        )
                      : Text(
                          'My Projects',
                          style: TextStyle(
                            fontFamily: 'PatuaOne',
                            color: Colors.teal,
                            fontSize: 21.0,
                          ),
                        ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                    separatorBuilder: (ctx, i) {
                      return SizedBox(
                        height: 10,
                      );
                    },
                    shrinkWrap: true,
                    itemCount: 2,
                    padding: EdgeInsets.zero,
                    itemBuilder: (ctx, i) {
                      return GestureDetector(
                        onTap: () {
                          i == 0 ? launch(spQuotesLink) : launch(spQuizLink);
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 180,
                              width: 180,
                              decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  i == 0 ? ' SP \n Quotes ' : ' SP \n Quiz ',
                                  style: TextStyle(
                                    fontSize: i == 0 ? 40 : 55,
                                    fontFamily: 'Gugi',
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            i == 0
                                ? Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 15),
                                      child: Text(
                                        ' A simple Quotes \n Listing App',
                                        style: TextStyle(
                                          fontSize: 20,
                                          // fontFamily: 'Gugi',
                                          color: Colors.teal,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  )
                                : Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 15),
                                      child: Text(
                                        'A simple quiz app',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          // fontFamily: 'Gugi',
                                          color: Colors.teal,
                                        ),
                                      ),
                                    ),
                                  )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
