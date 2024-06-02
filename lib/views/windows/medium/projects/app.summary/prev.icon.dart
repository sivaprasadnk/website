import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/views/provider/page.provider.dart';
import 'package:spnk/views/windows/hover_extensions.dart';

class PrevIcon extends StatelessWidget {
  const PrevIcon({Key? key, required this.controller}) : super(key: key);
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Consumer<PageProvider>(
      builder: (_, provider, __) {
        return GestureDetector(
          onTap: () {
            debugPrint('.. @@@');
            if (provider.page != 0) {
              controller.previousPage(
                duration: const Duration(seconds: 1),
                curve: Curves.bounceOut,
              );
            }
            provider.updatePage(controller.page! - 1);
          },
          child: SizedBox(
            height: 20,
            width: 20,
            child: provider.page != 0
                ? Icon(
                    Icons.arrow_back_ios,
                    color: Theme.of(context).splashColor,
                  ).showCursorOnHover
                : const SizedBox.shrink(),
          ),
        );
      },
    );
  }
}
