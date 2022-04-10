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
    final screenSize = MediaQuery.of(context).size;

    final screenWidth = screenSize.width;
    return Padding(
      padding: EdgeInsets.only(left: screenWidth * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Spacer(),
          SizedBox(
            height: screenSize.height * 0.15,
          ),
          GestureDetector(
            onTap: () {
              Provider.of<RouteProvider>(context, listen: false)
                  .setScreen(name: 'Home');
            },
            child: HomeMenu(),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Provider.of<RouteProvider>(context, listen: false)
                  .setScreen(name: 'Experience');
            },
            child: ExperienceMenu(),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Provider.of<RouteProvider>(context, listen: false)
                  .setScreen(name: 'MyProjects');
            },
            child: MyProjectsMenu(),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Provider.of<RouteProvider>(context, listen: false)
                  .setScreen(name: 'ContactMe');
            },
            child: ContactmeMenu(),
          ),
          const SizedBox(height: 20),
          // Spacer(),
        ],
      ),
    );
  }
}

class HomeMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = Provider.of<RouteProvider>(context).screen;

    return HoverText(
      title: 'Home',
      isSelected: screen == "Home",
    );
  }
}

class ContactmeMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = Provider.of<RouteProvider>(context).screen;

    return HoverText(
      title: 'Contact Me',
      isSelected: screen == "ContactMe",
    );
  }
}

class ExperienceMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = Provider.of<RouteProvider>(context).screen;

    return HoverText(
      title: 'Experience',
      isSelected: screen == "Experience",
    );
  }
}

class MyProjectsMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = Provider.of<RouteProvider>(context).screen;

    return HoverText(
      title: 'Projects',
      isSelected: screen == "MyProjects",
    );
  }
}

class HoverText extends StatefulWidget {
  final String title;
  final bool isSelected;
  const HoverText({
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
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

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
        duration: const Duration(milliseconds: 200),
        width: screenWidth * 0.15,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            width: 2,
            color: widget.isSelected
                ? const Color.fromRGBO(249, 139, 125, 1)
                : Colors.transparent,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 7),
          child: Center(
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
