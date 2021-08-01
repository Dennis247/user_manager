import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:user_manager/utils/constants.dart';
import 'package:user_manager/view/home_view.dart';
import 'package:user_manager/view/login_view.dart';
import 'package:user_manager/view/profile_view.dart';
import 'package:user_manager/view/signup_view.dart';
import 'package:user_manager/viewModel/login_view_model.dart';
import 'package:user_manager/viewModel/profile_view_model.dart';
import 'package:user_manager/viewModel/signup_view_model.dart';

import 'utils/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    setupLocator();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => LoginViewModel()),
            ChangeNotifierProvider(create: (context) => ProfileViewModel()),
            ChangeNotifierProvider(create: (context) => SignUpViewModel()),
          ],
          child: MaterialApp(
            title: 'User Manager',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Constants.primaryColorDark,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: LoginScreen(),
            routes: {
              LoginScreen.routeName: (context) => LoginScreen(),
              SignUpSCreen.routeName: (context) => SignUpSCreen(),
              ProfileScreen.routeName: (context) => ProfileScreen()
            },
          ),
        );
      },
    );
  }
}
