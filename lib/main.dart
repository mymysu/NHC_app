import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_resources_application/provider/dataWater_provider.dart';
import 'package:water_resources_application/provider/user_provider.dart';
import 'package:water_resources_application/screen/screen_data_watersource.dart';
import 'package:water_resources_application/screen/screen_edit_user.dart';
import 'package:water_resources_application/screen/screen_history_add.dart';

import 'package:water_resources_application/screen/screen_home.dart';
import 'package:water_resources_application/screen/screen_login.dart';
import 'package:water_resources_application/screen/screen_register.dart';
import 'package:water_resources_application/screen/screen_reset_email.dart';
import 'package:water_resources_application/screen/screen_selected_typewater.dart';
// import 'package:water_resources_application/screen/test3.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return ErrorWidget(details.exception);
  };
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  List<String>? userlogin = prefs.getStringList('user');

  runApp(MyApp(
    userlogin: userlogin,
  ));
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   systemNavigationBarColor: Colors.pink, // navigation bar color
  //   statusBarColor: Colors.pink, // status bar color
  // ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final userlogin;

  MyApp({required this.userlogin});

  @override
  Widget build(BuildContext context) {
    print(userlogin);
    final Future<FirebaseApp> firebase = Firebase.initializeApp();

    return MultiProvider(
        providers: [
          ChangeNotifierProvider<UserProvider>(
              create: (context) => UserProvider()),
          ChangeNotifierProvider(create: (context) => DataWater())
        ],
        child: Consumer<UserProvider>(
          builder: (context, user, child) => MaterialApp(
            title: 'water source data',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            // home: HomeScreen(title: 'water source data'),

            initialRoute: userlogin == null ? '/login' : '/',
            routes: {
              '/': (context) => HomeScreen(),
              '/login': (context) => LoginScreen(),
              '/register': (context) => RegisterScreen(),
              '/forgotPassword': (context) => ForgotPasswordScreen(),
              '/editUser': (context) => EditUser(),
              '/historyAdd': (context) => HistoryWater(),
              // '/choiceTypeWaterAdd': (context) => ChoiceTypeWaterAdd(),
              '/datawatersource': (context) => Datawatersource()
            },
          ),
        ));
  }
}
