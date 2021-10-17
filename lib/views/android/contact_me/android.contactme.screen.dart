import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/route_provider.dart';

class AndroidContactMeScreen extends StatefulWidget {
  @override
  _AndroidContactMeScreenState createState() => _AndroidContactMeScreenState();
}

class _AndroidContactMeScreenState extends State<AndroidContactMeScreen> {
  AnimateIconController controller = AnimateIconController();
  @override
  Widget build(BuildContext context) {
    var menuSelectedCheck =
        Provider.of<RouteProvider>(context, listen: true).menuSelected as bool;
    debugPrint('...@@456 @menu menuSelectedCheck..$menuSelectedCheck');
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, right: 20),
                  child: AnimateIcons(
                    startIcon: !menuSelectedCheck ? Icons.menu : Icons.close,
                    endIcon: !menuSelectedCheck ? Icons.menu : Icons.close,
                    size: 20.0,
                    controller: controller,
                    onStartIconPress: () {
                      debugPrint('..@1 @menu ');
                      print("Clicked on start Icon @menu ");
                      if (controller.isStart()) {
                        debugPrint('..@2 @menu ');
                        setState(() {
                          Provider.of<RouteProvider>(context, listen: false)
                              .setMenuSelected(check: true);
                          controller.animateToEnd();
                        });
                      }
                      return true;
                    },
                    onEndIconPress: () {
                      print("Clicked on Close Icon@menu ");
                      debugPrint('..@4');
                      if (controller.isEnd()) {
                        debugPrint('..@5@menu ');
                        setState(() {
                          Provider.of<RouteProvider>(context, listen: false)
                              .setMenuSelected(check: false);
                          controller.animateToStart();
                        });
                      }
                      return true;
                    },
                    duration: Duration(milliseconds: 500),
                    startIconColor: Colors.black,
                    endIconColor: Colors.black,
                    clockwise: false,
                  ),
                ),
              ],
            ),
          ),
          Text('Contact Me !'),
        ],
      ),
    );
  }
}
