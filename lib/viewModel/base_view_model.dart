import 'package:flutter/cupertino.dart';

class BaseViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  setIsLoading({required bool value, bool notify = true}) {
    if (notify) _isLoading = value;
    notifyListeners();
  }
}
