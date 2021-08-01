import 'package:flutter/material.dart';
import 'package:user_manager/model/base_response.dart';
import 'package:user_manager/model/user_model.dart';
import 'package:user_manager/services/user_service.dart';
import 'package:user_manager/utils/constants.dart';
import 'package:user_manager/utils/locator.dart';
import 'package:user_manager/viewModel/base_view_model.dart';

class ProfileViewModel extends BaseViewModel {
  UserModel _user = UserModel(
      firstName: "firstName",
      lastName: "lastName",
      email: "email",
      userName: "userName",
      phoneNumber: "phoneNumber",
      password: "password");

  UserModel get user => _user;
  updateProfile(UserModel value) {
    _user = value;
    notifyListeners();
  }

  Future<BaseResponse> getUserProfile(
      {required String userName, required bool notify}) async {
    try {
      //get user from repo
      setIsLoading(value: true, notify: notify);
      final userResponse =
          await locator<UserService>().getUserByUserName(username: userName);
      _user = userResponse.data;
      setIsLoading(value: true, notify: false);
      return userResponse;
    } catch (e) {
      setIsLoading(value: true, notify: false);
      return Constants.getBaseException(e.toString());
    }
  }
}
