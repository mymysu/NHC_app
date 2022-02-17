import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:water_resources_application/model/data_mm_wtr_body.dart';
import 'package:water_resources_application/provider/dataWater_provider.dart';
import 'package:water_resources_application/provider/user_provider.dart';
import 'package:water_resources_application/widget/button_upfileKML.dart';
import 'package:water_resources_application/widget/dropdown_district_widget.dart';
import 'package:water_resources_application/widget/dropdown_province_widget.dart';
import 'package:water_resources_application/widget/dropdown_subdistrict_widget.dart';
import 'package:water_resources_application/widget/dropdown_typewater_widget.dart';
import 'package:water_resources_application/widget/imageUp.dart';
import 'package:path/path.dart' as path;
import 'dart:io';

class AddWaterResourcesScreen extends StatefulWidget {
  AddWaterResourcesScreen({Key? key, required this.typeWater})
      : super(key: key);
  String typeWater;
  @override
  State<AddWaterResourcesScreen> createState() =>
      _AddWaterResourcesScreenState();
}

class _AddWaterResourcesScreenState extends State<AddWaterResourcesScreen> {
  DataNatWtrBody datawater = DataNatWtrBody();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    DataWater dataWater = Provider.of<DataWater>(context);
    var height = MediaQuery.of(context).size.height;
    var size_page = MediaQuery.of(context).size;
    late Position _currentPosition;
    var heightbox = MediaQuery.of(context).size.height * 0.7;
    return Scaffold(
      backgroundColor: const Color(0xFF11048B),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height - heightbox - 100,
              margin: EdgeInsets.only(top: 100),
              child: Text(
                'เพิ่มข้อมูลแหล่งน้ำ',
                textAlign: TextAlign.start,
                style: GoogleFonts.prompt(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Form(
              key: formKey,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment(200, 100),
                    // margin: EdgeInsets.only(top: 100),
                    height: height + (height * 0.7),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[100],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'ประเภทแหล่งน้ำ',
                            style: GoogleFonts.prompt(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF11048B),
                            ),
                          ),
                        ),
                        Divider(),
                        Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: Color(0xFF11048B), //color of border
                              width: 3, //width of border
                            ),
                          ),
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              '${widget.typeWater}',
                              style: GoogleFonts.prompt(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF11048B),
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          height: 30,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'ที่อยู่',
                            style: GoogleFonts.prompt(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF11048B),
                            ),
                          ),
                        ),
                        Divider(
                          height: 30,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'จังหวัด',
                            textAlign: TextAlign.right,
                            style: GoogleFonts.prompt(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF11048B),
                            ),
                          ),
                        ),
                        Divider(),
                        ProvinceWidget(),
                        Divider(),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'อำเภอ',
                            style: GoogleFonts.prompt(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF11048B),
                            ),
                          ),
                        ),
                        Divider(),
                        DistrictWidget(),
                        Divider(),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'ตำบล',
                            style: GoogleFonts.prompt(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF11048B),
                            ),
                          ),
                        ),
                        Divider(),
                        SubDistrictWidget(),
                        Divider(),
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'ละติจู',
                                style: GoogleFonts.prompt(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF11048B),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'ลองติจู',
                                style: GoogleFonts.prompt(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF11048B),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            Container(
                              height: size_page.height * 0.07,
                              width: size_page.width * 0.3,
                              alignment: Alignment.topLeft,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Color(0xFF11048B), //color of border
                                  width: 3, //width of border
                                ),
                              ),
                              child: Text(
                                dataWater.curren
                                    ? "${dataWater.water.latitude}"
                                    : "",
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                            ),
                            Container(
                                height: size_page.height * 0.07,
                                width: size_page.width * 0.3,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Color(0xFF11048B), //color of border
                                    width: 3, //width of border
                                  ),
                                ),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  dataWater.curren
                                      ? "${dataWater.water.longitude}"
                                      : "",
                                )),
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            RaisedButton(
                              color: Color(0xFF11048B),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.pin_drop_rounded,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "พิกัดปัจจุบัน",
                                    style: GoogleFonts.prompt(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              onPressed: () async {
                                await Geolocator.requestPermission();
                                Geolocator.getCurrentPosition(
                                        desiredAccuracy: LocationAccuracy.best,
                                        forceAndroidLocationManager: true)
                                    .then((Position position) {
                                  _currentPosition = position;
                                  dataWater.water.latitude =
                                      _currentPosition.latitude;
                                  dataWater.water.longitude =
                                      _currentPosition.longitude;
                                  setState(() {
                                    _currentPosition = position;
                                    dataWater.curren = true;
                                    dataWater.water.geom = _currentPosition;
                                  });
                                }).catchError((e) {
                                  print(e);
                                });
                              },
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                            ),
                            Consumer<DataWater>(
                                builder: (context, dataWater, child) =>
                                    RaisedButton(
                                      color: Color(0xFFFA7D00),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.upload_file_outlined,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "ไฟล์ .KML",
                                            style: GoogleFonts.prompt(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                      onPressed: () async {
                                        dataWater.water.kmlFile =
                                            await FilePicker.platform.pickFiles(
                                          type: FileType.custom,
                                          allowedExtensions: ['kml'],
                                        );
                                        print(dataWater.water.kmlFile);
                                      },
                                    ))
                          ],
                        ),
                        Divider(),
                        ImageUP(),
                        Divider(
                          height: 20,
                        ),
                        TextFormField(
                          // keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "คำอธิบายเพิ่มติม",
                            hintStyle: GoogleFonts.prompt(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              // color: Color(0xFF40C0FF),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.pink, width: 3),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFF11048B), width: 3),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                          ),
                          onSaved: (value) => dataWater.water.note = value,
                        ),
                        Divider(
                          height: 20,
                        ),
                        RaisedButton(
                          // only enable the button if the text is not empty
                          color: Color(0xFFFA7D00),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                          ),

                          onPressed: () async {
                            print("ลงทะเบียนน้ำ");
                            formKey.currentState!.save();
                            print(dataWater.water.latitude);
                            print(dataWater.water.latitude);

                            dataWater.addWaterResourcesToFirestore(
                                dataWater, widget.typeWater, userProvider);
                            formKey.currentState!.reset();
                            Navigator.pushReplacementNamed(
                                context, '/historyAdd');
                            Fluttertoast.showToast(
                              msg: "เพิ่มข้อมูลสำเสร็จ",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                            );
                            // print("ยืนยันการเพิ่มข้อมูลแหล่งน้ำ");
                          },

                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'ยืนยันการเพิ่มข้อมูลแหล่งน้ำ',
                              style: GoogleFonts.prompt(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
