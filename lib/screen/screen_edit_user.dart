import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:water_resources_application/model/profile.dart';
import 'package:water_resources_application/provider/user_provider.dart';
import 'package:water_resources_application/screen/screen_home.dart';

class EditUser extends StatelessWidget {
  const EditUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Profile profile = Profile();
    final formKey = GlobalKey<FormState>();
    final Future<FirebaseApp> firebase = Firebase.initializeApp();
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: true);
    String? dropdownValue = userProvider.userProfile.position;
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
                  color: Colors.amber,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            print(userProvider.userProfile.position);
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blueAccent[700],
                leading: IconButton(
                  padding: EdgeInsets.only(left: 20.0),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                  ),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              body: SingleChildScrollView(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Center(
                                child: Text(
                                  "แก้ไขข้อมูลส่วนตัว",
                                  style: GoogleFonts.prompt(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent.shade700,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 5),
                                child: Text(
                                  "ชื่อจริง",
                                  style: GoogleFonts.prompt(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent[700],
                                  ),
                                ),
                              ),
                              TextFormField(
                                style: GoogleFonts.prompt(
                                    color: Colors.blueAccent.shade700),
                                cursorColor: Colors.blueAccent.shade700,
                                enableSuggestions: false,
                                autocorrect: false,
                                initialValue:
                                    "${userProvider.userProfile.firstName}",
                                decoration: InputDecoration(
                                  fillColor: Colors.blueAccent.shade700,
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.blueAccent.shade700,
                                  ),
                                  enabledBorder: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.blueAccent),
                                  ),
                                  focusedBorder: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: Colors.orangeAccent.shade700),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: 'กรุณากรอกชื่อจริง'),
                                ]),
                                keyboardType: TextInputType.text,
                                onSaved: (value) {
                                  profile.firstName = value!;
                                  // print(value);
                                },
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 5),
                                child: Text(
                                  "นามสกุล",
                                  style: GoogleFonts.prompt(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent[700],
                                  ),
                                ),
                              ),
                              TextFormField(
                                style: GoogleFonts.prompt(
                                    color: Colors.blueAccent.shade700),
                                cursorColor: Colors.blueAccent.shade700,
                                enableSuggestions: false,
                                autocorrect: false,
                                initialValue:
                                    "${userProvider.userProfile.lastName}",
                                decoration: InputDecoration(
                                  fillColor: Colors.blueAccent.shade700,
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.blueAccent.shade700,
                                  ),
                                  enabledBorder: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.blueAccent),
                                  ),
                                  focusedBorder: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: Colors.orangeAccent.shade700),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: 'กรุณากรอกชื่อนาม-สกุล'),
                                ]),
                                keyboardType: TextInputType.text,
                                onSaved: (value) {
                                  profile.lastName = value!;
                                  // print(value);
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 5),
                                child: Text(
                                  "เบอร์โทรศัพท์",
                                  style: GoogleFonts.prompt(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent[700],
                                  ),
                                ),
                              ),
                              TextFormField(
                                style: GoogleFonts.prompt(
                                    color: Colors.blueAccent.shade700),
                                cursorColor: Colors.blueAccent.shade700,
                                enableSuggestions: false,
                                autocorrect: false,
                                initialValue:
                                    "${userProvider.userProfile.mobileNumber}",
                                decoration: InputDecoration(
                                  fillColor: Colors.blueAccent.shade700,
                                  prefixIcon: Icon(
                                    Icons.phone_android,
                                    color: Colors.blueAccent.shade700,
                                  ),
                                  enabledBorder: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.blueAccent),
                                  ),
                                  focusedBorder: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: Colors.orangeAccent.shade700),
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
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 5),
                                child: Text(
                                  "ตำแหน่งงาน",
                                  style: GoogleFonts.prompt(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent[700],
                                  ),
                                ),
                              ),
                              SizedBox(
                                  child: DropdownButtonFormField<String>(
                                value: dropdownValue,
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.blueAccent,
                                  size: 20.09,
                                ),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  // labelText: 'ตำแหน่งหน่วยงาน',
                                  // labelStyle:  GoogleFonts.prompt(color: Colors.blueAccent.shade700),
                                  prefixIcon: const Icon(
                                    Icons.supervised_user_circle,
                                    color: Colors.blueAccent,
                                  ),
                                  enabledBorder: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.blueAccent),
                                  ),
                                  focusedBorder: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: Colors.orangeAccent.shade700),
                                  ),
                                ),
                                iconSize: 24,
                                elevation: 16,
                                style: GoogleFonts.prompt(
                                    color: Colors.blueAccent),
                                dropdownColor: Colors.white,
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
                                  'ชาวบ้าน',
                                  'เจ้าหน้าที่อบต',
                                  'เจ้าหน้าที่อำเภอ',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: GoogleFonts.prompt(
                                        color: Colors.blueAccent.shade700,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              )),
                              SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 10.0),
                                    primary: Colors.orange.shade700,
                                    shape: StadiumBorder(),
                                  ),
                                  child: Text(
                                    'บันทึกการแก้ไข',
                                    style: GoogleFonts.prompt(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      formKey.currentState!.save();
                                    }

                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                              title: const Text(
                                                  'ข้อมูลที่จะอัปเดต'),
                                              content: Text(
                                                  'ชื่อนาม-สกุล : ${profile.firstName} ${profile.lastName}  \n'
                                                  'เบอร์โทร : ${profile.mobileNumber} \n'
                                                  'ตำแหน่งงาน : ${profile.position} \n'),
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
                                                          style: GoogleFonts
                                                              .prompt(
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                      ),
                                                      RaisedButton(
                                                        onPressed: () {
                                                          userProvider
                                                              .updateProfileToFirestore(
                                                                  userProvider
                                                                      .userProfile
                                                                      .uid
                                                                      .toString(),
                                                                  profile);
                                                          Navigator
                                                              .restorablePopAndPushNamed(
                                                                  context,
                                                                  '/dataUser');
                                                        },
                                                        color: Colors.green,
                                                        child: Text(
                                                          'ยืนยัน',
                                                          style: GoogleFonts
                                                              .prompt(
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                      ),
                                                    ])
                                              ],
                                            ));
                                  },
                                ),
                              ),
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
