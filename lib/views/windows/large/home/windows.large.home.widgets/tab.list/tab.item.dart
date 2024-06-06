import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:spnk/utils/common_colors.dart';
import 'package:spnk/utils/common_strings.dart';

class TabItem extends StatefulWidget {
  const TabItem({
    required this.title,
    required this.onTap,
    required this.isSelected,
    required this.tabController,
    required this.index,
  });

  final TabController tabController;

  final VoidCallback onTap;
  final String title;
  final bool isSelected;
  final int index;

  @override
  State<TabItem> createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    const hoverColor = Colors.cyan;
    final normalColor =
        !isDarkTheme ? const Color.fromRGBO(0, 34, 120, 1) : kWhiteColor;
    return MouseRegion(
      // hoverColor: kTransparentColor,
      // splashColor: kTransparentColor,
      // highlightColor: kTransparentColor,
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
      // hoverColor:
      child: GestureDetector(
        onTap: () => widget.onTap.call(),
        child: SizedBox(
          height: 40,
          width: 100,
          child: Center(
            child: AutoSizeText(
              widget.title,
              style: TextStyle(
                fontFamily: kRajdhaniFontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 15,
                // color: !isDarkTheme
                //     ? const Color.fromRGBO(0, 34, 120, 1)
                //     : kWhiteColor
                color: widget.tabController.index == widget.index
                    ? normalColor
                    : isHovering
                        ? hoverColor
                        : normalColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
