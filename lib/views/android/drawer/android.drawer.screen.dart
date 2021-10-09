import 'package:flutter/material.dart';
import 'package:spnk/views/android/home/android.home.screen.dart';
import 'package:spnk/views/android/projects/android.projects.screen.dart';

class AndroidDrawerScreen extends StatefulWidget {
  @override
  _AndroidDrawerScreenState createState() => _AndroidDrawerScreenState();
}

class _AndroidDrawerScreenState extends State<AndroidDrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          SizedBox(
            height: 200,
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.teal,
            ),
            title: Text('Home', style: TextStyle(color: Colors.teal)),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (ctx) => AndroidHomeScreen()));
            },
          ),
          ListTile(
            title: Text(
              'Projects',
              style: TextStyle(color: Colors.teal),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (ctx) => AndroidProjectScreen()));
            },
            leading: Icon(
              Icons.apps_sharp,
              color: Colors.teal,
            ),
          )
        ],
      ),
    );
  }
}
