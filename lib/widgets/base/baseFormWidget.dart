import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_manager/utils/constants.dart';

class BaseFormWidget extends StatelessWidget {
  final Widget formWidget;
  final Widget? navigatorWidget;
  // final Function function;
  //final double buttonBaseHeight;
  // final String buttonTitle;

  const BaseFormWidget({
    Key? key,
    required this.formWidget,
    this.navigatorWidget,
    //    @required this.function,
    //  this.buttonBaseHeight,
    //  @required this.buttonTitle
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              width: 100.0.w,
              height: 15.0.h,
              decoration: BoxDecoration(
                  color: Constants.primaryColorDark,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/Bckgrnd Tile.png"))),
            ),
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 10.0.h,
                      color: Colors.transparent,
                    ),
                    Container(
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 7.0.w),
                            child: formWidget),
                        width: 100.0.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35),
                          ),
                        )),
                    SizedBox(
                      height: 10.0.h,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: navigatorWidget,
      ),
    );
  }
}
