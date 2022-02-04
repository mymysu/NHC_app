import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:water_resources_application/provider/dataWater_provider.dart';
import 'package:water_resources_application/provider/user_provider.dart';

import 'package:water_resources_application/screen/home.dart';
import 'package:water_resources_application/screen/login.dart';
import 'package:water_resources_application/screen/register.dart';
import 'package:water_resources_application/screen/reset_email.dart';
// import 'package:water_resources_application/screen/test3.dart';

void main() {
  runApp(MyApp());
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   systemNavigationBarColor: Colors.pink, // navigation bar color
  //   statusBarColor: Colors.pink, // status bar color
  // ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
            create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => DataWater())
      ],
      child: MaterialApp(
        title: 'water source data',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: HomeScreen(title: 'water source data'),
        initialRoute: '/login',
        routes: {
          '/': (context) => HomeScreen(),
          '/login': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
          '/forgotPassword': (context) => ForgotPasswordScreen(),
        },
      ),
    );
  }
}
