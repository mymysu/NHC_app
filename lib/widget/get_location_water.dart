import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:water_resources_application/api/district_api.dart';
import 'package:water_resources_application/api/province_api.dart';
import 'package:water_resources_application/api/subdistrict_api.dart';
import 'package:water_resources_application/model/district_th.dart';
import 'package:water_resources_application/model/province_th.dart';
import 'package:water_resources_application/model/subdistricts_th.dart';
import 'package:water_resources_application/provider/dataWater_provider.dart';

class LocationWaterSource {
  static Future<Position> getGeoLocationPosition() async {
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

  static Future<void> getAddressFromLatLong(
    Position position,
    DataWater waterProvider,
    BuildContext context,
  ) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];

    List<District> A = await DistrictData.getDistrictdropdown(
        waterProvider, context, waterProvider.water.provinceId.toString());
    List<ProvinceTH> B =
        await ProvincesData.getProvincedropdown(waterProvider, context);
    List<SubDistrictTH> C = await SubDistrictData.getSubDistrictDropdown(
        waterProvider, context, waterProvider.water.districtId.toString());

    String nameSubdistrict = (place.locality ?? place.subLocality) ?? "NULL";
    String nameDistrict = place.subAdministrativeArea ?? "NULL";
    String nameProvince = place.administrativeArea ?? "NULL";

    nameSubdistrict = nameSubdistrict.replaceAll(RegExp("ตำบล| |แขวง"), "");
    nameDistrict = nameDistrict.replaceAll(RegExp("อำเภอ| |เขต"), "");
    nameProvince = nameProvince.replaceAll(RegExp("จังหวัด| "), "");

    final int index1 = waterProvider.water.listNameProvince!
        .indexWhere(((value) => value.nameProvince == nameProvince));
    final int index2 = waterProvider.water.listNameDistrict!
        .indexWhere(((value) => value.nameDistrict == nameDistrict));
    final int index3 = waterProvider.water.listNameSubdistrict!
        .indexWhere(((value) => value.nameSubdistrict == nameSubdistrict));

    waterProvider.water.provinceId =
        waterProvider.water.listNameProvince![index1].provinceId;
    waterProvider.water.districtId =
        waterProvider.water.listNameDistrict![index2].districtId;
    waterProvider.water.subdistrictId =
        waterProvider.water.listNameSubdistrict![index3].subdistrictId;

    waterProvider.water.nameProvince = nameProvince;
    waterProvider.water.nameDistrict = nameDistrict;
    waterProvider.water.nameSubdistrict = nameSubdistrict;

    waterProvider.water.latitude = position.latitude;
    waterProvider.water.longitude = position.longitude;
    print(waterProvider.water.nameProvince);
    // setState(() {

    // });
  }
}
