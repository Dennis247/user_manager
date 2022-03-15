import 'package:flutter/cupertino.dart';
import 'package:user_manager/model/base_response.dart';
import 'package:user_manager/model/user_model.dart';
import 'package:user_manager/services/user_service.dart';
import 'package:user_manager/utils/constants.dart';
import 'package:user_manager/utils/locator.dart';

import 'base_view_model.dart';

class SignUpViewModel extends BaseViewModel {
  init({required bool formValid}) {
    _isFromValid = formValid;
  }

  bool _isFromValid = false;
  bool get isFromValid => _isFromValid;
  setFormValid({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNo,
    required String password,
    required String userName,
  }) {
    _isFromValid = (firstName.isNotEmpty &&
        lastName.isNotEmpty &&
        email.isNotEmpty &&
        phoneNo.isNotEmpty &&
        userName.isNotEmpty &&
        password.isNotEmpty);
    notifyListeners();
  }

  Future<BaseResponse> addUpdateUser(
      {required Map<String, dynamic> userData, bool isEdit = false}) async {
    try {
      //add or update user to the repo repo
      final userResponse = await locator<UserService>()
          .addOrUpdateUser(data: userData, isEdit: isEdit);
      return userResponse;
    } catch (e) {
      return Constants.getBaseException(e.toString());
    }
  }
}
