import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:water_resources_application/api/district_api.dart';
import 'package:water_resources_application/api/province_api.dart';
import 'package:water_resources_application/api/subdistrict_api.dart';
import 'package:water_resources_application/model/data_water_basic.dart';
import 'package:water_resources_application/provider/dataWater_provider.dart';

Future<Position> getGeoLocationPosition(
  BuildContext context,
) async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  print(" serviceEnabled $serviceEnabled");
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services..
    Navigator.pop(context);
    Fluttertoast.showToast(
      msg:
          "ไม่ได้เปิดใช้งานบริการระบุตำแหน่ง\nกรุณาเปิดใช้งานบริการระบุตำแหน่ง\nก่อนดำเนินการต่อไป",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 500,
      backgroundColor: Colors.orange,
      textColor: Colors.white,
    );
    Timer(Duration(seconds: 3), () async {
      await Geolocator.openLocationSettings();
    });

    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    if (permission == LocationPermission.denied) {
      Navigator.pop(context);
      Fluttertoast.showToast(
        msg: "การอนุญาตตำแหน่งถูกปฏิเสธ",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 200,
        backgroundColor: Colors.orange,
        textColor: Colors.white,
      );

      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    Navigator.pop(context);
    Fluttertoast.showToast(
      msg: "การอนุญาตตำแหน่งถูกปฏิเสธ\nกรุณาอนุญาตการเข้าถึงตำแหน่ง",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 200,
      backgroundColor: Colors.orange,
      textColor: Colors.white,
    );

    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }
  return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
}

Future<Water> getAddressFromLatLong(
  double latitude,
  double longitude,
  DataWater waterProvider,
  BuildContext context,
) async =>
    await placemarkFromCoordinates(latitude, longitude).then((
      value,
    ) async {
      // print(value[0]);
      await DistrictData.getDistrictdropdown(
          waterProvider, context, waterProvider.water.provinceId.toString());
      await ProvincesData.getProvincedropdown(waterProvider, context);
      await SubDistrictData.getSubDistrictDropdown(
          waterProvider, context, waterProvider.water.districtId.toString());
      print(value[0].name);
      String b = value[0].street.toString();
      print(b);

      final splitted = b.split(' ');
      String? nameSubdistrict = "";
      String? nameDistrict = "";
      String? nameProvince = "";

      for (int i = 0; i < splitted.length; i++) {
        // print("splitted[i] :  ${splitted[i]}  ");
        // print("splitted[i].length :  ${splitted[i].length}  ");
        if (splitted[i].contains("ตำบล") || splitted[i].contains("แขวง")) {
          if (splitted[i].length > 4) {
            nameSubdistrict = splitted[i].replaceAll(RegExp("ตำบล| |แขวง"), "");
          } else {
            nameSubdistrict = splitted[i + 1];
          }
        }

        if (splitted[i].contains("เขต") &&
            !splitted[i].contains("อำเภอ") &&
            !splitted[i].contains("ตำบล") &&
            splitted[i] != "") {
          print(splitted[i].contains("เขต"));
          print(splitted[i]);
          if (splitted[i].length > 3) {
            nameDistrict = splitted[i].replaceAll(RegExp(" |เขต"), "");
            print("nameDistrict1 $nameDistrict");
          } else {
            nameDistrict = splitted[i + 1];
            print("nameDistrict2 $nameDistrict");
          }
        } else if (splitted[i].contains("อำเภอ")) {
          if (splitted[i].length > 5) {
            nameDistrict = splitted[i].replaceAll(RegExp("อำเภอ| "), "");
            print("nameDistrict3 $nameDistrict");
          } else {
            nameDistrict = splitted[i + 1];
            print("nameDistrict4 $nameDistrict");
          }
        }
      }
      // print(nameProvince);
      // print(nameDistrict);
      // print(nameSubdistrict);

      nameProvince = value[0].administrativeArea ?? "NULL";

      nameProvince = nameProvince.replaceAll(RegExp("จังหวัด| "), "");

      final int index1 = waterProvider.water.listNameProvince!
          .indexWhere(((value) => value.nameProvince == nameProvince));

      final int index2 = waterProvider.water.listNameDistrict!
          .indexWhere(((value) => value.nameDistrict == nameDistrict));

      final int index3 = waterProvider.water.listNameSubdistrict!
          .indexWhere(((value) => value.nameSubdistrict == nameSubdistrict));

      waterProvider.water.geographyId =
          waterProvider.water.listNameProvince![index1].geographiesId;

      waterProvider.water.provinceId =
          waterProvider.water.listNameProvince![index1].provinceId;

      waterProvider.water.districtId =
          waterProvider.water.listNameDistrict![index2].districtId;

      waterProvider.water.subdistrictId =
          waterProvider.water.listNameSubdistrict![index3].subdistrictId;

      waterProvider.water.nameGeography =
          waterProvider.water.listNameProvince![index1].namegeographies;

      waterProvider.water.nameProvince = nameProvince;

      waterProvider.water.nameDistrict = nameDistrict;
      waterProvider.water.nameSubdistrict = nameSubdistrict;

      waterProvider.water.latitude = latitude;
      waterProvider.water.longitude = longitude;
      // print(waterProvider.water.nameSubdistrict);
      return waterProvider.water;
    });
