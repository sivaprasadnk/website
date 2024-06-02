import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

extension HoverExtensions on Widget {
  static final appContainer =
      html.window.document.getElementById('app-container');

  Widget get showCursorOnHover {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: this,
      // onHover: (event)=> event.,
    );
  }
}
