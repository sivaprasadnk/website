import 'package:flutter/material.dart';
import 'package:spnk/views/windows/hover_extensions.dart';

class NextIcon extends StatelessWidget {
  const NextIcon({Key? key, required this.controller}) : super(key: key);
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
          controller.nextPage(
            duration: const Duration(seconds: 1),
            curve: Curves.bounceOut,
        );
        // ref.read(pageIndexProvider.notifier).pageIndex =
        //     (controller.page! + 1).toInt();
      },
      child: SizedBox(
        height: 20,
        width: 20,
        child: Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).primaryColor,
        ).showCursorOnHover,
      ),
    );
  }
}
