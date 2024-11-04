import 'package:flutter/material.dart';
import 'package:spnk/utils/common_colors.dart';
import 'package:spnk/utils/extensions/context_extension.dart';
import 'package:spnk/views/widgets/loading_shimmer.dart';

class LoadingSkillsContainer extends StatelessWidget {
  const LoadingSkillsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, right: 20),
      child: Material(
        shadowColor: kTransparentColor,
        child: Container(
          width: context.isLargeDevice ? 340 : double.infinity,
          height: 265,
          decoration: BoxDecoration(
            color: context.scaffoldColor,
            border: Border.all(
              color: context.isMobileDevice
                  ? context.primaryColor
                  : context.scaffoldColor,
            ),
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
    );
  }
}
