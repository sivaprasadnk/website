import 'package:flutter/cupertino.dart';

class PageProvider extends ChangeNotifier {
  double pagee = 0;
  double get page => pagee;

  void updatePage(double pageIndex) {
    pagee = pageIndex;
    showPrevIconn = pageIndex != 0;
    showNextIconn = pageIndex != 2;
    debugPrint('.. @@page.. $pagee');
    notifyListeners();
  }

  bool showNextIconn = true;
  bool get showNextIcon => showNextIconn;

  bool showPrevIconn = false;
  bool get showPrevIcon => showNextIconn;

  void updatePageDetails({bool? showNext, bool? showPrev}) {
    showNextIconn = showNext!;
    showPrevIconn = showPrev!;
    notifyListeners();
  }

  // void updatePrev({bool? showPrev}) {
  //   showPrevIconn = showPrev!;
  //   notifyListeners();
  // }

  // void updateNext({bool? showNext}) {
  //   showNextIconn = showNext!;
  //   notifyListeners();
  // }
}
