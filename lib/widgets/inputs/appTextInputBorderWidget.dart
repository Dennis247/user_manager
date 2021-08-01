import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_manager/utils/constants.dart';
import 'package:user_manager/utils/srtyles.dart';

class AppTextInputBorderWidget extends StatelessWidget {
  final String lableText;
  final String hintText;
  final TextInputType textInputType;
  final bool obsure;
  final TextEditingController? textEditingController;
  final int? inputLimit;
  final Function? onChanged;
  final TextInputFormatter? inputFormatter;
  final bool readOnly;
  final int maxLines;
  final Widget? prefix;
  final Widget? suffixWidget;
  final String? suffixText;

  const AppTextInputBorderWidget({
    Key? key,
    required this.lableText,
    required this.textInputType,
    this.obsure = false,
    this.textEditingController,
    this.inputLimit,
    this.onChanged,
    this.inputFormatter,
    this.readOnly = true,
    this.hintText = "",
    this.maxLines = 1,
    this.prefix,
    this.suffixText,
    this.suffixWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppStyles.appInputTextStyle,
      keyboardType: textInputType,
      obscureText: obsure,
      maxLength: inputLimit,
      onChanged: (value) {
        onChanged!(value);
      },
      enabled: readOnly,
      maxLines: maxLines,
      controller: textEditingController,
      decoration: new InputDecoration(
          counterText: "",
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Constants.borderColor, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: Constants.borderColor, width: 1.0),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: Constants.borderColor, width: 1.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: Constants.borderColor, width: 1.0),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
          labelText: lableText,
          hintText: hintText,
          prefix: prefix,
          suffixText: suffixText,
          suffixStyle: AppStyles.appInputHintTextStyle,
          hintStyle: AppStyles.appInputHintTextStyle,
          suffix: suffixWidget,
          labelStyle: AppStyles.appInputLabelTextStyle),
    );
  }
}
