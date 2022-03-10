import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:water_resources_application/model/data_water.dart';
import 'package:water_resources_application/provider/dataWater_provider.dart';
import 'package:water_resources_application/provider/user_provider.dart';
import 'package:water_resources_application/widget/dropdown_district_widget.dart';
import 'package:water_resources_application/widget/dropdown_province_widget.dart';
import 'package:water_resources_application/widget/dropdown_subdistrict_widget.dart';
import 'package:water_resources_application/widget/image_up.dart';
import 'package:water_resources_application/widget/location.dart';
import 'package:water_resources_application/widget/xml_up.dart';

class AddWaterResourcesScreen extends StatefulWidget {
  AddWaterResourcesScreen({Key? key, required this.typeWater})
      : super(key: key);
  WaterSourceDetails typeWater;
  @override
  State<AddWaterResourcesScreen> createState() =>
      _AddWaterResourcesScreenState();
}

class _AddWaterResourcesScreenState extends State<AddWaterResourcesScreen> {
  // DataNatWtrBody datawater = DataNatWtrBody();
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
                    height: height + (height * 0.8),
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
                        Text(
                          'ชื่อแหล่งน้ำ',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.prompt(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF11048B),
                          ),
                        ),
                        TextFormField(
                          // keyboardType: TextInputType.multiline,

                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            // hintText: "",
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
                          onSaved: (value) => dataWater.water.nameTH = value,
                        ),
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
                              '${widget.typeWater.type_th}',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
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
                        Divider(),
                        Location(),
                        Divider(),
                        XmlUP(),
                        Divider(),
                        ImageUP(),
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
                            if (userProvider.userProfile.uid == null) {
                              Fluttertoast.showToast(
                                msg: " ลงทะเบียนเข้าใช้งานก่อน ",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                              );
                            } else {
                              formKey.currentState!.save();
                              dataWater.addWaterResourcesToFirestore(context,
                                  dataWater, widget.typeWater, userProvider);
                              Navigator.popAndPushNamed(context, '/historyAdd');
                              formKey.currentState!.reset();
                              Fluttertoast.showToast(
                                msg: "เพิ่มข้อมูลสำเสร็จ",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                              );
                            }
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
