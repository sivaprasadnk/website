import 'package:get/get.dart';

class PageIndexController extends GetxController {
  RxInt pageIndex = 0.obs;

  void updatePageIndex(int newValue) {
    pageIndex.value = newValue;
    update();
  }
}
