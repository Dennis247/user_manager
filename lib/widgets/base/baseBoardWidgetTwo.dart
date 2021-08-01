import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_manager/utils/constants.dart';

class BaseBoardWidgetTwo extends StatelessWidget {
  final Widget? topWidget;
  final Widget? bottomWidget;
  final Color? backGroundColor;
  final double? headerHeight;
  final Widget? bottomBar;
  final double curveRadius;

  const BaseBoardWidgetTwo({
    Key? key,
    this.topWidget,
    this.bottomWidget,
    this.backGroundColor,
    this.headerHeight,
    this.bottomBar,
    this.curveRadius = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.primaryColorLight,
        body: Stack(
          children: [
            Container(
              width: 100.0.w,
              height: 40.0.h,
              decoration: BoxDecoration(
                  color: backGroundColor,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/Bckgrnd Tile.png'))),
            ),
            Container(
              height: 100.0.h,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: Colors.transparent,
                      height: headerHeight == null ? 35.0.h : headerHeight,
                      child: topWidget,
                    ),
                    Container(
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 7.0.w),
                            child: bottomWidget),
                        width: 100.0.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(curveRadius),
                            topRight: Radius.circular(curveRadius),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: bottomBar,
      ),
    );
  }
}
