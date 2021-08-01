import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:user_manager/utils/srtyles.dart';

class AppButton extends StatelessWidget {
  final String title;
  final double? width;
  final double? height;
  final double curveRadius;
  final Function onTap;
  final Color buttonColor;
  final bool isDisabled;
  final Color disabledColor;
  final bool isLoading;
  final TextStyle? textStyle;

  const AppButton({
    Key? key,
    required this.title,
    this.width,
    required this.onTap,
    this.isDisabled = false,
    this.disabledColor = const Color(0xffe6eefc),
    this.buttonColor = const Color(0xff0058e5),
    this.isLoading = false,
    this.height,
    this.curveRadius = 10.0,
    this.textStyle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isDisabled == false ? () => onTap() : null,
      child: Container(
        child: Center(
          //  child: Text(title, style: AppStyles.appLightTextStyle),
          child: isLoading
              ? Lottie.asset("assets/lottie/loader.json")
              : Text(title,
                  style: textStyle == null
                      ? AppStyles.appLightTextStyle
                      : textStyle),
        ),
        width: width == null ? 80.0.w : width,
        height: height == null ? 6.0.h : height,
        decoration: BoxDecoration(
          color: isDisabled == false ? buttonColor : disabledColor,
          borderRadius: BorderRadius.circular(curveRadius),
        ),
      ),
    );
  }
}
