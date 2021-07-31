import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:user_manager/utils/constants.dart';
import 'package:user_manager/view/home_view.dart';
import 'package:user_manager/viewModel/login_view_model.dart';

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
    super.initState();
  }

  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => LoginViewModel()),
          ],
          child: MaterialApp(
            title: 'User Manager',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Constants.primaryColorDark,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: HomeView(),
            routes: {
              // WalkThroughScreen.routeName: (context) => WalkThroughScreen(),
            },
          ),
        );
      },
    );
  }
}
