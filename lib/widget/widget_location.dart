import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:water_resources_application/api/district_api.dart';
import 'package:water_resources_application/api/province_api.dart';
import 'package:water_resources_application/api/subdistrict_api.dart';
import 'package:water_resources_application/app_styles.dart';
import 'package:water_resources_application/model/district_th.dart';
import 'package:water_resources_application/model/province_th.dart';
import 'package:water_resources_application/model/subdistricts_th.dart';

import 'package:water_resources_application/provider/dataWater_provider.dart';
import 'package:water_resources_application/widget/get_location_water.dart';

class LocationWidget extends StatefulWidget {
  LocationWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  bool showProgress = false;
  final formKey = GlobalKey<FormState>();
  Future<void> _showDialogFile(BuildContext context) {
    var size_page = MediaQuery.of(context).size;
    return showDialog(
        context: context,
        builder: (context) {
          return Consumer<DataWater>(
              builder: (context, waterProvider, child) => AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          20.0,
                        ),
                      ),
                    ),
                    contentPadding: EdgeInsets.only(
                      top: 10.0,
                    ),
                    title: Text(
                      "ตำแหน่งแหล่งน้ำ",
                      style: GoogleFonts.prompt(
                        fontSize: 24.0,
                        color: aPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      child: Form(
                        key: formKey,
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "กรอกตำแหน่ง",
                                  style:
                                      GoogleFonts.prompt(color: aPrimaryColor),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'กรอกเลขละติจู',
                                      labelText: 'ละติจู'),
                                  onSaved: (value) {
                                    setState(() {
                                      waterProvider.water.latitude =
                                          double.parse(value!);
                                    });
                                  },
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'กรอกเลขลองติจู',
                                      labelText: 'ลองติจู'),
                                  onSaved: (value) {
                                    setState(() {
                                      waterProvider.water.longitude =
                                          double.parse(value!);
                                    });
                                  },
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 60,
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    formKey.currentState!.save();

                                    Navigator.of(context).pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.orange,
                                    // fixedSize: Size(250, 50),
                                  ),
                                  child: Text(
                                    "ยืนยัน",
                                    style: GoogleFonts.prompt(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ));
        });
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
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

  String location = 'Null, Press Button';
  String Address = 'search';

  @override
  Widget build(BuildContext context) {
    var size_page = MediaQuery.of(context).size;
    FilePickerResult? kmlFile = null;

    return Consumer<DataWater>(
        builder: (context, waterProvider, child) => Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white, //color of border
                  width: 3, //width of border
                ),
              ),
              height: size_page.height * 0.35,
              width: size_page.width * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                        "ตำแหน่งแหล่งน้ำ",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.prompt(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF11048B),
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, bottom: 12),
                    child: RichText(
                      text: TextSpan(
                          text: 'ละติจู , ลองติจู : ',
                          style: GoogleFonts.prompt(
                            color: Color(0xFF11048B),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  " ${(waterProvider.water.latitude ?? "NULL") == "NULL" ? "0" : waterProvider.water.longitude!.toStringAsFixed(6)} , ${(waterProvider.water.longitude ?? "NULL") == "NULL" ? "0" : waterProvider.water.latitude!.toStringAsFixed(6)}",
                              style: GoogleFonts.prompt(
                                  color: Colors.blueAccent, fontSize: 16),
                            )
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, bottom: 12),
                    child: RichText(
                      text: TextSpan(
                          text: 'จังหวัด : ',
                          style: GoogleFonts.prompt(
                            color: Color(0xFF11048B),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: " ${waterProvider.water.nameProvince}",
                              style: GoogleFonts.prompt(
                                  color: Colors.blueAccent, fontSize: 16),
                            )
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, bottom: 12),
                    child: RichText(
                      text: TextSpan(
                          text: 'อำเภอ : ',
                          style: GoogleFonts.prompt(
                            color: Color(0xFF11048B),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: " ${waterProvider.water.nameDistrict}",
                              style: GoogleFonts.prompt(
                                  color: Colors.blueAccent, fontSize: 16),
                            )
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, bottom: 12),
                    child: RichText(
                      text: TextSpan(
                          text: 'ตำบล : ',
                          style: GoogleFonts.prompt(
                            color: Color(0xFF11048B),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: " ${waterProvider.water.nameSubdistrict}",
                              style: GoogleFonts.prompt(
                                  color: Colors.blueAccent, fontSize: 16),
                            )
                          ]),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          RaisedButton(
                            color: Colors.green,
                            child: Text(
                              "พิกัดปัจจุบัน",
                              style: GoogleFonts.prompt(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () async {
                              showAlertDialog(context);
                              Position position = await LocationWaterSource
                                  .getGeoLocationPosition();
                              location =
                                  'Lat: ${position.latitude} , Long: ${position.longitude}';
                              LocationWaterSource.getAddressFromLatLong(
                                position,
                                waterProvider,
                                context,
                              );
                            },
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          RaisedButton(
                            color: Colors.orange,
                            child: Text(
                              "กรอกตำแหน่ง",
                              style: GoogleFonts.prompt(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () => {_showDialogFile(context)},
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ));
  }
}
