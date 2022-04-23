import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:water_resources_application/api/district_api.dart';
import 'package:water_resources_application/api/province_api.dart';
import 'package:water_resources_application/api/subdistrict_api.dart';
import 'package:water_resources_application/model/data_water_basic.dart';
import 'package:water_resources_application/provider/dataWater_provider.dart';

Future<Position> getGeoLocationPosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    await Geolocator.openLocationSettings();
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
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
      print(value[0]);
      await DistrictData.getDistrictdropdown(
          waterProvider, context, waterProvider.water.provinceId.toString());
      await ProvincesData.getProvincedropdown(waterProvider, context);
      await SubDistrictData.getSubDistrictDropdown(
          waterProvider, context, waterProvider.water.districtId.toString());

      String b = value[0].street.toString();

      final splitted = b.split(' ');
      print(splitted);
      String? nameSubdistrict;
      String? nameDistrict;
      String? nameProvince;

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

        if (splitted[i].contains("เขต")) {
          if (splitted[i].length > 3) {
            nameDistrict = splitted[i].replaceAll(RegExp(" |เขต"), "");
          } else {
            nameDistrict = splitted[i + 1];
          }
        } else if (splitted[i].contains("อำเภอ")) {
          if (splitted[i].length > 5) {
            nameDistrict = splitted[i].replaceAll(RegExp("อำเภอ| "), "");
          } else {
            nameDistrict = splitted[i + 1];
          }
        }
      }

      nameProvince = value[0].administrativeArea ?? "NULL";

      nameProvince = nameProvince.replaceAll(RegExp("จังหวัด| "), "");

      final int index1 = waterProvider.water.listNameProvince!
          .indexWhere(((value) => value.nameProvince == nameProvince));
      final int index2 = waterProvider.water.listNameDistrict!
          .indexWhere(((value) => value.nameDistrict == nameDistrict));
      final int index3 = waterProvider.water.listNameSubdistrict!
          .indexWhere(((value) => value.nameSubdistrict == nameSubdistrict));
      // print("index1 $index1");
      // print("index2 $index2");
      // print("index3 $index3");

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

      return waterProvider.water;
    });
