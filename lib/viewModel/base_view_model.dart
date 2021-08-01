import 'package:flutter/cupertino.dart';

class BaseViewModel extends ChangeNotifier {
  // displays a loader on the ui while busy with an operaion
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  setIsLoading({required bool value, bool notify = true}) {
    //if true rebuild widgets where necesary
    if (notify) _isLoading = value;
    notifyListeners();
  }
}
