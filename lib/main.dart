import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_resources_application/provider/dataWater_provider.dart';
import 'package:water_resources_application/provider/user_provider.dart';
import 'package:water_resources_application/screen/screen_data_watersource.dart';
import 'package:water_resources_application/screen/screen_edit_user.dart';
import 'package:water_resources_application/screen/screen_history_add.dart';
import 'package:water_resources_application/screen/screen_home.dart';
import 'package:water_resources_application/screen/screen_login.dart';
import 'package:water_resources_application/screen/screen_more.dart';
import 'package:water_resources_application/screen/screen_register.dart';
import 'package:water_resources_application/screen/screen_reset_email.dart';
import 'package:water_resources_application/screen/screen_start_add_water.dart';
import 'package:water_resources_application/screen/screen_user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  // FirebaseAppCheck.instance.activate.call();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp();

  @override
  Widget build(BuildContext context) {
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
            initialRoute: '/login',
            routes: {
              '/': (context) => HomeScreen(),
              '/login': (context) => LoginScreen(),
              '/register': (context) => RegisterScreen(),
              '/forgotPassword': (context) => ForgotPasswordScreen(),
              '/editUser': (context) => EditUser(),
              '/dataUser': (context) => DataUser(),
              '/historyAdd': (context) => HistoryWater(),
              '/addBeginDatawatersource': (context) => BeginAddwater(),
              '/more': (context) => MoreScreen(),
              '/datawatersource': (context) => Datawatersource()
            },
          ),
        ));
  }
}
