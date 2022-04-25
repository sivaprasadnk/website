import 'package:flutter/cupertino.dart';

class ImageHoverProvider extends ChangeNotifier {
  bool _showDetails = false;
  bool get showDetails => _showDetails;

  bool _showButton = false;
  bool get showButton => _showButton;

  // void

  bool _isHovered = false;
  bool get isHovered => _isHovered;

  void toggleHovered() {
    _isHovered = !isHovered;
    notifyListeners();
    Future.delayed(const Duration(seconds: 1)).then((_) {
      _showDetails = !showDetails;
      notifyListeners();
      Future.delayed(const Duration(milliseconds: 600)).then((_) {
        _showButton = !showButton;
        notifyListeners();
      });
    });
  }

  void updateHovered({bool? status}) {
    _isHovered = status!;
    notifyListeners();
    Future.delayed(const Duration(seconds: 1)).then((_) {
      _showButton = !showButton;
      notifyListeners();
    });
  }
}
