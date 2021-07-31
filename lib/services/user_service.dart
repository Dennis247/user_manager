import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_manager/model/base_response.dart';
import 'package:user_manager/model/user_model.dart';

class UserService {
  Future<BaseResponse> loginUser(
      {required String username, required String password}) async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    if (await userExists(username, sharedPrefs)) {
      return BaseResponse(
          isSucessfull: false, message: "user does not exist", data: null);
    }
    var userData = sharedPrefs.getString(username);
    final extractedUserData = json.decode(userData!) as Map<String, Object>;
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
    if (await userExists(username, sharedPrefs)) {
      return BaseResponse(
          isSucessfull: false, message: "user does not exist", data: null);
    }
    var userData = sharedPrefs.getString(username);
    final extractedUserData = json.decode(userData!) as Map<String, Object>;
    final UserModel user = UserModel.fromJson(extractedUserData);
    return BaseResponse(
        isSucessfull: true, message: "user login sucessfull", data: user);
  }

  Future<BaseResponse> updateUserProfile(
      {required Map<String, dynamic> data}) async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    if (await userExists(data['username'], sharedPrefs)) {
      return BaseResponse(
          isSucessfull: false, message: "user does not exist", data: null);
    }
    final userData = json.encode(data);
    sharedPrefs.setString(data['username'], userData);
    return BaseResponse(
        isSucessfull: true,
        message: "user update sucessfull",
        data: UserModel.fromJson(data));
  }
}




  // Future<dynamic> getUserById({required String userId}) async {
  //   try {
  //     final dataSnapShot = await usersRef.child(userId).once();
  //     print('User fetched sucessfully: ${dataSnapShot.value["userId"]}');
  //     return dataSnapShot.value;
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

//   Future<bool> signUpUser(Map<String, dynamic> data) async {
//     //check if username exist before signingup user
//     final result = await usersRef.where('id', isEqualTo: data['id']).

//     await usersRef.child(data['id']).set(data);
//     return true;
//   }

//   Future<void> updateUserProfile(Map<String, dynamic> data) async {
//     await usersRef.child(data['id']).set(data);
//   }
// }

