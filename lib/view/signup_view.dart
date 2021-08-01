import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:user_manager/model/user_model.dart';
import 'package:user_manager/utils/constants.dart';
import 'package:user_manager/viewModel/profile_view_model.dart';
import 'package:user_manager/viewModel/signup_view_model.dart';
import 'package:user_manager/widgets/base/baseFormWidget.dart';
import 'package:user_manager/widgets/buttons/appRowButton.dart';
import 'package:user_manager/widgets/inputs/appTextInputBorderWidget.dart';
import 'package:user_manager/widgets/text/appTitleSubTitleWidget.dart';

import 'profile_view.dart';

class SignUpSCreen extends StatefulWidget {
  final bool isEdit;
  static final routeName = "sign-up-screen";

  const SignUpSCreen({Key? key, this.isEdit = false}) : super(key: key);
  @override
  _SignUpSCreenState createState() => _SignUpSCreenState();
}

class _SignUpSCreenState extends State<SignUpSCreen> {
  void initState() {
    context.read<SignUpViewModel>().init(formValid: widget.isEdit);
    if (widget.isEdit) {
      final profile = context.read<ProfileViewModel>();
      _firstNameContorller.text = profile.user.firstName;
      _lastNameContorller.text = profile.user.lastName;
      _emailContorller.text = profile.user.email;
      _phoneNumberContorller.text = profile.user.phoneNumber;
      _userNameController.text = profile.user.userName;
      _passwordContorller.text = profile.user.password;
    }
    super.initState();
  }

  TextEditingController _firstNameContorller =
      new TextEditingController(text: "");
  TextEditingController _lastNameContorller =
      new TextEditingController(text: "");
  TextEditingController _emailContorller = new TextEditingController(text: "");
  TextEditingController _phoneNumberContorller =
      new TextEditingController(text: "");
  TextEditingController _passwordContorller =
      new TextEditingController(text: "");
  TextEditingController _userNameController =
      new TextEditingController(text: "");

  Future<void> _addUpdateUser() async {
    final signUpData = Provider.of<SignUpViewModel>(context, listen: false);
    final user = UserModel(
        firstName: _firstNameContorller.text.trim(),
        lastName: _lastNameContorller.text.trim(),
        email: _emailContorller.text.trim(),
        userName: _userNameController.text.trim(),
        phoneNumber: _phoneNumberContorller.text.trim(),
        password: _passwordContorller.text.trim());

    //  Notify.showLoadingSnackBar(context);
    final response = await signUpData.addUpdateUser(
        userData: user.toJson(), isEdit: widget.isEdit);
    if (response.isSucessfull) {
      //show login pop up
      context.read<ProfileViewModel>().updateProfile(response.data);
      if (widget.isEdit) {
        Navigator.of(context).pop();
      } else {
        await context.read<ProfileViewModel>().getUserProfile(
            userName: _userNameController.text.trim(), notify: false);
        Navigator.of(context).pushNamed(ProfileScreen.routeName);
      }
    } else {
      Constants.showErrorWidget(
          context: context, title: "signUp failed", message: response.message);
    }
    //show fail pop up
  }

  _onChange(String value) {
    final signUpData = Provider.of<SignUpViewModel>(context, listen: false);
    signUpData.setFormValid(
      firstName: _firstNameContorller.text,
      lastName: _lastNameContorller.text,
      email: _emailContorller.text,
      phoneNo: _phoneNumberContorller.text,
      password: _passwordContorller.text,
      userName: _userNameController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseFormWidget(
      formWidget: Form(
        child: Consumer<SignUpViewModel>(
          builder: (context, singnUpData, _) => Column(
            children: [
              SizedBox(
                height: 5.0.h,
              ),
              AppTitleSubtitleWidget(
                title: widget.isEdit ? "Update Profile" : "Sign Up",
                subtitle: widget.isEdit
                    ? "Update account details"
                    : "Create New Account",
              ),
              SizedBox(
                height: 3.0.h,
              ),
              AppTextInputBorderWidget(
                  lableText: "First Name",
                  textInputType: TextInputType.text,
                  textEditingController: _firstNameContorller,
                  onChanged: _onChange),
              SizedBox(
                height: 4.0.h,
              ),
              AppTextInputBorderWidget(
                  lableText: "Last Name",
                  textInputType: TextInputType.text,
                  textEditingController: _lastNameContorller,
                  onChanged: _onChange),
              SizedBox(
                height: 4.0.h,
              ),
              AppTextInputBorderWidget(
                  lableText: "Phone",
                  textInputType: TextInputType.phone,
                  textEditingController: _phoneNumberContorller,
                  onChanged: _onChange),
              SizedBox(
                height: 4.0.h,
              ),
              AppTextInputBorderWidget(
                  lableText: "Email",
                  textInputType: TextInputType.emailAddress,
                  textEditingController: _emailContorller,
                  onChanged: _onChange),
              SizedBox(
                height: 4.0.h,
              ),
              AppTextInputBorderWidget(
                  lableText: "Username",
                  textInputType: TextInputType.text,
                  obsure: false,
                  textEditingController: _userNameController,
                  onChanged: _onChange),
              SizedBox(
                height: 4.0.h,
              ),
              AppTextInputBorderWidget(
                  lableText: "Password",
                  textInputType: TextInputType.text,
                  obsure: true,
                  textEditingController: _passwordContorller,
                  onChanged: _onChange),
              SizedBox(
                height: 4.0.h,
              ),
              AppRowButton(
                isDisabled: !singnUpData.isFromValid,
                isLoading: singnUpData.isLoading,
                onTap: () async {
                  await _addUpdateUser();
                },
                title: "Submit",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
