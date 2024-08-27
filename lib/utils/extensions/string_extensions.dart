import 'package:animated_icon/animated_icon.dart';

extension StringExt on String {
  AnimateIcons get iconFromString {
    if (this == 'home') {
      return AnimateIcons.home;
    } else if (this == "call") {
      return AnimateIcons.chatMessage;
    } else if (this == 'email') {
      return AnimateIcons.mail;
    }
    return AnimateIcons.home;
  }
}
