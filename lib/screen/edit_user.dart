import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:water_resources_application/model/profile.dart';
import 'package:water_resources_application/provider/user_provider.dart';
import 'package:water_resources_application/screen/home.dart';

class EditUser extends StatelessWidget {
  const EditUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'อสม';
    Profile profile = Profile();
    final formKey = GlobalKey<FormState>();
    final Future<FirebaseApp> firebase = Firebase.initializeApp();
    UserProvider userProvider = UserProvider();

    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Error'),
                leading: IconButton(
                  padding: EdgeInsets.only(left: 20.0),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                  ),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.pushNamed(context, "/");
                  },
                ),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  padding: EdgeInsets.only(left: 20.0),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                  ),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.pushNamed(context, "/");
                  },
                ),
              ),
              body: SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/slide-hii-2.jpeg'),
                            colorFilter: ColorFilter.mode(
                                Colors.black54, BlendMode.colorBurn)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              Center(
                                child: Text(
                                  "แก้ไขข้อมูลส่วนตัว",
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
                                  labelText: 'ชื่อ นาม-สกุล',
                                  labelStyle: TextStyle(color: Colors.white),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.white,
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
                                      errorText: 'กรุณากรอกชื่อนาม-สกุล'),
                                ]),
                                keyboardType: TextInputType.emailAddress,
                                onSaved: (value) {
                                  profile.firstName = value!;
                                  // print(value);
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                style: TextStyle(color: Colors.white),
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  labelStyle: TextStyle(color: Colors.white),
                                  labelText: 'อีเมล',
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.white,
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
                                style: TextStyle(color: Colors.white),
                                cursorColor: Colors.white,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  labelText: 'เบอร์มือถือ',
                                  labelStyle: TextStyle(color: Colors.white),
                                  prefixIcon: Icon(
                                    Icons.phone_android,
                                    color: Colors.white,
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
                                style: TextStyle(color: Colors.white),
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  labelText: 'รหัสผ่าน',
                                  labelStyle: TextStyle(color: Colors.white),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.white,
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
                                  color: Colors.white,
                                  size: 20.09,
                                ),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'ตำแหน่งหน่วยงาน',
                                  labelStyle: TextStyle(color: Colors.white),
                                  prefixIcon: const Icon(
                                    Icons.supervised_user_circle,
                                    color: Colors.white,
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
                                style: const TextStyle(color: Colors.white),
                                dropdownColor: Colors.blueGrey,
                                isExpanded: true,
                                onChanged: (String? newValue) {
                                  // setState(() {
                                  //   dropdownValue = newValue!;
                                  // });
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
                                height: 10,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 40.0, vertical: 15.0),
                                    primary: Colors.blueAccent,
                                    shape: StadiumBorder(),
                                  ),
                                  child: Text(
                                    'บันทึกการแก้ไข',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () async {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                              title: const Text(
                                                  'ข้อมูลที่จะอัปเดต'),
                                              content: Text(
                                                  'ชื่อ : \nเบอร์โทร : \n'),
                                              actions: <Widget>[
                                                ButtonBar(
                                                    alignment:
                                                        MainAxisAlignment.end,
                                                    children: <Widget>[
                                                      RaisedButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        color: Colors.red,
                                                        child: Text(
                                                          'ยกเลิก',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                      RaisedButton(
                                                        onPressed: () => {},
                                                        color: Colors.green,
                                                        child: Text(
                                                          'ยืนยัน',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ])
                                              ],
                                            ));
                                  },
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
                                        horizontal: 40.0, vertical: 15.0),
                                    primary: Colors.blueAccent,
                                    shape: StadiumBorder(),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'ยกเลิก',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          )),
                    )
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
