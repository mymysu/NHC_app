import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:water_resources_application/model/province.dart';
import 'package:water_resources_application/model/province_th.dart';

class ProvincesData {
  static Future<List<ProvinceTH>> getProvincedropdown(
      BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString("assets/data/provinces.json");
    final body = json.decode(data);
    if (body != null) {
      return ProvinceTH.fromJsonList(body);
    }
    return [];
  }
}
