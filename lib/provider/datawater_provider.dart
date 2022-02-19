import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
      DataWater dataWater, String typeWater, UserProvider userProvider) async {
    List<String> fileName = [];
    List<File> imageFile = [];
    List<String> nameFileImage = [];
    String nameFileXml = "";
    if ((dataWater.water.image ?? "NULL") != "NULL") {
      for (int i = 0; i < dataWater.water.image!.length; i++) {
        fileName.add(path.basename(dataWater.water.image![i].path));
        imageFile.add(File(dataWater.water.image![i].path));
        nameFileImage.add("/image_resources/${fileName[i]}");
      }
      for (int i = 0; i < dataWater.water.image!.length; i++) {
        try {
          print(11);
          await FirebaseStorage.instance
              .ref("/image_resources/${fileName[i]}")
              .putFile(
                  imageFile[i],
                  SettableMetadata(customMetadata: {
                    'uploaded_by': userProvider.userProfile.uid.toString(),
                    'description': typeWater
                  }));
        } on FirebaseException catch (error) {
          print(error.code);
          print(1);
        }
      }
    } else if ((dataWater.water.kmlFile ?? "NULL") != "NULL") {
      try {
        await FirebaseStorage.instance
            .ref("/kml_resources/${dataWater.water.kmlFile!.names[0]}")
            .putFile(
                File(dataWater.water.kmlFile!.files[0].path!),
                SettableMetadata(customMetadata: {
                  'uploaded_by': userProvider.userProfile.uid.toString(),
                  'description': typeWater
                }))
            .then((value) => nameFileXml =
                "/kml_resources/${dataWater.water.kmlFile!.names[0]}");
      } on FirebaseException catch (error) {
        print(error.code);
      }
    } else {
      try {
        await FirebaseFirestore.instance
            .collection("water_source_information_new")
            .add({
          "typeWater": typeWater,
          "nameFileXml": nameFileXml.toString(),
          "geographyId": dataWater.water.geographyId,
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
          "date": DateTime.now(),
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
        print(error.code);
      }
    }
  }
}
