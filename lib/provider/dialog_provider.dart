import 'package:flutter/cupertino.dart';

class DialogProvider extends ChangeNotifier {
  ///

  bool _dialogIsOpen = false;
  bool get dialogIsOpen => _dialogIsOpen;

  void updateDialogOpenStatus({bool? status}) {
    _dialogIsOpen = status!;
    notifyListeners();
  }

  ///
}
