import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:water_resources_application/provider/user_provider.dart';

class LoginProfile {
  late String email;
  late String password;
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  LoginProfile profile = LoginProfile();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  UserProvider userProvider = UserProvider();

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Error'),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Stack(children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                          colorFilter: ColorFilter.mode(
                              Colors.black54, BlendMode.colorBurn)),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Form(
                            key: formKey,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Center(
                                    child: Text(
                                      "เข้าสู่ระบบ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 25),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    cursorColor: Colors.white,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      labelText: 'อีเมล',
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      prefixIcon: Icon(
                                        Icons.email,
                                        color: Colors.white,
                                      ),
                                      enabledBorder: new OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(25.0),
                                        borderSide: BorderSide(
                                            color: Colors.blueAccent),
                                      ),
                                      focusedBorder: new OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(25.0),
                                        borderSide: BorderSide(
                                            color: Colors.blueAccent),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    validator: MultiValidator([
                                      RequiredValidator(
                                          errorText: 'กรุณาป้อนอีเมล'),
                                      EmailValidator(
                                          errorText: 'อีเมลไม่ถูกต้อง')
                                    ]),
                                    keyboardType: TextInputType.emailAddress,
                                    onSaved: (value) {
                                      profile.email = value!;
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    cursorColor: Colors.white,
                                    decoration: InputDecoration(
                                      labelText: 'รหัสผ่าน',
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Colors.white,
                                      ),
                                      enabledBorder: new OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(25.0),
                                        borderSide: BorderSide(
                                            color: Colors.blueAccent),
                                      ),
                                      focusedBorder: new OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(25.0),
                                        borderSide: BorderSide(
                                            color: Colors.blueAccent),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    validator: RequiredValidator(
                                        errorText: 'กรุณาป้อนรหัสผ่าน'),
                                    obscureText: true,
                                    onSaved: (value) {
                                      profile.password = value!;
                                    },
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 40.0, vertical: 8.0),
                                        primary: Colors.white,
                                        shape: StadiumBorder(
                                            side: BorderSide(
                                                color: Colors.white, width: 1)),
                                      ),
                                      onPressed: () async {
                                        if (formKey.currentState!.validate()) {
                                          formKey.currentState!.save();
                                          try {
                                            await FirebaseAuth.instance
                                                .signInWithEmailAndPassword(
                                                    email: profile.email,
                                                    password: profile.password)
                                                .then((value) {
                                              userProvider
                                                  .getProfileFromFirestore(
                                                      value.user?.uid);

                                              formKey.currentState!.reset();
                                              print("\n");
                                              print(userProvider
                                                  .userProfile.fullName);
                                              print("\n\n");
                                              Navigator.pushReplacementNamed(
                                                  context, '/');
                                            });
                                          } on FirebaseAuthException catch (e) {
                                            print(e.code);
                                            Fluttertoast.showToast(
                                                msg: e.message!,
                                                gravity: ToastGravity.CENTER);
                                          }
                                        }
                                      },
                                      child: Text(
                                        'ลงชื่อเข้าระบบ',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueAccent),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 40.0, vertical: 8.0),
                                        primary: Colors.white,
                                        shape: StadiumBorder(
                                            side: BorderSide(
                                                color: Colors.white, width: 1)),
                                      ),
                                      onPressed: () async {
                                        Navigator.pushReplacementNamed(
                                            context, '/forgotPassword');
                                      },
                                      child: Text(
                                        'ลืมรหัสผ่าน',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueAccent),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    'ยังไม่ได้สมัครสมาชิก ?',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 40.0, vertical: 10.0),
                                        primary: Colors.blueAccent,
                                        shape: StadiumBorder(),
                                      ),
                                      child: Text('สมัครสมาชิก'),
                                      onPressed: () {
                                        Navigator.pushReplacementNamed(
                                            context, '/register');
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        });
  }
}
