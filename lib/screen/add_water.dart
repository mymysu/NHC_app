import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:water_resources_application/model/data_mm_wtr_body.dart';
import 'dart:io';
import 'package:water_resources_application/provider/dataWater_provider.dart';
import 'package:water_resources_application/provider/user_provider.dart';
import 'package:water_resources_application/widget/dropdown_district_widget.dart';
import 'package:water_resources_application/widget/dropdown_province_widget.dart';
import 'package:water_resources_application/widget/dropdown_subdistrict_widget.dart';
import 'package:water_resources_application/widget/dropdown_typewater_widget.dart';

class AddWaterResourcesScreen extends StatefulWidget {
  const AddWaterResourcesScreen({Key? key}) : super(key: key);

  @override
  State<AddWaterResourcesScreen> createState() =>
      _AddWaterResourcesScreenState();
}

class _AddWaterResourcesScreenState extends State<AddWaterResourcesScreen> {
  late Position userLocation;
  late GoogleMapController mapController;
  String dropdownValue = 'One';
  late String _chosenValue = 'Node';
  String province = "1";
  String amphure = "1";
  String geography = "1";
  String tombon = "1";
  List<XFile>? imageFile;
  DataWater waterProvider = DataWater();
  DataNatWtrBody datawater = DataNatWtrBody();
  DateTime now = DateTime.now();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<Position> _getLocation() async {
    try {
      userLocation = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      print("ERROR");
    }
    return userLocation;
  }

  final formKey = GlobalKey<FormState>();
  String _name = '';
  void _submit() {
    // validate all the form fields
    if (formKey.currentState!.validate()) {
      // on success, notify the parent widget
      // widget.onSubmit(_name);
    }
  }

  Future<void> _showDialogImage(BuildContext context) {
    return showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.87,
              height: MediaQuery.of(context).size.height * 0.6,
              padding: EdgeInsets.all(8),
              color: Colors.white,
              child: Stack(
                  // alignment: Alignment.center,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.image_outlined,
                              color: Color(0xFF1BC0C5),
                              size: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "อัพโหลดรูปภาพประกอบข้อมูลแหล่งน้ำ",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  decorationThickness: 0.5),
                            ),
                          ],
                        ),
                        Divider(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.29,
                          color: Colors.white70,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Card(
                                    child: (imageFile == null)
                                        ? image()
                                        : imageFile!.length >= 1
                                            ? Image.file(
                                                File(imageFile![0].path),
                                                fit: BoxFit.scaleDown,
                                                height: 67,
                                                width: 100,
                                              )
                                            : image(),
                                  ),
                                  Card(
                                    child: (imageFile == null)
                                        ? image()
                                        : imageFile!.length >= 2
                                            ? Image.file(
                                                File(imageFile![1].path),
                                                fit: BoxFit.scaleDown,
                                                height: 67,
                                                width: 100,
                                              )
                                            : image(),
                                  ),
                                  Card(
                                    child: (imageFile == null)
                                        ? image()
                                        : imageFile!.length >= 3
                                            ? Image.file(
                                                File(imageFile![2].path),
                                                fit: BoxFit.scaleDown,
                                                height: 67,
                                                width: 100,
                                              )
                                            : image(),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Card(
                                    child: (imageFile == null)
                                        ? image()
                                        : imageFile!.length >= 4
                                            ? Image.file(
                                                File(imageFile![3].path),
                                                fit: BoxFit.scaleDown,
                                                height: 67,
                                                width: 100,
                                              )
                                            : image(),
                                  ),
                                  Card(
                                    child: (imageFile == null)
                                        ? image()
                                        : imageFile!.length >= 5
                                            ? Image.file(
                                                File(imageFile![4].path),
                                                fit: BoxFit.scaleDown,
                                                height: 67,
                                                width: 100,
                                              )
                                            : image(),
                                  ),
                                  Card(
                                    child: (imageFile == null)
                                        ? image()
                                        : imageFile!.length >= 6
                                            ? Image.file(
                                                File(imageFile![5].path),
                                                fit: BoxFit.scaleDown,
                                                height: 67,
                                                width: 100,
                                              )
                                            : image(),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Card(
                                    child: (imageFile == null)
                                        ? Container(
                                            height: 67,
                                            width: 100,
                                            child: Icon(
                                              Icons.image_outlined,
                                              color: Colors.blueAccent[100],
                                              size: 50,
                                            ),
                                          )
                                        : Image.file(
                                            File(imageFile![6].path),
                                            height: 67,
                                            width: 100,
                                          ),
                                  ),
                                  Card(
                                    child: (imageFile == null)
                                        ? Container(
                                            height: 67,
                                            width: 100,
                                            child: Icon(
                                              Icons.image_outlined,
                                              color: Colors.blueAccent[100],
                                              size: 50,
                                            ),
                                          )
                                        : Image.file(
                                            File(imageFile![7].path),
                                            // fit: BoxFit.scaleDown,
                                            height: 67,
                                            width: 100,
                                          ),
                                  ),
                                  Card(
                                    child: (imageFile == null)
                                        ? Container(
                                            height: 67,
                                            width: 100,
                                            child: Icon(
                                              Icons.image_outlined,
                                              color: Colors.blueAccent[100],
                                              size: 50,
                                            ),
                                          )
                                        : Image.file(
                                            File(imageFile![7].path),
                                            // fit: BoxFit.scaleDown,
                                            height: 67,
                                            width: 100,
                                          ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                            height: MediaQuery.of(context).size.width * 0.04),
                        Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.5),
                          child: OutlineButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16.0))),
                            padding: EdgeInsets.all(8),
                            onPressed: () {
                              _openGallery(context);
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.upload_sharp,
                                  color: Color(0xFF1BC0C5),
                                  size:
                                      MediaQuery.of(context).size.width * 0.06,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),
                                Text(
                                  "อัพเดทรูปภาพ",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 12),
                                ),
                              ],
                            ),
                            // color: const Color(0xFF1BC0C5),
                          ),
                        ),
                        Container(
                          // color: Colors.amberAccent,
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.07,
                              left: MediaQuery.of(context).size.width * 0.35),
                          child: Row(
                            children: [
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(25.0))),
                                onPressed: () {
                                  imageFile = null;
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "ยกเลิก",
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Colors.black12,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(16.0))),
                                onPressed: () {
                                  waterProvider.water.image = imageFile;
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "ยืนยัน",
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: const Color(0xFF1BC0C5),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ]),
            ),
          );
        });
  }

  late Position _currentPosition;

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        waterProvider.curren = true;
        waterProvider.water.geom = _currentPosition;
        print(_currentPosition);
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("เพิ่มข้อมูลแหล่งน้ำ"),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      // color: const Color(0xff7c94b6),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.3, 1],
                          colors: [Colors.green, Colors.blue]),

                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      // borderRadius: BorderRadius.circular(12),
                    ),
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Row(
                      children: [
                        Container(
                            child: Text(
                          "อัพรูปภาพประกอบ \nข้อมูลแหล่งน้ำ",
                          style: new TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                        Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.08,
                              left: MediaQuery.of(context).size.width * 0.3),
                          child: FloatingActionButton(
                            onPressed: () => {_showDialogImage(context)},
                            child: Icon(Icons.add_a_photo),
                            backgroundColor: Colors.brown[900],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text("ชือภาษาไทย"),
                        TextFormField(
                          style: TextStyle(color: Colors.blue),
                          cursorColor: Colors.blueAccent,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            fillColor: Colors.blue,
                          ),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'กรุณาเพิ่มชื่อ';
                            }
                            if (text.length < 4) {
                              return 'Too short';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            waterProvider.water.nameTH = value;
                            print(waterProvider.water.nameTH);
                          },
                        ),
                        Divider(),
                        const Text("หน่วยงานที่รับผิดชอบ"),
                        TextFormField(
                          style: TextStyle(color: Colors.blue),
                          cursorColor: Colors.blueAccent,
                          enableSuggestions: false,
                          autocorrect: false,
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: 'กรุณากรอกชื่อข้อมูลแห่งน้ำ '),
                          ]),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            print(waterProvider.water.nameTH != null
                                ? waterProvider.water.nameTH
                                : "00");
                            waterProvider.water.nameTH = value;

                            print(waterProvider.water.nameTH);
                          },
                        ),
                        const Text("ประเภทแหล่งน้ำ"),
                        TypeWaterWidget(),
                        Divider(),
                        const Text("พิกัดตำแหน่ง"),
                        Row(
                          children: [
                            SizedBox(
                                width: 80,
                                child:

                                    //  TextFormField(
                                    //   style: TextStyle(color: Colors.blueAccent),
                                    //   initialValue: waterProvider.curren
                                    //       ? "${waterProvider.water.geom.altitude}"
                                    //       : "",
                                    //   decoration: InputDecoration(
                                    //     // icon: Icon(Icons.face_unlock_sharp),
                                    //     // labelText: '',
                                    //     hintText: "",
                                    //     hintStyle: TextStyle(
                                    //         color: Colors.blueGrey[300],
                                    //         fontSize: 14),
                                    //   ),
                                    //   onSaved: (String? val) {
                                    //     // name = val;
                                    //   },
                                    //   // onChanged: (String? val) {
                                    //   //   name = val;
                                    //   // },
                                    // ),
                                    Text(
                                  waterProvider.curren
                                      ? "${waterProvider.water.geom.latitude}"
                                      : "",
                                )),
                            SizedBox(width: 25),
                            SizedBox(
                                width: 80,
                                child: Text(
                                  waterProvider.curren
                                      ? "${waterProvider.water.geom.longitude}"
                                      : "",
                                )
                                // TextFormField(
                                //   style: TextStyle(color: Colors.blueAccent),
                                //   initialValue: waterProvider.curren
                                //       ? "${waterProvider.water.geom.longitude}"
                                //       : "",
                                //   decoration: InputDecoration(
                                //     // icon: Icon(Icons.face_unlock_sharp),
                                //     // labelText: 'NAME SURNAME',
                                //     hintText: '',

                                //     hintStyle: TextStyle(
                                //         color: Colors.blueGrey[300],
                                //         fontSize: 14),
                                //   ),
                                //   onSaved: (String? val) {
                                //     // name = val;
                                //   },
                                //   // onChanged: (String? val) {
                                //   //   name = val;
                                //   // },
                                // ),
                                ),
                            SizedBox(width: 30),
                            ElevatedButton(
                              child: const Icon(
                                Icons.map_outlined,
                                color: Colors.white,

                                // size: 20,
                              ),
                              onPressed: _getCurrentLocation,
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              child: const Icon(
                                Icons.cloud_upload,
                                color: Colors.white,
                                // size: 20,
                              ),
                              onPressed: _name.isNotEmpty ? _submit : null,
                            )
                          ],
                        ),
                        Divider(),
                        Container(
                          child: Row(
                            children: [
                              Text("จังหวัด "),
                              SizedBox(
                                width: 50,
                              ),
                              SizedBox(
                                width: 200,
                                child: ProvinceWidget(),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text("อำเภอ"),
                              SizedBox(
                                width: 50,
                              ),
                              SizedBox(
                                width: 200,
                                child: DistrictWidget(),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text("ตำบล"),
                              SizedBox(
                                width: 50,
                              ),
                              SizedBox(
                                width: 200,
                                child: SubDistrictWidget(),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text("หมู่บ้าน"),
                              SizedBox(
                                width: 50,
                              ),
                              SizedBox(
                                width: 200,
                                child: TextFormField(
                                  style: TextStyle(color: Colors.blue),
                                  cursorColor: Colors.blueAccent,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  decoration: InputDecoration(
                                    fillColor: Colors.blue,
                                  ),
                                  onChanged: (value) {
                                    waterProvider.water.nameTH = value;
                                    print(waterProvider.water.nameTH);
                                  },
                                  onSaved: (value) {
                                    setState(() {
                                      waterProvider.water.village = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        Container(
                          child: Row(
                            children: [
                              Text("วันที่สำรวจแหล่งน้ำ"),
                              SizedBox(
                                width: 50,
                              ),
                              TextButton(
                                  onPressed: () {
                                    DatePicker.showDatePicker(
                                      context,
                                      showTitleActions: true,
                                      minTime: DateTime(2018, 3, 5),
                                      maxTime: DateTime(2019, 6, 7),
                                      theme: DatePickerTheme(
                                          headerColor: Colors.orange,
                                          backgroundColor: Colors.blue,
                                          itemStyle: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                          doneStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16)),
                                      locale: LocaleType.th,
                                      onChanged: (date) {
                                        print('change $date in time zone ' +
                                            date.timeZoneOffset.inHours
                                                .toString());
                                      },
                                      onConfirm: (date) {
                                        setState(() {
                                          datawater.surveyDate = date;
                                        });
                                        print('confirm $date');
                                      },
                                      currentTime: DateTime.now(),
                                    );
                                  },
                                  child: Text(
                                    DateFormat('dd-MM-yyyy')
                                        .format(now)
                                        .toString(),
                                    style: TextStyle(color: Colors.blue),
                                  )),
                            ],
                          ),
                        ),
                        Divider(),
                        Container(
                          child: Row(
                            children: [
                              Text("ความจุ"),
                              SizedBox(
                                width: 50,
                              ),
                              SizedBox(
                                width: 200,
                                child: TextFormField(
                                  style: TextStyle(color: Colors.blue),
                                  cursorColor: Colors.blueAccent,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    fillColor: Colors.blue,
                                  ),
                                  onSaved: (value) {
                                    setState(() {
                                      datawater.capacity =
                                          double.parse('$value');
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        Container(
                          child: Row(
                            children: [
                              Text("พื้นที่ผิวน้ำ"),
                              SizedBox(
                                width: 50,
                              ),
                              SizedBox(
                                width: 200,
                                child: TextFormField(
                                  style: TextStyle(color: Colors.blue),
                                  cursorColor: Colors.blueAccent,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    fillColor: Colors.blue,
                                  ),
                                  onSaved: (value) {
                                    setState(() {
                                      datawater.surfaceArea =
                                          double.parse('$value');
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        Container(
                          child: Row(
                            children: [
                              Text("ปริมาณน้ำที่ใช้ได้"),
                              SizedBox(
                                width: 50,
                              ),
                              SizedBox(
                                width: 200,
                                child: TextFormField(
                                  style: TextStyle(color: Colors.blue),
                                  cursorColor: Colors.blueAccent,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    fillColor: Colors.blue,
                                  ),
                                  validator: (text) {
                                    if (text == null || text.isEmpty) {
                                      return 'กรุณาเพิ่มความจุน้ำ';
                                    }
                                    if (text.length < 4) {
                                      return 'Too short';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    setState(() {
                                      datawater.agencyReceivingTransfer =
                                          double.parse('$value');
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        ElevatedButton(
                          // only enable the button if the text is not empty
                          onPressed: () async {
                            print("ลงทะเบียนน้ำ");
                            formKey.currentState!.save();

                            await FirebaseFirestore.instance
                                .collection("water_source_information_new")
                                .add({
                              "developmentAgencyMain": "",
                              "developmentAgencyRegion": "",
                              "developmentDate": "",
                              "improvementAgencyMain": "",
                              "improvementAgencyRegion": "",
                              "updateDate": "",
                              "auditingAgencyMain": "",
                              "auditingAgencyRegion": "",
                              "inspectionDate": "",
                              "surveyDate": "",
                              "capacity": "",
                              "surfaceArea": "",
                              "availableWater": "",
                              "agencyReceivingTransfer": "",
                              "transferFrom": "",
                              "agency": "",
                              "transferStatus": "",
                              "uid": userProvider.userProfile.uid,
                              "email": userProvider.userProfile.email,
                              "status": false
                            });
                            print("ลงทะเบียนน้ำได้แล้ว");
                          },

                          child: Text(
                            'Submit',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // dropdownposition(),
                  Divider(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().pickMultiImage(imageQuality: 8);

    setState(() {
      imageFile = pickedFile;
    });

    Navigator.pop(context);
    _showDialogImage(context);
  }
}

image() {
  return Container(
    height: 67,
    width: 100,
    child: Icon(
      Icons.image_outlined,
      color: Colors.blueAccent[100],
      size: 50,
    ),
  );
}








// Future<List<Province>> getProvincedropdown(filter) async {
//   var response = await Dio().get(
//     "https://raw.githubusercontent.com/kongvut/thai-province-data/master/api_province_with_amphure_tombon.json",
//     queryParameters: {"filter": filter},
//   );

//   final data = response.data;
//   print(data);
//   if (data != null) {
//     // print(Province.fromJsonList(data));
//     return Province.fromJsonList(data);
//   }

//   return [];
// }
