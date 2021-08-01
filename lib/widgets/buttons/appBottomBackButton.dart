import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:user_manager/utils/constants.dart';

class AppBottomButton extends StatelessWidget {
  const AppBottomButton({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        child: Icon(
          FontAwesomeIcons.chevronLeft,
          color: Constants.primaryColorDark,
          size: 2.5.h,
        ),
        height: 6.0.h,
        width: 6.0.h,
        decoration: BoxDecoration(
          color: Constants.whiteBlue,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
