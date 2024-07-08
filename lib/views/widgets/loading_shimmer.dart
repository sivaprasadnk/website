import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spnk/utils/extensions/context_extension.dart';

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.primaryColor.withOpacity(0.5),
      highlightColor: context.primaryColor,
      child: child,
    );
  }

  factory LoadingShimmer.container({
    required double height,
    required double width,
    required BuildContext context,
  }) {
    return LoadingShimmer(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: context.primaryColor,
        ),
      ),
    );
  }
}
