import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_manager/utils/srtyles.dart';

class MenuHeaderIcon extends StatelessWidget {
  final Color containerColor;
  final IconData icon;
  final Color iconColor;
  final String title;

  const MenuHeaderIcon(
      {Key? key,
      required this.containerColor,
      required this.icon,
      required this.iconColor,
      required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            child: Icon(icon, size: 3.0.w, color: iconColor),
            width: 8.0.w,
            height: 8.0.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: containerColor)),
        SizedBox(
          height: 3.0.h,
        ),
        Text(
          title,
          style: AppStyles.walkThroughTitleStyle.copyWith(fontSize: 1.6.h),
        )
      ],
    );
  }
}
