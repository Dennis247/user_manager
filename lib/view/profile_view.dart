import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:user_manager/utils/constants.dart';
import 'package:user_manager/utils/srtyles.dart';
import 'package:user_manager/view/signup_view.dart';
import 'package:user_manager/viewModel/profile_view_model.dart';
import 'package:user_manager/widgets/base/baseBoardWidgetTwo.dart';
import 'package:user_manager/widgets/buttons/appButton.dart';
import 'package:user_manager/widgets/text/menu_header_icon.dart';

class ProfileScreen extends StatelessWidget {
  static final routeName = "profile-screen  ";

  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  _buildProfileTile({required String title, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.appInputLabelTextStyle.copyWith(fontSize: 1.3.h),
        ),
        SizedBox(
          height: 0.7.h,
        ),
        Text(
          value,
          style: AppStyles.appInputTextStyle,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewModel>(builder: (context, profileData, _) {
      return BaseBoardWidgetTwo(
          backGroundColor: Constants.primaryColorDark,
          bottomBar: Padding(
              padding: EdgeInsets.only(
                  left: 7.0.w, right: 7.0.w, bottom: 5.0.h, top: 5.0.h),
              child: AppButton(
                  title: "Edit",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (builder) => SignUpSCreen(
                              isEdit: true,
                            )));
                  })),
          headerHeight: 15.0.h,
          bottomWidget: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 4.0.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MenuHeaderIcon(
                        containerColor: Color(0xffdfffec),
                        icon: FontAwesomeIcons.userAlt,
                        title: "Profile Details",
                        iconColor: Color(0xff00ce54)),
                  ],
                ),
                SizedBox(
                  height: 5.0.h,
                ),
                _buildProfileTile(
                    title: "First Name", value: profileData.user.firstName),
                SizedBox(
                  height: 3.0.h,
                ),
                _buildProfileTile(
                    title: "Last Name", value: profileData.user.lastName),
                SizedBox(
                  height: 3.0.h,
                ),
                _buildProfileTile(
                    title: "Email", value: profileData.user.email),
                SizedBox(
                  height: 3.0.h,
                ),
                _buildProfileTile(
                    title: "Username", value: profileData.user.userName),
                SizedBox(
                  height: 3.0.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Phone No",
                      style: AppStyles.appInputLabelTextStyle
                          .copyWith(fontSize: 1.3.h),
                    ),
                    SizedBox(
                      height: 0.7.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "+234",
                              style: AppStyles.appInputTextStyle
                                  .copyWith(color: Colors.grey.shade500)),
                          TextSpan(
                            text: " - ${profileData.user.phoneNumber}",
                            style: AppStyles.appInputTextStyle,
                          ),
                        ]))
                      ],
                    )
                  ],
                )
              ],
            ),
          ));
    });
  }
}
