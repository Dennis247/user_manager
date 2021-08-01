import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'constants.dart';

class AppStyles {
  static final appLightTextStyle = GoogleFonts.poppins(
      fontSize: 1.8.h,
      color: Constants.primaryColorLight,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600);

  static final bigMenuTextStyle = GoogleFonts.poppins(
      color: const Color(0xff333333),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 4.0.h);

  static final largeHintTextStyle = GoogleFonts.poppins(
    color: Color(0xffe5e5e5),
    fontSize: 3.0.h,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );

  static final whiteAppTextStyle = GoogleFonts.poppins(
      color: Color(0xffffffff),
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 1.3.h);

  static final tabTextStyle = GoogleFonts.poppins(
    fontSize: 1.5.h,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );

  static final zeroTextStyle = GoogleFonts.poppins(
    color: const Color(0xffffffff),
    fontWeight: FontWeight.w500,
    fontSize: 2.0.h,
    fontStyle: FontStyle.normal,
  );

  static final currencyBigTextStyle = GoogleFonts.poppins(
    color: const Color(0xffffffff),
    fontWeight: FontWeight.w500,
    fontSize: 2.5.h,
    fontStyle: FontStyle.normal,
  );

  static final nairaTextStyle = TextStyle(
      color: const Color(0xffffffff),
      fontWeight: FontWeight.w400,
      fontFamily: "ProductSans",
      fontStyle: FontStyle.normal,
      fontSize: 2.0.h);

  static final smallLightNaira = TextStyle(
      color: Colors.grey.shade400,
      fontWeight: FontWeight.w400,
      fontFamily: "ProductSans",
      fontStyle: FontStyle.normal,
      fontSize: 1.3.h);

  static final appSmallBoldTextStyle = GoogleFonts.poppins(
    color: const Color(0xffffffff),
    fontWeight: FontWeight.w500,
    fontSize: 1.2.h,
    fontStyle: FontStyle.normal,
  );

  static final appSmallBoldBlackTextStyle = GoogleFonts.poppins(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 1.6.h,
    fontStyle: FontStyle.normal,
  );

  static final appBoldBlackTextStyle = GoogleFonts.poppins(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 2.3.h,
    fontStyle: FontStyle.normal,
  );

  static final appNormalackTextStyle = GoogleFonts.poppins(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: 2.0.h,
    fontStyle: FontStyle.normal,
  );

  static final applargeBlackTextStyle = GoogleFonts.poppins(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 3.0.h,
    fontStyle: FontStyle.normal,
  );

  static final applargePrimaryTextStyle = GoogleFonts.poppins(
    color: Constants.primaryColorDark,
    fontWeight: FontWeight.w600,
    fontSize: 3.0.h,
    fontStyle: FontStyle.normal,
  );

  static final symbolTextStyle = TextStyle(
    color: const Color(0xffffffff),
    fontFamily: "ProductSans",
    fontWeight: FontWeight.w500,
    //   fontSize: 1.2.h,
    fontStyle: FontStyle.normal,
  );

  static final appInputTextStyle = GoogleFonts.poppins(
    color: Colors.black,
    fontSize: 2.0.h,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
  );

  static final appLightInputTextStyle = GoogleFonts.poppins(
    color: Colors.black,
    fontSize: 2.0.h,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );

  static final appInputLabelTextStyle = GoogleFonts.poppins(
    color: Constants.inputLableColor,
    fontSize: 1.6.h,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  static final appInputHintTextStyle = GoogleFonts.poppins(
    color: Constants.borderColor,
    fontSize: 1.6.h,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  static final appInputGreyTextStyle = GoogleFonts.poppins(
    color: Colors.grey.shade500,
    fontSize: 1.7.h,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  static final appSmallDarkTextStyle = GoogleFonts.poppins(
      fontSize: 1.5.h,
      color: Constants.primaryColorDark,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600);

  static final appSmallBlackTextStyle = GoogleFonts.poppins(
      fontSize: 1.5.h,
      color: Constants.darkTextColor,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600);

  static final appBlackTextStyle = GoogleFonts.poppins(
      fontSize: 1.3.h,
      color: Constants.darkTextColor,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500);

  static final appMediumTextStyle = GoogleFonts.poppins(
      fontSize: 1.6.h,
      color: Colors.black,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500);

  static final walkThroughTitleStyle = GoogleFonts.poppins(
      fontSize: 2.0.h,
      color: Constants.darkTextColor,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600);

  static final displayhintTitleStyle = GoogleFonts.poppins(
      fontSize: 1.8.h,
      color: Constants.borderColor,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600);

  static final walkThroughSubTitleStyle = GoogleFonts.poppins(
      fontSize: 1.5.h,
      color: Constants.darkTextColor,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500);

  static final errorTextStyle = GoogleFonts.poppins(
      fontSize: 1.4.h,
      color: Colors.red,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400);

  static final termsTextStyle = GoogleFonts.poppins(
    color: Color(0xff0058e5),
    fontSize: 1.4.h,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );

  static final termsBoldTextStyle = GoogleFonts.poppins(
    color: Color(0xff0058e5),
    fontSize: 1.5.h,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );

  static final currencyTextStyle = GoogleFonts.poppins(
    color: Color(0xff333333),
    fontSize: 2.0.h,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );

  static final lightCurrencyTextStyle = GoogleFonts.poppins(
    color: Color(0xff333333),
    fontSize: 2.0.h,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  static final mediumCurrecyTextStyle = GoogleFonts.poppins(
      color: Constants.darkTextColor,
      fontSize: 2.0.h,
      fontWeight: FontWeight.w600);

  static final smallGreyCurrencyTextStyle = GoogleFonts.poppins(
      color: Colors.grey.shade400,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 1.5.h);

  static final smallGreyCurrencyTextStyle2 = TextStyle(
      color: Colors.grey.shade400,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 1.5.h);

  static final verySmallCardyTextStyle = GoogleFonts.poppins(
      color: Color(0xffafceff),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 1.2.h);

  static final smallCurrencySymbolTextStyle = TextStyle(
      color: Colors.grey.shade400,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 1.4.h);
}
