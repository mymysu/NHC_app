import 'package:water_resources_application/model/data_water_basic.dart';
import 'package:flutter/foundation.dart';

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
    _water.latitude = data.latitude;
    _water.longitude = data.longitude;
    _water.province = data.province;
    _water.district = data.district;
    _water.subdistrict = data.subdistrict;
    _water.image = data.image;

    // notifyListeners();
  }
}
