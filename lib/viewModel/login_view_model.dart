import 'package:user_manager/model/base_response.dart';
import 'package:user_manager/services/user_service.dart';
import 'package:user_manager/utils/constants.dart';
import 'package:user_manager/utils/locator.dart';
import 'base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  bool _isFromValid = false;
  bool get isFromValid => _isFromValid;
  setFormValid({
    required String userName,
    required String password,
  }) {
    _isFromValid = (userName.trim().isNotEmpty && password.isNotEmpty);
    notifyListeners();
  }

  Future<BaseResponse> loginUser(
      {required String userName, required String password}) async {
    setIsLoading(value: true, notify: true);
    try {
      //login user from repo
      final userResponse = await locator<UserService>()
          .loginUser(username: userName, password: password);
      setIsLoading(value: false, notify: true);
      return userResponse;
    } catch (e) {
      setIsLoading(value: false, notify: true);
      return Constants.getBaseException(e.toString());
    }
  }
}
