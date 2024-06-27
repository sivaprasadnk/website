import 'package:flutter/material.dart';
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';

class ShadowContainer extends StatefulWidget {
  const ShadowContainer({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  State<ShadowContainer> createState() => _ShadowContainerState();
}

class _ShadowContainerState extends State<ShadowContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    BorderRadius? borderRadius;
    if (widget.child is Container) {
      final Container container = widget.child as Container;
      if (container.decoration is BoxDecoration) {
        final BoxDecoration decoration = container.decoration! as BoxDecoration;
        borderRadius = decoration.borderRadius as BorderRadius?;
      }
    }
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: context.shadowColor,
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
        child: widget.child,
      ),
    );
  }
}
