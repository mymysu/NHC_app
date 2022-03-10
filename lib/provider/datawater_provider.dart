import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:water_resources_application/model/data_water.dart';
import 'package:water_resources_application/model/data_water_basic.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as path;
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

  // set Water(String? data) {
  //   return _water.province = data;
  // }

  void setProfileFromFirestore(Water? data) {
    _water.id = data!.id;
    _water.type = data.type;
    _water.nameTH = data.nameTH;
    _water.longitude = data.longitude;
    _water.latitude = data.latitude;
    _water.nameProvince = data.nameProvince;
    _water.nameDistrict = data.nameDistrict;
    _water.nameSubdistrict = data.nameSubdistrict;
    _water.image = data.image;

    // notifyListeners();
  }

  void addWaterResourcesToFirestore(
    BuildContext context,
    DataWater dataWater,
    WaterSourceDetails typeWater,
    UserProvider userProvider,
  ) async {
    List<String> fileName = [];
    List<File> imageFile = [];
    List<String> nameFileImage = [];
    String nameFileXml = "";
    print((dataWater.water.kmlFile ?? "NULL") != "NULL");

    if ((dataWater.water.image ?? "NULL") != "NULL") {
      for (int i = 0; i < dataWater.water.image!.length; i++) {
        fileName.add(path.basename(dataWater.water.image![i].path));
        imageFile.add(File(dataWater.water.image![i].path));
      }
      for (int i = 0; i < dataWater.water.image!.length; i++) {
        try {
          print("up imageFile");
          await FirebaseStorage.instance
              .ref("/image_resources/${fileName[i]}")
              .putFile(
                  imageFile[i],
                  SettableMetadata(customMetadata: {
                    'uploaded_by': userProvider.userProfile.uid.toString(),
                    'description': typeWater.typeWater.toString()
                  }))
              .then((value) {
            nameFileImage.add(value.ref.name);
          });
        } on FirebaseException catch (error) {
          print("error up imageFile");
          print(error.code);
        }
      }
    } else if ((dataWater.water.kmlFile ?? "NULL") != "NULL") {
      print("up kmlFile");
      try {
        await FirebaseStorage.instance
            .ref("/kml_resources/${dataWater.water.kmlFile!.names[0]}")
            .putFile(
                File(dataWater.water.kmlFile!.files[0].path!),
                SettableMetadata(customMetadata: {
                  'uploaded_by': userProvider.userProfile.uid.toString(),
                  'description': typeWater.typeWater.toString()
                }))
            .then((value) => nameFileXml = "value.ref.name");
      } on FirebaseException catch (error) {
        print("error up kmlFile");
        print(error.code);
      }
    } else {
      print(" up json");
      try {
        DateTime now = DateTime.now();
        final DateFormat formatter = DateFormat('dd/MM/yyyy');
        final String formatted = formatter.format(now);

        await FirebaseFirestore.instance
            .collection("water_source_information_new")
            .add({
          "nameTH": dataWater.water.nameTH,
          "typeWater": typeWater.typeWater,
          "subtypeWater": typeWater.type_th,
          "nameFileXml": nameFileXml.toString(),
          "geographyId": dataWater.water.geographyId,
          "geography": dataWater.water.geography,
          "nameFileImage": nameFileImage,
          "provinceId": dataWater.water.provinceId,
          "districtId": dataWater.water.districtId,
          "subdistrictId": dataWater.water.subdistrictId,
          "nameProvince": dataWater.water.nameProvince,
          "nameDistrict": dataWater.water.nameDistrict,
          "nameSubdistrict": dataWater.water.nameSubdistrict,
          "latitude": dataWater.water.latitude,
          "longitude": dataWater.water.longitude,
          "note": dataWater.water.note,
          "uid": userProvider.userProfile.uid.toString(),
          "email": userProvider.userProfile.email,
          "date": formatted,
          "status": false
        }).then((value) {
          Fluttertoast.showToast(
              msg: "เพิ่มข้อมูลสำเสร็จ",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 15,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        });
      } on FirebaseException catch (error) {
        print("error up json");
        print(error.code);
      }
      // }
    }
    Navigator.restorablePushReplacementNamed(context, '/historyAdd');
    print(nameFileImage.length);
  }
}
