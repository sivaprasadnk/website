import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:provider/provider.dart';
import 'package:spnk/views/provider/page_provider.dart';
import 'package:spnk/views/windows/hover_extensions.dart';

class PrevIcon extends ConsumerWidget {
  const PrevIcon({Key? key, required this.controller}) : super(key: key);
  final PageController controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(pageIndexProvider);

    return GestureDetector(
      onTap: () {
        debugPrint('.. @@@');
        if (pageIndex != 0) {
          controller.previousPage(
            duration: const Duration(seconds: 1),
            curve: Curves.bounceOut,
          );
        }
        ref.read(pageIndexProvider.notifier).pageIndex = controller.page! - 1;
        // provider.updatePage(controller.page! - 1);
      },
      child: SizedBox(
        height: 20,
        width: 20,
        child: Icon(
          Icons.arrow_back_ios,
          color: Theme.of(context).splashColor,
        ).showCursorOnHover,
        // child: provider.page != 0
        //     ? Icon(
        //         Icons.arrow_back_ios,
        //         color: Theme.of(context).splashColor,
        //       ).showCursorOnHover
        //     : const SizedBox.shrink(),
      ),
    );
  }
}
