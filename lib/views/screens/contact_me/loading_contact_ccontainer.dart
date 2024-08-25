import 'package:flutter/material.dart';
import 'package:spnk/utils/common_colors.dart';
import 'package:spnk/utils/extensions/context_extension.dart';
import 'package:spnk/views/widgets/loading_shimmer.dart';

class LoadingContactContainer extends StatefulWidget {
  const LoadingContactContainer({
    super.key,
  });

  @override
  State<LoadingContactContainer> createState() =>
      _LoadingContactContainerState();
}

class _LoadingContactContainerState extends State<LoadingContactContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, right: 20),
      child: MouseRegion(
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
        child: Material(
          elevation: _isHovered ? 15 : 0,
          shadowColor: _isHovered ? context.shadowColor : kTransparentColor,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: context.isLargeDevice ? 350 : double.infinity,
            height: 265,
            decoration: BoxDecoration(
              color: context.scaffoldColor,
              // border: Border.all(
              //   color: context.primaryColor,
              // ),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 75),
                LoadingShimmer.circle(size: 40, context: context),
                const SizedBox(height: 20),
                LoadingShimmer.rectangle(
                  height: 20,
                  width: 150,
                  context: context,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
