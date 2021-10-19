import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/route_provider.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';

class AndroidProjects extends StatefulWidget {
  final double screenHeight;
  const AndroidProjects({required this.screenHeight});
  @override
  _AndroidProjectsState createState() => _AndroidProjectsState();
}

class _AndroidProjectsState extends State<AndroidProjects> {
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
    var screenwidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned.fill(
          child: AnimatedOpacity(
            opacity: 1,
            duration: Duration(milliseconds: 900),
            child: Align(
              child: CustomPaint(
                painter: AndroidBgCurve(ctx: context),
                child: Container(),
              ),
            ),
          ),
        ),
        Container(
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
              SingleChildScrollView(
                child: LiveList(
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
                            description: spQuotesAppDescription);
                      case 2:
                        return GooglePlayButton(
                          url: spQuotesLink,
                          screenWidth: screenwidth,
                        );
                      case 3:
                        return TitleText(title: 'SP Quiz App');
                      case 4:
                        return DescriptionText(
                          description: spQuizAppDescription,
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
              ),
              Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
