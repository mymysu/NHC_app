import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:water_resources_application/model/province.dart';
import 'package:water_resources_application/model/province_th.dart';
import 'package:water_resources_application/provider/dataWater_provider.dart';

class ProvincesData {
  static Future<List<ProvinceTH>> getProvincedropdown(
      DataWater waterProvider, BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString("assets/data/th_province.json");
    final body = json.decode(data);
    if (body != null) {
      return ProvinceTH.fromJsonList(body, waterProvider);
    }
    return [];
  }
}
