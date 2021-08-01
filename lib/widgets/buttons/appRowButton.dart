import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'appBottomBackButton.dart';
import 'appButton.dart';

//must be used in a stack widget
class AppRowButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final bool isDisabled;
  final bool isLoading;

  const AppRowButton(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.isDisabled,
      required this.isLoading})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          // SizedBox(
          //   width: 7.0.w,
          // ),
          AppBottomButton(),
          SizedBox(
            width: 3.0.w,
          ),
          Expanded(
            child: AppButton(
                isLoading: isLoading,
                title: title,
                onTap: () => onTap(),
                isDisabled: isDisabled),
          ),
          // SizedBox(
          //   width: 7.0.w,
          // ),
        ],
      ),
      width: 100.0.w,
    );
  }
}
