import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:user_manager/utils/constants.dart';
import 'package:user_manager/utils/srtyles.dart';
import 'package:user_manager/view/profile_view.dart';
import 'package:user_manager/viewModel/login_view_model.dart';
import 'package:user_manager/viewModel/profile_view_model.dart';
import 'package:user_manager/widgets/buttons/appButton.dart';
import 'package:user_manager/widgets/inputs/appTextInputBorderWidget.dart';
import 'package:user_manager/widgets/text/appTitleSubTitleWidget.dart';

import 'signup_view.dart';

class LoginScreen extends StatefulWidget {
  static final routeName = "login-screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController _usernameController =
      new TextEditingController(text: "");
  TextEditingController _passwordController =
      new TextEditingController(text: "");

  _onChange(String value) {
    final loginData = Provider.of<LoginViewModel>(context, listen: false);
    loginData.setFormValid(
        userName: _usernameController.text, password: _passwordController.text);
  }

  Future<void> _loginUser() async {
    final loginVM = context.read<LoginViewModel>();
    _passwordController.text = "";
    final response = await loginVM.loginUser(
        userName: _usernameController.text.trim(),
        password: _passwordController.text);

    if (response.isSucessfull) {
      context
          .read<LoginViewModel>()
          .setFormValid(userName: _usernameController.text, password: "");

      context.read<ProfileViewModel>().getUserProfile(
          userName: _usernameController.text.trim(), notify: false);
      Navigator.of(context).pushNamed(ProfileScreen.routeName);
    } else {
      Constants.showErrorWidget(
          context: context, title: "logon failed", message: response.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
      builder: (context, loginData, _) => Scaffold(
        body: Container(
          width: 100.0.w,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.0.w, vertical: 10.0.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 5.0.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () => Navigator.of(context)
                            .pushNamed(SignUpSCreen.routeName),
                        child: Text(
                          "Sign Up",
                          style: AppStyles.walkThroughTitleStyle
                              .copyWith(color: Constants.primaryColorDark),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.0.h,
                  ),
                  AppTitleSubtitleWidget(
                    title: "Login",
                    subtitle: "Let's help you to get started today",
                  ),
                  SizedBox(
                    height: 2.0.h,
                  ),
                  AppTextInputBorderWidget(
                      textEditingController: _usernameController,
                      lableText: "Username/Email",
                      onChanged: _onChange,
                      textInputType: TextInputType.text),
                  SizedBox(
                    height: 3.0.h,
                  ),
                  AppTextInputBorderWidget(
                    lableText: "Password",
                    textEditingController: _passwordController,
                    textInputType: TextInputType.text,
                    obsure: true,
                    onChanged: _onChange,
                  ),
                  SizedBox(
                    height: 3.2.h,
                  ),
                  TextButton(
                    onPressed: () => null,
                    child: Text(
                      "Forgot Username/Password",
                      style: AppStyles.walkThroughTitleStyle.copyWith(
                          color: Constants.primaryColorDark, fontSize: 1.5.h),
                    ),
                  ),
                  SizedBox(
                    height: 15.0.h,
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomSheet: Container(
          margin: EdgeInsets.only(bottom: 30, top: 0),
          width: 100.0.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 7.0.w,
              ),
              Expanded(
                child: AppButton(
                    isLoading: loginData.isLoading,
                    isDisabled: !loginData.isFromValid,
                    title: "Login",
                    onTap: _loginUser),
              ),
              SizedBox(
                width: 7.0.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
