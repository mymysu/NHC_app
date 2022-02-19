import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:water_resources_application/provider/dataWater_provider.dart';

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

class ImageUP extends StatefulWidget {
  ImageUP({
    Key? key,
  }) : super(key: key);

  @override
  State<ImageUP> createState() => _ImageUPState();
}

class _ImageUPState extends State<ImageUP> {
  Future<void> _showDialogImage(BuildContext context, List<XFile>? imageFile) {
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
                      height: size_page.height * 0.6,
                      padding: EdgeInsets.all(8),
                      color: Color(0xFF11048B),
                      child: Column(
                        children: [
                          Container(
                            height: 40,
                            color: Color(0xFF11048B),
                            child: Text(
                              "อัพโหลดรูปภาพประกอบข้อมูลแหล่งน้ำ",
                              style: GoogleFonts.prompt(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.29,
                            // color: Color(0xFF11048B),
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
                                          ? image()
                                          : imageFile!.length >= 7
                                              ? Image.file(
                                                  File(imageFile![6].path),
                                                  height: 67,
                                                  width: 100,
                                                )
                                              : image(),
                                    ),
                                    Card(
                                      child: (imageFile == null)
                                          ? image()
                                          : imageFile!.length >= 8
                                              ? Image.file(
                                                  File(imageFile![7].path),
                                                  // fit: BoxFit.scaleDown,
                                                  height: 67,
                                                  width: 100,
                                                )
                                              : image(),
                                    ),
                                    Card(
                                      child: (imageFile == null)
                                          ? image()
                                          : imageFile!.length >= 9
                                              ? Image.file(
                                                  File(imageFile![8].path),
                                                  // fit: BoxFit.scaleDown,
                                                  height: 67,
                                                  width: 100,
                                                )
                                              : image(),
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
                                left: MediaQuery.of(context).size.width * 0.45),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0))),

                              onPressed: () async {
                                List<XFile>? pickedFile = await ImagePicker()
                                    .pickMultiImage(imageQuality: 8);
                                // waterProvider.water.image = pickedFile;
                                Navigator.pop(context);
                                _showDialogImage(context, pickedFile);
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.upload_sharp,
                                    color: Color(0xFF11048B),
                                    size: 25,
                                  ),
                                  Text(
                                    "อัพเดทรูปภาพ",
                                    style: GoogleFonts.prompt(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF11048B),
                                    ),
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
                                    setState(() {
                                      waterProvider.water.image = [];
                                    });
                                    imageFile = null;
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
                                    setState(() {
                                      waterProvider.water.image = imageFile;
                                    });

                                    Navigator.pop(context);
                                    print(waterProvider.water.image);
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
    List<XFile>? imageFile = [];

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
                    Icons.cloud_upload,
                    color: Color(0xFF40C0FF),
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
                            "ภาพถ่ายแหล่งน้ำ\nบริเวณโดยรอบ",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.prompt(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF40C0FF),
                            ),
                          )),
                      Container(
                          margin: EdgeInsets.all(8),
                          child: Text(
                            "${(waterProvider.water.image ?? "NULL") == "NULL" ? "0" : waterProvider.water.image.length} / 9",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.prompt(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF40C0FF),
                            ),
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: size_page.width * 0.4,
                        child: RaisedButton(
                          color: Color(0xFF11048B),
                          child: Text(
                            "อัปโหลดรูปภาพ",
                            style: GoogleFonts.prompt(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () =>
                              {_showDialogImage(context, imageFile)},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ));
  }
}
