import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_resources_application/model/profile.dart';
import 'package:water_resources_application/provider/user_provider.dart';
import 'package:water_resources_application/screen/home.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String dropdownValue = 'อสม';
  Profile profile = Profile();
  final formKey = GlobalKey<FormState>();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  UserProvider userProvider = UserProvider();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

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
              backgroundColor: Color(0xFF11048B),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(height: 150
                        // decoration: BoxDecoration(
                        //   image: DecorationImage(
                        //       fit: BoxFit.cover,
                        //       image: AssetImage('assets/images/slide-hii-2.jpeg'),
                        //       colorFilter: ColorFilter.mode(
                        //           Colors.black54, BlendMode.colorBurn)),
                        // ),
                        ),
                    Stack(children: [
                      Container(
                        alignment: Alignment(200, 100),
                        // margin: EdgeInsets.only(top: 100),
                        height: height - 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                      ),
                      Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Center(
                                  child: Text(
                                "ข้อมูลส่วนตัว",
                                style: GoogleFonts.prompt(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF11048B),
                                ),
                              )),
                              SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                child: TextFormField(
                                  style: GoogleFonts.prompt(
                                    color: Color(0xFF11048B),
                                  ),
                                  cursorColor: Color(0xFF11048B),
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  decoration: InputDecoration(
                                    fillColor: Color(0xFF11048B),
                                    labelText: 'ชื่อจริง',
                                    labelStyle:
                                        TextStyle(color: Color(0xFF11048B)),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Color(0xFF11048B),
                                    ),
                                    enabledBorder: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(25.0),
                                      borderSide:
                                          BorderSide(color: Colors.blueAccent),
                                    ),
                                    focusedBorder: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(25.0),
                                      borderSide:
                                          BorderSide(color: Colors.blueAccent),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: 'กรุณากรอกชื่อจริง'),
                                  ]),
                                  keyboardType: TextInputType.emailAddress,
                                  onSaved: (value) {
                                    profile.firstName = value!;
                                    // print(value);
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                width: height,
                                child: TextFormField(
                                  style: GoogleFonts.prompt(
                                    color: Color(0xFF11048B),
                                  ),
                                  cursorColor: Color(0xFF11048B),
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  decoration: InputDecoration(
                                    fillColor: Color(0xFF11048B),
                                    labelText: 'นามสกุล',
                                    labelStyle:
                                        TextStyle(color: Color(0xFF11048B)),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Color(0xFF11048B),
                                    ),
                                    enabledBorder: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(25.0),
                                      borderSide:
                                          BorderSide(color: Colors.blueAccent),
                                    ),
                                    focusedBorder: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(25.0),
                                      borderSide:
                                          BorderSide(color: Colors.blueAccent),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: 'กรุณากรอกนามสกุล'),
                                  ]),
                                  keyboardType: TextInputType.emailAddress,
                                  onSaved: (value) {
                                    profile.lastName = value!;
                                    // print(value);
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                style: GoogleFonts.prompt(
                                  color: Color(0xFF11048B),
                                ),
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  labelStyle: GoogleFonts.prompt(
                                    color: Color(0xFF11048B),
                                  ),
                                  labelText: 'อีเมล',
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Color(0xFF11048B),
                                  ),
                                  enabledBorder: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(25.0),
                                    borderSide:
                                        BorderSide(color: Colors.blueAccent),
                                  ),
                                  focusedBorder: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(25.0),
                                    borderSide:
                                        BorderSide(color: Colors.blueAccent),
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
                                height: 10,
                              ),
                              TextFormField(
                                style: GoogleFonts.prompt(
                                  color: Color(0xFF11048B),
                                ),
                                cursorColor: Color(0xFF11048B),
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  labelText: 'เบอร์มือถือ',
                                  labelStyle: GoogleFonts.prompt(
                                    color: Color(0xFF11048B),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.phone_android,
                                    color: Color(0xFF11048B),
                                  ),
                                  enabledBorder: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(25.0),
                                    borderSide:
                                        BorderSide(color: Colors.blueAccent),
                                  ),
                                  focusedBorder: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(25.0),
                                    borderSide:
                                        BorderSide(color: Colors.blueAccent),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                validator: (value) {
                                  if (((value!.length < 10 ||
                                          (value.length > 11))) &&
                                      value.isNotEmpty) {
                                    return "กรุณากรอกเบอร์โทรติดต่อให้ถูกต้อง";
                                  }
                                  if (value.isEmpty) {
                                    return "กรุณากรอกเบอร์โทรติดต่อ";
                                  }
                                },
                                keyboardType: TextInputType.number,
                                onSaved: (value) {
                                  profile.mobileNumber = value;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                style: GoogleFonts.prompt(
                                  color: Color(0xFF11048B),
                                ),
                                cursorColor: Color(0xFF11048B),
                                decoration: InputDecoration(
                                  labelText: 'รหัสผ่าน',
                                  labelStyle: GoogleFonts.prompt(
                                    color: Color(0xFF11048B),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Color(0xFF11048B),
                                  ),
                                  enabledBorder: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(25.0),
                                    borderSide:
                                        BorderSide(color: Colors.blueAccent),
                                  ),
                                  focusedBorder: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(25.0),
                                    borderSide:
                                        BorderSide(color: Colors.blueAccent),
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
                                  child: DropdownButtonFormField<String>(
                                value: dropdownValue,
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Color(0xFF11048B),
                                  size: 20.09,
                                ),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'ตำแหน่งหน่วยงาน',
                                  labelStyle: GoogleFonts.prompt(
                                    color: Color(0xFF11048B),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.supervised_user_circle,
                                    color: Color(0xFF11048B),
                                  ),
                                  enabledBorder: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(25.0),
                                    borderSide:
                                        BorderSide(color: Colors.blueAccent),
                                  ),
                                  focusedBorder: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(25.0),
                                    borderSide:
                                        BorderSide(color: Colors.blueAccent),
                                  ),
                                ),
                                iconSize: 24,
                                elevation: 16,
                                style: GoogleFonts.prompt(
                                  color: Color(0xFF11048B),
                                ),
                                dropdownColor: Colors.white,
                                isExpanded: true,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                  });
                                },
                                onSaved: (value) {
                                  profile.position = value;
                                },
                                items: <String>[
                                  'ผู้นำชุมชน ',
                                  'เจ้าหน้าที่สสน',
                                  'อสม',
                                  'เจ้าชาวบ้านทั่วไป',
                                  'เจ้าหน้าที่อบต',
                                  'เจ้าหน้าที่อำเภอ',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              )),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                // width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 40.0, vertical: 15.0),
                                    primary: Color(0xFF11048B),
                                    shape: StadiumBorder(),
                                  ),
                                  child: Text(
                                    'ลงทะเบียน',
                                    style: GoogleFonts.prompt(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      formKey.currentState!.save();
                                      print(profile);
                                      try {
                                        await FirebaseAuth.instance
                                            .createUserWithEmailAndPassword(
                                                email: profile.email!,
                                                password: profile.password!)
                                            .then((value) {
                                          profile.uid = value.user?.uid;
                                          print(profile.uid);
                                          userProvider
                                              .addProfileToFirestore(profile);
                                          Fluttertoast.showToast(
                                              msg:
                                                  "สร้างบัญชีผู้ใช้เรียบร้อยแล้ว",
                                              gravity: ToastGravity.CENTER);
                                          formKey.currentState!.reset();
                                          Navigator.pushReplacement(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return HomeScreen();
                                          }));
                                        });
                                      } on FirebaseAuthException catch (e) {
                                        // print(e.code);
                                        // print(e.message);

                                        String message = '';
                                        if (e.code == 'email-already-in-use') {
                                          message =
                                              "อีเมลนี้เป็นสมาชิกของระบบแล้ว กรุณาใช้อีเมลอื่น";
                                        } else if (e.code == 'weak-password') {
                                          message =
                                              "รหัสผ่านต้องมีความยาวเกิน 6 ตัวอักษรขึ้นไป";
                                        } else {
                                          message = e.message!;
                                        }

                                        Fluttertoast.showToast(
                                            msg: message,
                                            gravity: ToastGravity.CENTER);
                                      }
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ])
                  ],
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
