import 'package:flutter/material.dart';
import 'package:spnk/views/ios/home/ios.home.screen.dart';
import 'package:spnk/views/ios/projects/ios.projects.screen.dart';

class IosDrawerScreen extends StatefulWidget {
  @override
  _IosDrawerScreenState createState() => _IosDrawerScreenState();
}

class _IosDrawerScreenState extends State<IosDrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          SizedBox(
            height: 200,
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (ctx) => IosHomeScreen()));
            },
          ),
          ListTile(
            title: Text('Projects'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (ctx) => IosProjectScreen()));
            },
            leading: Icon(Icons.apps_sharp),
          )
        ],
      ),
    );
  }
}
