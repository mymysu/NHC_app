import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:water_resources_application/app_styles.dart';

import 'package:water_resources_application/provider/dataWater_provider.dart';

class Location extends StatefulWidget {
  Location({
    Key? key,
  }) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
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
                              // Container(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: Text('Note'),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: Text(
                              //     'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt'
                              //     ' ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud'
                              //     ' exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
                              //     ' Duis aute irure dolor in reprehenderit in voluptate velit esse cillum '
                              //     'dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,'
                              //     ' sunt in culpa qui officia deserunt mollit anim id est laborum.',
                              //     style: TextStyle(fontSize: 12),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ));
        });
  }

  Future<void> getLocation(
      BuildContext context, DataWater waterProvider) async {
    late Position _currentPosition;
    Geolocator.requestPermission();
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      _currentPosition = position;
      waterProvider.water.latitude = _currentPosition.latitude;
      waterProvider.water.longitude = _currentPosition.longitude;
      setState(() {
        _currentPosition = position;
        waterProvider.curren = true;
        waterProvider.water.geom = _currentPosition;
        showProgress = true;
        Navigator.pop(context);
      });
    }).catchError((e) {
      print(e);
    });
  }

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
              height: size_page.height * 0.18,
              width: size_page.width * 0.9,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.location_on_outlined,
                    color: Color(0xFF11048B),
                    size: 70,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                      Container(
                          margin: EdgeInsets.all(5),
                          child: Text(
                            "${(waterProvider.water.latitude ?? "NULL") == "NULL" ? "0" : waterProvider.water.longitude!.toStringAsFixed(6)} , ${(waterProvider.water.longitude ?? "NULL") == "NULL" ? "0" : waterProvider.water.latitude!.toStringAsFixed(6)}",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.prompt(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF11048B),
                            ),
                          )),
                      // SizedBox(
                      //   height: 5,
                      // ),
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
                              // _showDialogFile(context);
                              showAlertDialog(context);
                              await getLocation(context, waterProvider);
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
