import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spnk/utils/common_colors.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/screen_type.dart';
import 'package:spnk/views/provider/route_provider.dart';
import 'package:spnk/views/windows/hover_extensions.dart';

class CustomMenuItem extends ConsumerStatefulWidget {
  final String title;
  final Screen screen;
  const CustomMenuItem({
    required this.screen,
    required this.title,
  });

  @override
  ConsumerState<CustomMenuItem> createState() => _CustomMenuItemState();
}

class _CustomMenuItemState extends ConsumerState<CustomMenuItem> {
  bool isHovering = false;

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    const hoverColor = Colors.cyan;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final normalColor = isDarkTheme ? kWhiteColor : kPrimaryBlueColor;
    // var selected = ref.watch(routeNotifierProvider);
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
            color: widget.screen ==
                    ref.read(routeNotifierProvider.notifier).selectedScreen
                ? hoverColor
                : kTransparentColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 7),
          child: Center(
            child: Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: kRajdhaniFontFamily,
                fontSize: 18,
                color: widget.screen ==
                        ref.read(routeNotifierProvider.notifier).selectedScreen
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
  }
}
