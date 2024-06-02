import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageIndexProvider extends Notifier<double> {
  @override
  double build() {
    return 0;
  }

  double get pageIndex => state;

  set pageIndex(double value) {
    state = value;
  }
}

final pageIndexProvider = NotifierProvider<PageIndexProvider, double>(() {
  return PageIndexProvider();
});
