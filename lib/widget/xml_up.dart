import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:water_resources_application/provider/dataWater_provider.dart';

class XmlUP extends StatefulWidget {
  XmlUP({
    Key? key,
  }) : super(key: key);

  @override
  State<XmlUP> createState() => _XmlUPState();
}

class _XmlUPState extends State<XmlUP> {
  Future<void> _showDialogFile(BuildContext context) {
    var size_page = MediaQuery.of(context).size;
    return showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Consumer<DataWater>(
              builder: (context, waterProvider, child) => Center(
                    child: Container(
                      width: size_page.width * 0.87,
                      height: size_page.height * 0.45,
                      padding: EdgeInsets.all(8),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            height: size_page.height * 0.3,
                            width: size_page.width * 0.87,
                            color: Colors.orange,
                            // margin: EdgeInsets.only(
                            // left: MediaQuery.of(context).size.width * 0.45),
                            child: FlatButton(
                              onPressed: () async {
                                waterProvider.water.kmlFile =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: ['kml'],
                                );
                                Navigator.pop(context);
                                _showDialogFile(context);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.drive_folder_upload_outlined,
                                    color: Colors.white,
                                    size: 80,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "อัปโหลดไฟล์ .XML",
                                    style: GoogleFonts.prompt(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "${(waterProvider.water.kmlFile ?? "NULL") == "NULL" ? "ว่าง" : waterProvider.water.kmlFile!.names}",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.prompt(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              // color: const Color(0xFF1BC0C5),
                            ),
                          ),
                          Container(
                            // color: Colors.amberAccent,
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.06,
                                left: MediaQuery.of(context).size.width * 0.35),
                            child: Row(
                              children: [
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25.0))),
                                  onPressed: () {
                                    setState(() {
                                      waterProvider.water.kmlFile = null;
                                    });

                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "ยกเลิก",
                                    style: GoogleFonts.prompt(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(16.0))),
                                  onPressed: () {
                                    var temp = waterProvider.water.kmlFile;
                                    setState(() {
                                      waterProvider.water.kmlFile = temp;
                                    });
                                    Navigator.pop(context);
                                    print(waterProvider.water.kmlFile);
                                  },
                                  child: Text(
                                    "ยืนยัน",
                                    style: GoogleFonts.prompt(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  color: Colors.green,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ));
        });
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
              height: size_page.height * 0.2,
              width: size_page.width * 0.9,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.upload_file_outlined,
                    color: Color(0xFFFA7D00),
                    size: 70,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.all(8),
                          child: Text(
                            "ไฟล์ .KML",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.prompt(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFA7D00),
                            ),
                          )),
                      Container(
                          margin: EdgeInsets.all(8),
                          child: Text(
                            "${(waterProvider.water.kmlFile ?? "NULL") == "NULL" ? "ว่าง" : waterProvider.water.kmlFile!.names}",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.prompt(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFA7D00),
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: size_page.width * 0.4,
                        child: RaisedButton(
                          color: Colors.orange.shade900,
                          child: Text(
                            "อัปโหลดไฟล์",
                            style: GoogleFonts.prompt(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () => {_showDialogFile(context)},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ));
  }
}
