import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:provider/provider.dart';
import 'package:spnk/views/provider/page_provider.dart';
import 'package:spnk/views/windows/hover_extensions.dart';

class NextIcon extends ConsumerWidget {
  const NextIcon({Key? key, required this.controller}) : super(key: key);
  final PageController controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(pageIndexProvider);
    return GestureDetector(
      onTap: () {
        if (pageIndex != 2) {
          controller.nextPage(
            duration: const Duration(seconds: 1),
            curve: Curves.bounceOut,
          );
        }
        ref.read(pageIndexProvider.notifier).pageIndex = controller.page! + 1;
        // provider.updatePage(controller.page! + 1);
      },
      child: SizedBox(
        height: 20,
        width: 20,
        child: pageIndex != 2
            ? Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).primaryColor,
                // color: provider.showNextIcon
                //     ? Theme.of(context).splashColor
                //     : Theme.of(context).primaryColor,
              ).showCursorOnHover
            : const SizedBox.shrink(),
      ),
    );
  }
}
