import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:water_resources_application/provider/user_provider.dart';
import 'package:water_resources_application/size_configs.dart';

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
  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 5), child: Text("รอสักครู่.....")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

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
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                        ),
                        Center(
                          child: SizedBox(
                            width: 180,
                            child: Image.asset('assets/images/logo2.png'),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "ยินดีต้อนรับ",
                          style: GoogleFonts.prompt(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[800],
                          ),
                        ),
                        Text(
                          "เข้าสู่ระบบ",
                          style: GoogleFonts.prompt(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  style: TextStyle(color: Colors.blueAccent),
                                  cursorColor: Colors.blueAccent,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  decoration: InputDecoration(
                                    fillColor: Colors.blueAccent,
                                    labelText: 'อีเมล',
                                    labelStyle: GoogleFonts.prompt(
                                        color: Colors.blueAccent),
                                    prefixIcon: const Icon(
                                      Icons.email,
                                      color: Colors.blueAccent,
                                    ),
                                    enabledBorder: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                          color: Colors.blueAccent, width: 3),
                                    ),
                                    focusedBorder: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                          color: Colors.orange, width: 3),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: 'กรุณาป้อนอีเมล'),
                                    EmailValidator(errorText: 'อีเมลไม่ถูกต้อง')
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
                                  style: TextStyle(color: Colors.blueAccent),
                                  cursorColor: Colors.white,
                                  decoration: InputDecoration(
                                    labelText: 'รหัสผ่าน',
                                    labelStyle: GoogleFonts.prompt(
                                        color: Colors.blueAccent),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.blueAccent,
                                    ),
                                    enabledBorder: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                          color: Colors.blueAccent, width: 3),
                                    ),
                                    focusedBorder: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                          color: Colors.orange, width: 3),
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
                                Container(
                                  alignment: Alignment.bottomRight,
                                  child: FlatButton(
                                    onPressed: () async {
                                      Navigator.pushReplacementNamed(
                                          context, '/forgotPassword');
                                    },
                                    child: Text(
                                      'ลืมรหัสผ่าน ?',
                                      style: GoogleFonts.prompt(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueAccent),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  // alignment: Alignment.center,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 40.0, vertical: 8.0),
                                      primary: Color(0xFFFA7D00),
                                      shape: StadiumBorder(
                                          side: BorderSide(
                                              color: Color(0xFFFA7D00),
                                              width: 1)),
                                    ),
                                    onPressed: () async {
                                      if (formKey.currentState!.validate()) {
                                        formKey.currentState!.save();
                                        try {
                                          showAlertDialog(context);
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
                                                .userProfile.firstName);
                                            print("\n\n");
                                            Navigator.pop(context);
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
                                      'เข้าสู่ระบบ',
                                      style: GoogleFonts.prompt(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  'ยังไม่ได้สมัครสมาชิก ?',
                                  style: GoogleFonts.prompt(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueAccent),
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
                                    child: Text(
                                      'สมัครสมาชิก',
                                      style: GoogleFonts.prompt(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
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
                      ]),
                ),
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
