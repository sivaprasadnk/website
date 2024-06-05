import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/screen_type.dart';
import 'package:spnk/views/provider/route_controller.dart';
import 'package:spnk/views/windows/hover_extensions.dart';

class CustomMenuItem extends StatefulWidget {
  final String title;
  final Screen screen;
  const CustomMenuItem({
    required this.screen,
    required this.title,
  });

  @override
  State<CustomMenuItem> createState() => _CustomMenuItemState();
}

class _CustomMenuItemState extends State<CustomMenuItem> {
  bool isHovering = false;

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    // const hoverColor = Color.fromRGBO(249, 139, 125, 1);
    const hoverColor = Colors.cyan;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final normalColor =
        isDarkTheme ? Colors.white : const Color.fromRGBO(0, 34, 120, 1);
    return GetX<RouteController>(
      builder: (controller) {
        final isSelected = controller.selectedScreen.value == widget.screen;
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
            width: 120,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                width: 2,
                color: isSelected ? hoverColor : Colors.transparent,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Center(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: kFontFamily2,
                    fontSize: 18,
                    color: isSelected
                        ? normalColor
                        : !isHovering
                            ? normalColor
                            : hoverColor,
                  ),
                ),
              ),
            ),
          ).showCursorOnHover,
        );
      },
    );
  }
}
