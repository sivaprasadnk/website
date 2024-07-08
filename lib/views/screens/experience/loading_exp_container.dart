import 'package:flutter/material.dart';
import 'package:spnk/utils/extensions/context_extension.dart';
import 'package:spnk/views/widgets/loading_shimmer.dart';

class LoadingExpContainer extends StatelessWidget {
  const LoadingExpContainer({super.key});
  @override
  Widget build(BuildContext context) {
    final bulletPoint = LoadingShimmer(
      child: CircleAvatar(
        radius: 5,
        backgroundColor: context.primaryColor,
      ),
    );
    const double height = 20;
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 20, bottom: 20),
      duration: const Duration(milliseconds: 200),
      width: context.isLargeDevice ? 350 : double.infinity,
      height: 260,
      decoration: BoxDecoration(
        color: context.scaffoldColor,
        border: Border.all(
          color: context.primaryColor,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 5),
            child: LoadingShimmer.container(
              height: height,
              width: 50,
              context: context,
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 3,
              horizontal: 5,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                LoadingShimmer.container(
                  height: height,
                  width: 250,
                  context: context,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                LoadingShimmer.container(
                  height: height,
                  width: 50,
                  context: context,
                ),
                const SizedBox(width: 10),
                LoadingShimmer.container(
                  height: height,
                  width: 50,
                  context: context,
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [1, 1, 1].map((desc) {
                return Padding(
                  padding: const EdgeInsets.only(top: height, left: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      bulletPoint,
                      const SizedBox(width: 10),
                      LoadingShimmer.container(
                        height: height,
                        width: 120,
                        context: context,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
