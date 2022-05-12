import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:water_resources_application/model/data_water.dart';
import 'package:water_resources_application/model/data_water_basic.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as path;
import 'package:water_resources_application/model/history_water.dart';
import 'dart:io';

import 'package:water_resources_application/provider/user_provider.dart';

class DataWater with ChangeNotifier {
  Water _water = Water();
  late String _province = "3";
  bool _curren = false;

  Water get water => _water;

  String get province => _province;
  set province(String e) {
    _province = e;
  }

  bool get curren => _curren;
  set curren(bool e) {
    _curren = e;
  }

  set water(var value) {
    return _water = value;
  }

  void addWaterResourcesToFirestore(
    BuildContext context,
    DataWater dataWater,
    UserProvider userProvider,
  ) async {
    List<String> fileNameURL = [];
    List<File> imageFile = [];
    DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('ddMMyyyyhhmmss');
    // final DateFormat formatter2 = DateFormat('dd/MM/yyyy hh:mm:ss');
    final String formatted = formatter.format(now);
    // final String formatted2 = formatter2.format(now);

    String FileNameimage =
        "/image_resources/${formatted}-${dataWater.water.typeID}-${dataWater.water.subTypeID}";
    // String ckkmlFile = (dataWater.water.kmlFile ?? "NULL").toString();
    String ckImage = (dataWater.water.image ?? "NULL").toString();
    print(formatted);

    if (ckImage != "NULL") {
      for (int i = 0; i < dataWater.water.image!.length; i++) {
        imageFile.add(File(dataWater.water.image![i].originalPath));
      }
      for (int i = 0; i < dataWater.water.image!.length; i++) {
        try {
          print("up imageFile");
          await FirebaseStorage.instance
              .ref(
                  "$FileNameimage/${formatted}-${dataWater.water.typeID}-${dataWater.water.subTypeID}-${i + 1}")
              .putFile(
                  imageFile[i],
                  SettableMetadata(customMetadata: {
                    'uploaded_by': userProvider.userProfile.uid.toString(),
                    'description':
                        "Type_ID: ${dataWater.water.typeID}\nType_Abbr: ${dataWater.water.typeAbbr}\nType_TH: ${dataWater.water.typeTH}\nsubType_ID: ${dataWater.water.subTypeID}\nsubType_EN: ${dataWater.water.subtypeAbbr}\nsubType_TH: ${dataWater.water.subTypeTH}"
                  }))
              .then((value) {
            value.ref.getDownloadURL().then((value) {
              // print(value);
              fileNameURL.add(value);
              // print(fileNameURL[i]);
              // print(fileNameURL.length);
            });
          });
        } on FirebaseException catch (error) {
          print("error up imageFile");
          print(error.code);
        }
      }
      await Future.delayed(Duration(seconds: 1));
    }
    print(" up json");
    try {
      await FirebaseFirestore.instance
          .collection("water_source_information_new")
          .doc(
              "${formatted}${dataWater.water.typeID}${dataWater.water.subTypeID}")
          .set({
        // "name_TH": dataWater.water.nameTH ?? "",
        // "URL_FileXml": dataWater.water.urlkmlFile,
        "type_Abbr": dataWater.water.typeAbbr,
        "type_TH": dataWater.water.typeTH,
        "type_ID": dataWater.water.typeID,
        "subType_EN": dataWater.water.subtypeAbbr,
        "subType_TH": dataWater.water.subTypeTH,
        "subType_ID": dataWater.water.subTypeID,
        "URL_FileImage": fileNameURL,
        "latitude": dataWater.water.latitude,
        "longitude": dataWater.water.longitude,
        "geography_ID": dataWater.water.geographyId,
        "province_ID": dataWater.water.provinceId,
        "district_ID": dataWater.water.districtId,
        "subdistrict_ID": dataWater.water.subdistrictId,
        "nameGeography": dataWater.water.nameGeography,
        "nameProvince": dataWater.water.nameProvince,
        "nameDistrict": dataWater.water.nameDistrict,
        "nameSubdistrict": dataWater.water.nameSubdistrict,
        "note": dataWater.water.note ?? "",
        "uid": userProvider.userProfile.uid.toString(),
        "email": userProvider.userProfile.email,
        "date": now,
        "status": false
      }).then((value) {
        Fluttertoast.showToast(
            msg: "เพิ่มข้อมูลสำเสร็จ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 15,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      });
    } on FirebaseException catch (error) {
      print("error up json");
      print(error.code);
    }
    Navigator.pop(context);
    Navigator.popAndPushNamed(context, '/historyAdd');
  }
}
