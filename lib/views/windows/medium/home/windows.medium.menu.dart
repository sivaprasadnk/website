import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/route_provider.dart';
import 'package:spnk/views/windows/hover_extensions.dart';

class WindowsMediumMenu extends StatefulWidget {
  const WindowsMediumMenu({Key? key}) : super(key: key);

  @override
  _WindowsMediumMenuState createState() => _WindowsMediumMenuState();
}

class _WindowsMediumMenuState extends State<WindowsMediumMenu> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    var screenWidth = screenSize.width;
    // var screenHeight = screenSize.height;
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: screenWidth * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            GestureDetector(
              onTap: () {
                Provider.of<RouteProvider>(context, listen: false)
                    .setScreen(name: 'Home');
              },
              child: HomeMenu(),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Provider.of<RouteProvider>(context, listen: false)
                    .setScreen(name: 'Experience');
              },
              child: ExperienceMenu(),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Provider.of<RouteProvider>(context, listen: false)
                    .setScreen(name: 'MyProjects');
              },
              child: MyProjectsMenu(),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Provider.of<RouteProvider>(context, listen: false)
                    .setScreen(name: 'ContactMe');
              },
              child: ContactmeMenu(),
            ),
            SizedBox(height: 20),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class HomeMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screen = Provider.of<RouteProvider>(context).screen.toString();

    return HoverText(
      title: 'Home',
      isSelected: screen == "Home",
    );
  }
}

class ContactmeMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screen = Provider.of<RouteProvider>(context).screen.toString();

    return HoverText(
      title: 'Contact Me',
      isSelected: screen == "ContactMe",
    );
  }
}

class ExperienceMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screen = Provider.of<RouteProvider>(context).screen.toString();

    return HoverText(
      title: 'Experience',
      isSelected: screen == "Experience",
    );
  }
}

class MyProjectsMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screen = Provider.of<RouteProvider>(context).screen.toString();

    return HoverText(
      title: 'Projects',
      isSelected: screen == "MyProjects",
    );
  }
}

class HoverText extends StatefulWidget {
  final String title;
  final bool isSelected;
  HoverText({
    required this.title,
    required this.isSelected,
  });

  @override
  State<HoverText> createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverText> {
  bool isHovering = false;

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;

    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovering = true;
        });
      },
      onExit: (val) {
        setState(() {
          isHovering = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: screenWidth * 0.2,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            width: 2,
            color: widget.isSelected
                ? Color.fromRGBO(249, 139, 125, 1)
                : Colors.transparent,
          ),
        ),
        child: FittedBox(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 1, vertical: 7),
            child: Text(
              widget.title,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
        ),
      ).showCursorOnHover,
    );
  }
}
