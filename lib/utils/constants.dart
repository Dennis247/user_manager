import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:user_manager/model/base_response.dart';
import 'package:user_manager/utils/srtyles.dart';
import 'package:sizer/sizer.dart';

class Constants {
  static final Color primaryColorDark = Color(0xff4285f4);
  static final Color primaryColorLight = Color(0xffffffff);
  static final Color whiteBlue = Color(0xffd8e5f9);
  static final Color darkWhiteBlue = Color(0xffb3cdf7);
  static final Color darkTextColor = Color(0xff333333);
  static final borderColor = Color(0xffe5e5e5);
  static final whiteColor = Color(0xffffffff);
  static final purpleBlue = Color(0xff345d9d);
  static final Color inputLableColor = Color(0xff333333);
  static getBaseException(String message) {
    return BaseResponse(isSucessfull: false, message: message, data: null);
  }

  static showErrorWidget(
      {required BuildContext context,
      required String title,
      required String message}) {
    CherryToast.error(
            borderRadius: 10,
            title: title,
            displayTitle: true,
            titleStyle:
                AppStyles.walkThroughTitleStyle.copyWith(fontSize: 1.7.h),
            descriptionStyle: AppStyles.errorTextStyle,
            description: message,
            layout: TOAST_LAYOUT.LTR,
            animationType: ANIMATION_TYPE.FROM_RIGHT,
            animationDuration: Duration(milliseconds: 1000),
            autoDismiss: true)
        .show(context);
  }
}
