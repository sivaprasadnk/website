import 'package:spnk/utils/screen_type.dart';

extension IntExt on int {
  Screen get screenFromIndex {
    if (this == 0) {
      return Screen.home;
    } else if (this == 1) {
      return Screen.experience;
    } else if (this == 2) {
      return Screen.projects;
    } else {
      return Screen.contactMe;
    }
  }
}
