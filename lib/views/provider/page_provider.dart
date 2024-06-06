import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageIndexProvider extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  int get pageIndex => state;

  set pageIndex(int value) {
    state = value;
  }
}

final pageIndexProvider = NotifierProvider<PageIndexProvider, int>(() {
  return PageIndexProvider();
});
