import 'package:flutter/material.dart';
import 'package:spnk/views/screens/home/widgets/shadow_container.dart';
import 'package:universal_html/html.dart' as html;

extension HoverExtensions on Widget {
  static final appContainer =
      html.window.document.getElementById('app-container');

  Widget get showCursorOnHover {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: this,
    );
  }

  Widget get addShadowOnHover {
    return ShadowContainer(
      child: this,
    );
  }

  // Widget get changeColorOnHover(Color color) {
  //   return HoverContainer(child: this);
  // }
}
