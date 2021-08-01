import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_manager/utils/srtyles.dart';

class AppTitleSubtitleWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const AppTitleSubtitleWidget(
      {Key? key, required this.title, required this.subtitle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppStyles.walkThroughTitleStyle,
        ),
        SizedBox(
          height: 3.0.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.0.w),
          child: Text(
            subtitle,
            style: AppStyles.walkThroughSubTitleStyle,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 3.0.h,
        ),
      ],
    );
  }
}
