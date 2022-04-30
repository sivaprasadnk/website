import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/page.provider.dart';
import 'package:spnk/views/windows/hover_extensions.dart';

class NextIcon extends StatelessWidget {
  const NextIcon({Key? key, required this.controller}) : super(key: key);
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Consumer<PageProvider>(
      builder: (_, provider, __) {
        return GestureDetector(
          onTap: () {
            if (provider.page != 2) {
              controller.nextPage(
                duration: const Duration(seconds: 1),
                curve: Curves.bounceOut,
              );
            }
            provider.updatePage(controller.page! + 1);
          },
          child: SizedBox(
            height: 20,
            width: 20,
            child: provider.page != 2
                ? Icon(
                    Icons.arrow_forward_ios,
                    color: provider.showNextIcon
                        ? Theme.of(context).splashColor
                        : Theme.of(context).primaryColor,
                  ).showCursorOnHover
                : const SizedBox.shrink(),
          ),
        );
      },
    );
  }
}
