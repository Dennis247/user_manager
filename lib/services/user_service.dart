import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_manager/model/base_response.dart';
import 'package:user_manager/model/user_model.dart';

class UserService {
  Future<BaseResponse> loginUser(
      {required String username, required String password}) async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    if (!await userExists(username, sharedPrefs)) {
      return BaseResponse(
          isSucessfull: false, message: "user does not exist", data: null);
    }
    var userData = sharedPrefs.getString(username);
    final extractedUserData = json.decode(userData!) as Map<String, dynamic>;
    final UserModel user = UserModel.fromJson(extractedUserData);
    if (user.password == password) {
      return BaseResponse(
          isSucessfull: true, message: "user login sucessfull", data: user);
    } else {
      return BaseResponse(
          isSucessfull: true, message: "invalid pasword", data: user);
    }
  }

  Future<bool> userExists(
      String userName, SharedPreferences sharedPrefs) async {
    if (!sharedPrefs.containsKey(userName)) {
      return false;
    }
    return true;
  }

  Future<BaseResponse> getUserByUserName({required String username}) async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    if (!await userExists(username, sharedPrefs)) {
      return BaseResponse(
          isSucessfull: false, message: "user does not exist", data: null);
    }
    var userData = sharedPrefs.getString(username);
    final extractedUserData = json.decode(userData!) as Map<String, dynamic>;
    final UserModel user = UserModel.fromJson(extractedUserData);
    return BaseResponse(
        isSucessfull: true, message: "user login sucessfull", data: user);
  }

  Future<BaseResponse> addOrUpdateUser(
      {required Map<String, dynamic> data, required bool isEdit}) async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    if (!isEdit) {
      if (await userExists(data['userName'], sharedPrefs)) {
        return BaseResponse(
            isSucessfull: false, message: "user already exist", data: null);
      }
    }

    final userData = json.encode(data);
    sharedPrefs.setString(data['userName'], userData);
    return BaseResponse(
        isSucessfull: true,
        message: "user update sucessfull",
        data: UserModel.fromJson(data));
  }
}
